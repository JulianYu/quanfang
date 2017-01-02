//
//  HomeDistributePointsViewController.m
//  yxl-ios
//
//  Created by mac on 17/1/2.
//  Copyright © 2017年 孙若淮. All rights reserved.
//

#import "HomeDistributePointsViewController.h"
#import "HomeConvertViewModel.h"
@interface HomeDistributePointsViewController ()
@property( nonatomic, strong) HomeConvertViewModel        * viewModel;
@end

@implementation HomeDistributePointsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewModel];
}
-(HomeConvertViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[HomeConvertViewModel alloc]initWithViewController:self];
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
