//
//  MineBalanceViewModel.m
//  yxl-ios
//
//  Created by mac on 16/12/23.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineBalanceViewModel.h"
#import "MineBalanceHeaderView.h"
#import "MineBalanceTableView.h"
@interface MineBalanceViewModel ()
@property( nonatomic, strong) MineBalanceHeaderView         * headerView;
@property( nonatomic, strong) MineBalanceTableView          * tableView;
@end
@implementation MineBalanceViewModel
- (instancetype)initWithViewController:(YXLBaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        if ([viewController isMemberOfClass:NSClassFromString(@"MineBalanceViewController")]) {
            [viewController.view addSubview:self.headerView];
            [viewController.view addSubview:self.tableView];
        }
        if ([viewController isMemberOfClass:NSClassFromString(@"MineBalanceRechargeViewController")]) {
            
        }
        if ([viewController isMemberOfClass:NSClassFromString(@"MineBalanceWithdrawViewController")]) {
            
        }
    }
    return self;
}
-(MineBalanceHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[MineBalanceHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/4)];
    }
    return _headerView;
}
-(MineBalanceTableView *)tableView{
    if (!_tableView) {
        _tableView = [[MineBalanceTableView alloc]initWithFrame:CGRectMake(0, self.headerView.bottom,SCREEN_WIDTH , SCREEN_HEIGHT-self.headerView.height)];
    }
    return _tableView;
}
@end
