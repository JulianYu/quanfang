//
//  MinePendingViewController.m
//  yxl-ios
//
//  Created by mac on 16/12/21.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MinePendingViewController.h"
#import "MinePendingViewModel.h"
@interface MinePendingViewController ()
@property( nonatomic, strong) MinePendingViewModel        * viewModel;
@end

@implementation MinePendingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewModel];
}

-(MinePendingViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[MinePendingViewModel alloc]initWithViewController:self];
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
