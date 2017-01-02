//
//  MineTransactionPasswordViewController.m
//  yxl-ios
//
//  Created by mac on 16/12/22.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineTransactionPasswordViewController.h"

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
- (IBAction)PINBtnClick:(id)sender {
    [self.viewModel sendMobileCode:self.phoneTF.text];
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
