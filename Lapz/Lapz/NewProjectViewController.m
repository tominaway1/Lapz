//
//  NewProjectViewController.m
//  Lapz
//
//  Created by Alexander Papathomas on 4/18/15.
//  Copyright (c) 2015 Tommy Inouye. All rights reserved.
//

#import "NewProjectViewController.h"
#import "TakeFirstPhotoViewController.h"

#import <AssetsLibrary/AssetsLibrary.h>

@interface NewProjectViewController ()

@end

@implementation NewProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"make_new_project"]) {
        
//        ALAssetsLibrary lib = [[ALAssetsLibrary alloc] init];
//        [lib addAssetsGroupAlbumWithName:[NSString stringWithFormat:@"Lapzer - %@",self.projectNameField.text] resultBlock:^(ALAssetsGroup *group) {
//        
//        } failureBlock:^(NSError *error) {
//            <#code#>
//        }];
        
        TakeFirstPhotoViewController *vc = segue.destinationViewController;
        vc.projectName = self.projectNameField.text;
    }
}


@end
