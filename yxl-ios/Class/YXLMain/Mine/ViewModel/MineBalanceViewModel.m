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
#import "MineCommonFooterView.h"
#import "MineBalanceRechargeNumberViewController.h"
#import "MineGoldSilverViewController.h"
#import "MineGoldSilverHeaderView.h"
#import "MineGoldSilverTableView.h"
@interface MineBalanceViewModel ()
@property( nonatomic, strong) MineBalanceHeaderView                 * headerView;
@property( nonatomic, strong) MineBalanceTableView                  * tableView;
@property( nonatomic, strong) MineBalanceRechargeTableView          * rechargeTableView;
@property( nonatomic, strong) MineBalanceWithdrawTableView          * withdrawTableView;
@property( nonatomic, strong) MineCommonFooterView                  * footerView;

@property( nonatomic, strong) MineGoldSilverHeaderView        * goldSilverHeaderView;
@property( nonatomic, strong) MineGoldSilverTableView        * goldSilverTableView;

@end
@implementation MineBalanceViewModel
- (instancetype)initWithViewController:(YXLBaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        if ([viewController isMemberOfClass:NSClassFromString(@"MineBalanceViewController")]) {
            [viewController.view addSubview:self.headerView];
            [viewController.view addSubview:self.tableView];
            [self getMyBalance];
        }
        if ([viewController isMemberOfClass:NSClassFromString(@"MineBalanceRechargeViewController")]) {
            [viewController.view addSubview:self.rechargeTableView];
        }
        if ([viewController isMemberOfClass:NSClassFromString(@"MineBalanceWithdrawViewController")]) {
            [viewController.view addSubview:self.withdrawTableView];
        }
        if ([viewController isMemberOfClass:NSClassFromString(@"MineBalanceRechargeNumberViewController")]) {
            self.footerView.y = ((MineBalanceRechargeNumberViewController*)viewController).numberView.bottom+20;
            [viewController.view addSubview:self.footerView];
            [self.footerView update];
        }
        if ([viewController isMemberOfClass:NSClassFromString(@"MineGoldSilverViewController")]) {
            [viewController.view addSubview:self.goldSilverHeaderView];
            [viewController.view addSubview:self.goldSilverTableView];
            self.goldSilverHeaderView.tag = ((MineGoldSilverViewController*)viewController).delegate;
            self.goldSilverTableView.tag = self.goldSilverHeaderView.tag;
        }
        
    }
    return self;
}
#pragma mark -lazy
-(MineCommonFooterView *)footerView{
    if (!_footerView) {
        _footerView = [[MineCommonFooterView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    }
    return _footerView;
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
-(MineGoldSilverHeaderView *)goldSilverHeaderView{
    if (!_goldSilverHeaderView) {
        _goldSilverHeaderView = [[MineGoldSilverHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/4)];
    }
    return _goldSilverHeaderView;
}
-(MineGoldSilverTableView *)goldSilverTableView{
    if (!_goldSilverTableView) {
        _goldSilverTableView = [[MineGoldSilverTableView alloc]initWithFrame:CGRectMake(0, self.goldSilverHeaderView.bottom, SCREEN_WIDTH, SCREEN_HEIGHT*3/4)];
    }
    return _goldSilverTableView;
}
#pragma mark - network requests
-(void)getMyBalance{
    NSString *url = [NSString stringWithFormat:@"%@/ApiPersonal/myBalance",[ServerConfig sharedServerConfig].url];
    Session *session = [UserModel sharedUserModel].session;
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"session":[session mj_keyValues]}];
    
    [NetManager requestWithType:HttpRequestTypePost UrlString:url Parameters:params SuccessBlock:^(id response) {
        STATUS *status = [STATUS mj_objectWithKeyValues:[response objectForKey:@"status"]];
        if (status.succeed == 1) {
            [UserModel sharedUserModel].user.balance = [response objectForKey:@"data"];
            self.headerView.balanceLabel.text = [UserModel sharedUserModel].user.balance;
        }
        else{
            [YXLBaseViewModel presentFailureHUD:status];
        }
    } FailureBlock:^(NSError *error) {
        [YXLBaseViewModel presentFailureHUD:nil];
    } progress:nil];

}
@end
