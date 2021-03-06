//
//  TakeFirstPhotoViewController.h
//  Lapz
//
//  Created by Alexander Papathomas on 4/18/15.
//  Copyright (c) 2015 Tommy Inouye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface TakeFirstPhotoViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (readwrite) NSString *projectName;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, atomic) ALAssetsLibrary* library;

- (IBAction)takePhoto:(UIButton *)sender;
- (IBAction)selectPhoto:(UIButton *)sender;

@end

