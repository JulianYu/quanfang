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
        }
        
        if ([viewController isKindOfClass:NSClassFromString(@"MineBankCardAddViewController")]) {
            self.footerView.y = self.addTableView.bottom+20;
            [viewController.view addSubview:self.addTableView];
            [viewController.view addSubview:self.footerView];
            [self.footerView update];
        }
        
        if ([viewController isKindOfClass:NSClassFromString(@"MineBankCardToSelectViewController" )]) {
            [viewController.view addSubview:self.selectTableView];
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
@end
