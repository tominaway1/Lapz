//
//  Pictures.m
//  Lapz
//
//  Created by Alexander Papathomas on 4/19/15.
//  Copyright (c) 2015 Tommy Inouye. All rights reserved.
//

#import "Pictures.h"
#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@implementation Pictures

-(instancetype)initWithPictures:(NSString *) pathDir{
    self = [super init];
    self.pathDir = pathDir;
    return self;
}



@synthesize imageArray = _imageArray;
@synthesize mutableArray = _mutableArray;
@synthesize count = _count;
@synthesize library = _library;

-(void)readImages:(NSString*) pathDir{
    {
        _imageArray = [[NSArray alloc] init];
        _mutableArray =[[NSMutableArray alloc]init];
        NSMutableArray* assetURLDictionaries = [[NSMutableArray alloc] init];
        
        _library = [[ALAssetsLibrary alloc] init];
        
       
        // Load images from Shareaflash folder
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents folder
        NSString *documentdataPath = [documentsDirectory stringByAppendingPathComponent:pathDir];
        NSLog(@"documentdataPath %@",documentdataPath);
            

        void (^assetEnumerator)( ALAsset *, NSUInteger, BOOL *) = ^(ALAsset *result, NSUInteger index, BOOL *stop) {
            if(result != nil) {
                if([[result valueForProperty:ALAssetPropertyType] isEqualToString:ALAssetTypePhoto]) {
                    [assetURLDictionaries addObject:[result valueForProperty:ALAssetPropertyURLs]];
                    
                    NSURL *url = (NSURL*) [[result defaultRepresentation]url];
                    
                    [_library assetForURL:url resultBlock:^(ALAsset *asset) {
                        [_mutableArray addObject:asset];
                        
                        if ([_mutableArray count]==_count)
                        {
                            _imageArray =[[NSArray alloc] initWithArray:_mutableArray];
                            //[self allPhotosCollected:_imageArray];
                        }
                    }
                            failureBlock:^(NSError *error){ NSLog(@"operation was not successfull!"); } ];
                }
            }
        };
        NSMutableArray *assetGroups = [[NSMutableArray alloc] init];
        
        void (^ assetGroupEnumerator) ( ALAssetsGroup *, BOOL *)= ^(ALAssetsGroup *group, BOOL *stop) {
            if(group != nil) {
                [group enumerateAssetsUsingBlock:assetEnumerator];
                [assetGroups addObject:group];
                _count = [group numberOfAssets];
            }
        };
        assetGroups = [[NSMutableArray alloc] init];
        
        [_library enumerateGroupsWithTypes:ALAssetsGroupAll
                               usingBlock:assetGroupEnumerator
                             failureBlock:^(NSError *error) { NSLog(@"There is an error"); }];
    }
}

//-(void)allPhotosCollected:(NSArray*)imgArray{
//    //write your code here after getting all the photos from library...
//    NSLog(@"all pictures are %@",imgArray);
//    for (int i=0; i<imgArray.count; i++) {
//        
//        
//        UIImageView *img=[[UIImageView alloc] initWithImage:imgArray[i]];
//        img.frame=CGRectMake(10, 20+105*i, 200, 100);
//        [self.view addSubview:img];
//        
//    }

-(NSArray*) getPictures {
    return _imageArray;
    
}

@end
