//
//  MineBankCardViewModel.m
//  yxl-ios
//
//  Created by mac on 16/12/21.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineBankCardViewModel.h"
#import "MineBankCardTableView.h"
#import "MineCommonFooterView.h"
#import "MineBankCardAddTableView.h"
#import "MineBankCardSelectTableView.h"
#import "MineBalanceBankCardTableView.h"
@interface MineBankCardViewModel ()
@property( nonatomic, strong) MineBankCardTableView                 * bankCardTableView;
@property( nonatomic, strong) MineCommonFooterView                  * footerView;
@property( nonatomic, strong) MineBankCardAddTableView              * addTableView;
@property( nonatomic, strong) MineBankCardSelectTableView           * selectTableView;
@property( nonatomic, strong) MineBalanceBankCardTableView          * balanceTableView;
@end
@implementation MineBankCardViewModel
- (instancetype)initWithViewController:(YXLBaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        if ([viewController isKindOfClass:NSClassFromString(@"MineBankCardListViewController")]) {
            self.footerView.y = self.bankCardTableView.bottom+20;
            [viewController.view addSubview:self.bankCardTableView];
            [viewController.view addSubview:self.footerView];
            [self.footerView update];
            [self getMyBankCard];
        }
        
        if ([viewController isKindOfClass:NSClassFromString(@"MineBankCardAddViewController")]) {
            self.footerView.y = self.addTableView.bottom+20;
            [viewController.view addSubview:self.addTableView];
            [viewController.view addSubview:self.footerView];
            [self.footerView update];
            [self addBankCard];
        }
        
        if ([viewController isKindOfClass:NSClassFromString(@"MineBankCardToSelectViewController" )]) {
            [viewController.view addSubview:self.selectTableView];
            [self getBankList];
        }
        
        if ([viewController isMemberOfClass:NSClassFromString(@"MineBalanceRechargeBankCardViewController")]) {
            self.footerView.y = self.balanceTableView.bottom+20;
            [viewController.view addSubview:self.balanceTableView];
            [viewController.view addSubview:self.footerView];
            [self.footerView update];
        }
        
    }
    return self;
}
-(MineBalanceBankCardTableView *)balanceTableView{
    if (!_balanceTableView) {
        _balanceTableView = [[MineBalanceBankCardTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    }
    return _balanceTableView;
}
-(MineBankCardTableView *)bankCardTableView{
    if (!_bankCardTableView) {
        _bankCardTableView = [[MineBankCardTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 160)];
    }
    return _bankCardTableView;
}
-(MineBankCardAddTableView *)addTableView{
    if (!_addTableView) {
        _addTableView = [[MineBankCardAddTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44*5)];
    }
    return _addTableView;
}
-(MineBankCardSelectTableView *)selectTableView{
    if (!_selectTableView) {
        _selectTableView = [[MineBankCardSelectTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _selectTableView;
}
-(MineCommonFooterView *)footerView{
    if (!_footerView) {
        _footerView = [[MineCommonFooterView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    }
    return _footerView;
}
-(void)getMyBankCard{
    NSString *url = [NSString stringWithFormat:@"%@/ApiPersonal/myBankcard",[ServerConfig sharedServerConfig].url];
    Session *session = [UserModel sharedUserModel].session;
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"session":[session mj_keyValues]}];
    [NetManager requestWithType:HttpRequestTypePost UrlString:url Parameters:params SuccessBlock:^(id response) {
        STATUS *status = [STATUS mj_objectWithKeyValues:[response objectForKey:@"status"]];
        if (status.succeed == 1) {
            
        }
        else{
            [YXLBaseViewModel presentFailureHUD:status];
        }
    } FailureBlock:^(NSError *error) {
    } progress:nil];

}

-(void)getBankList{

    NSString *url = [NSString stringWithFormat:@"%@/ApiOther/bankList",[ServerConfig sharedServerConfig].url];
    
    [NetManager requestWithType:HttpRequestTypePost UrlString:url Parameters:nil SuccessBlock:^(id response) {
        STATUS *status = [STATUS mj_objectWithKeyValues:[response objectForKey:@"status"]];
        if (status.succeed == 1) {
            
        }
        else{
            [YXLBaseViewModel presentFailureHUD:status];
        }
    } FailureBlock:^(NSError *error) {
    } progress:nil];

}

-(void)addBankCard{

    
    NSString *url = [NSString stringWithFormat:@"%@/ApiPersonal/bankcardAdd",[ServerConfig sharedServerConfig].url];
    Session *session = [UserModel sharedUserModel].session;
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"session":[session mj_keyValues]}];
    [params setValue:@"小淮" forKey:@"realname"];
    [params setValue:@"12373837484746374647" forKey:@"cardnum"];
    [params setValue:@"1" forKey:@"bankfullname"];
    [params setValue:@"13822260454" forKey:@"mobile"];
    [NetManager requestWithType:HttpRequestTypePost UrlString:url Parameters:params SuccessBlock:^(id response) {
        STATUS *status = [STATUS mj_objectWithKeyValues:[response objectForKey:@"status"]];
        if (status.succeed == 1) {
            
        }
        else{
            [YXLBaseViewModel presentFailureHUD:status];
        }
    } FailureBlock:^(NSError *error) {
    } progress:nil];

}
@end
