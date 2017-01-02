//
//  BusinessViewController.m
//  yxl-ios
//
//  Created by mac on 16/12/12.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "BusinessViewController.h"

@interface BusinessViewController ()

@end

@implementation BusinessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewModel];
}

-(BusinessViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[BusinessViewModel alloc]initWithViewController:self];
        
    }
    return _viewModel;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
