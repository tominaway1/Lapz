//
//  AddOnePictureViewController.m
//  Lapz
//
//  Created by Alexander Papathomas on 4/19/15.
//  Copyright (c) 2015 Tommy Inouye. All rights reserved.
//


#import "AddOnePictureViewController.h"
#import "PhotoGalleryViewController.h"
#import "OverlayView.h"
#import "ALAssetsLibrary+CustomPhotoAlbum.h"





//transform values for full screen support
#define CAMERA_TRANSFORM_X 1
#define CAMERA_TRANSFORM_Y 1.12412

//iphone screen dimensions
#define SCREEN_WIDTH  320
#define SCREEN_HEIGTH 480


@interface AddOnePictureViewController ()

@end

@implementation AddOnePictureViewController
@synthesize library;

#pragma mark - View lifecycle


- (void)viewDidUnload
{
    self.library = nil;
    [super viewDidUnload];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.library = [[ALAssetsLibrary alloc] init];
    self.title = self.projectName;
    // Do any additional setup after loading the view, typically from a nib.
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)takePhoto:(UIButton *)sender {
    OverlayView *overlay = [[OverlayView alloc]
                            initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGTH)];
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.cameraOverlayView = overlay;
    
    [self presentViewController:picker animated:YES completion:NULL];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    [self.library saveImage:chosenImage toAlbum:self.projectName withCompletionBlock:^(NSError *error) {
        if (error!=nil) {
            NSLog(@"Big error: %@", [error description]);
        }
    }];
    
    [picker dismissModalViewControllerAnimated:NO];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)saveImage: (UIImage*)image
{
    if (image != nil)
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                             NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString* path = [documentsDirectory stringByAppendingPathComponent: [NSString stringWithString: @"photo.png"] ];
        NSData* data = UIImagePNGRepresentation(image);
        [data writeToFile:path atomically:YES];
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"takePhoto"]) {
        
        //        ALAssetsLibrary lib = [[ALAssetsLibrary alloc] init];
        //        [lib addAssetsGroupAlbumWithName:[NSString stringWithFormat:@"Lapzer - %@",self.projectNameField.text] resultBlock:^(ALAssetsGroup *group) {
        //
        //        } failureBlock:^(NSError *error) {
        //            <#code#>
        //        }];
        
        PhotoGalleryViewController *vc = segue.destinationViewController;
        vc.projectName =self.projectName;
        
    }
}


@end





