//
//  AddOnePictureViewController.h
//  Lapz
//
//  Created by Alexander Papathomas on 4/19/15.
//  Copyright (c) 2015 Tommy Inouye. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface AddOnePictureViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (readwrite) NSString *projectName;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, atomic) ALAssetsLibrary* library;

- (IBAction)takePhoto:(UIButton *)sender;

@end

