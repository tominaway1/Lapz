//
//  TimestampViewController.m
//  Lapz
//
//  Created by Alexander Papathomas on 4/19/15.
//  Copyright (c) 2015 Tommy Inouye. All rights reserved.
//

#import "TimestampViewController.h"
#import <UIKit/UIKit.h>
#import "Pictures.h"


@implementation TimestampViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    //init data model
    
    Pictures *p = [[Pictures alloc] initWithPictures:@"hi"];
    //pull first image from data model
    //push to view
    //loop waits
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imaheNamed:self.imageFileName]];
}

@end
