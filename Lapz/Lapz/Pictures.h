//
//  Pictures.h
//  Lapz
//
//  Created by Alexander Papathomas on 4/19/15.
//  Copyright (c) 2015 Tommy Inouye. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>




@interface Pictures : NSObject

-(instancetype)initWithPictures;
@property NSArray *imageArray;
@property NSMutableArray *mutableArray;
@property (strong, atomic) ALAssetsLibrary* library;
@property int count;
@property NSString *pathDir;


@end
