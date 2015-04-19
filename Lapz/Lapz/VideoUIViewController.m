//
//  VideoViewController.m
//  Lapz
//
//  Created by Alexander Papathomas on 4/18/15.
//  Copyright (c) 2015 Tommy Inouye. All rights reserved.
//

#import "VideoUIViewController.h"

@interface VideoUIViewController ()

@end

@implementation VideoUIViewController

- (void)viewDidLoad {
    NSURL *movieURL = [NSURL URLWithString:@"http://example.com/somefile.mp4"];
    movieController = [[MPMoviePlayerViewController alloc] initWithContentURL:movieURL];
    [self presentMoviePlayerViewControllerAnimated:movieController];
    [movieController.moviePlayer play];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)introMovieFinished:(NSNotification *)notification
{
    NSLog(@"Video ended!");
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
