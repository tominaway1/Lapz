//
//  OverlayView.m
//  CameraOverlay
//
//  Created by Andreas Katzian on 12.05.10.
//  Copyright 2010 Blackwhale GmbH. All rights reserved.
//

#import "OverlayView.h"


@implementation OverlayView


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //clear the background color of the overlay
        self.opaque = YES;
        self.backgroundColor = [UIColor clearColor];
        self.alpha = .5;
		
        //load an image to show in the overlay
        UIImage *crosshair = [UIImage imageNamed:@"picture1.jpeg"];
        UIImageView *crosshairView = [[UIImageView alloc] 
									 initWithImage:crosshair];
        crosshairView.frame = CGRectMake(0,0,crosshair.size.width,crosshair.size.height);

		crosshairView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:crosshairView];
        }
    return self;
}




@end
