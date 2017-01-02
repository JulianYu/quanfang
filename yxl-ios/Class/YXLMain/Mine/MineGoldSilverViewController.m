//
//  MineGoldSilverViewController.m
//  yxl-ios
//
//  Created by mac on 16/12/30.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineGoldSilverViewController.h"
#import "MineBalanceViewModel.h"
@interface MineGoldSilverViewController ()
@property( nonatomic, strong) MineBalanceViewModel        * viewModel;
@end

@implementation MineGoldSilverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewModel];
}
-(MineBalanceViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[MineBalanceViewModel alloc]initWithViewController:self];
    }
    return _viewModel;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
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
