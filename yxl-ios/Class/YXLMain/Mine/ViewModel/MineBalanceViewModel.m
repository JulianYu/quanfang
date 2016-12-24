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
#import "MineBalanceRechargeTableView.h"
#import "MineBalanceWithdrawTableView.h"
@interface MineBalanceViewModel ()
@property( nonatomic, strong) MineBalanceHeaderView         * headerView;
@property( nonatomic, strong) MineBalanceTableView          * tableView;
@property( nonatomic, strong) MineBalanceRechargeTableView        * rechargeTableView;
@property( nonatomic, strong) MineBalanceWithdrawTableView        * withdrawTableView;
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
            [viewController.view addSubview:self.rechargeTableView];
        }
        if ([viewController isMemberOfClass:NSClassFromString(@"MineBalanceWithdrawViewController")]) {
            [viewController.view addSubview:self.withdrawTableView];
        }
    }
    return self;
}
-(MineBalanceWithdrawTableView *)withdrawTableView{
    if (!_withdrawTableView){
        _withdrawTableView = [[MineBalanceWithdrawTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _withdrawTableView;
}
-(MineBalanceRechargeTableView *)rechargeTableView{
    if (!_rechargeTableView) {
        _rechargeTableView = [[MineBalanceRechargeTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _rechargeTableView;
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
