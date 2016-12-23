//
//  MineTransactionPasswordViewController.m
//  yxl-ios
//
//  Created by mac on 16/12/22.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineTransactionPasswordViewController.h"
#import "MineSettingViewModel.h"
@interface MineTransactionPasswordViewController ()
@property( nonatomic, strong) MineSettingViewModel        * viewModel   ;
@end

@implementation MineTransactionPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewModel];
}
-(MineSettingViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[MineSettingViewModel alloc]initWithViewController:self];
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
