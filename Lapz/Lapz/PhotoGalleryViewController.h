//
//  PhotoGalleryViewController.h
//  Lapz
//
//  Created by Alexander Papathomas on 4/19/15.
//  Copyright (c) 2015 Tommy Inouye. All rights reserved.
//

#ifndef Lapz_PhotoGalleryViewController_h
#define Lapz_PhotoGalleryViewController_h


#endif


#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface PhotoGalleryViewController : UIViewController

@property (readwrite) NSString *projectName;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, atomic) ALAssetsLibrary* library;


@end