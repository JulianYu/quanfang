//
//  MineCommonFooterView.m
//  yxl-ios
//
//  Created by mac on 16/12/22.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineCommonFooterView.h"
#import "MineBankCardAddViewController.h"
#import "MineBalanceSuccessViewController.h"
#import "HomeVIPApplicationViewController.h"
#import "MineModifyPasswordViewController.h"
#import "MineTransactionPasswordViewController.h"
@implementation MineCommonFooterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildUI];
    }
    return self;
}
-(void)buildUI{
    self.button = [[UIButton alloc]initWithFrame:CGRectZero];
    [self addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(self);
        make.height.mas_equalTo(self);
        make.width.mas_equalTo(SCREEN_WIDTH*5/6);
    }];
    [self.button setBackgroundColor:SUN_GlobalNormalColor];
    [self.button SUN_SetCornerRadius:5];
    self.button.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.button setTintColor:SUN_GlobalWhiteColor];
}
-(void)update{
    if ([[self SUN_GetCurrentViewController] isMemberOfClass:NSClassFromString(@"MineModifyPasswordViewController")]) {
        [self resetButtonTitle:@"保存" titleColor:nil backgroundColor:nil tag:0];
    }
    if ([[self SUN_GetCurrentViewController] isMemberOfClass:NSClassFromString(@"MineTransactionPasswordViewController")]) {
        [self resetButtonTitle:@"确认" titleColor:nil backgroundColor:nil tag:1];
    }
    if ([[self SUN_GetCurrentViewController] isMemberOfClass:NSClassFromString(@"MineBankCardListViewController")]) {
        [self.button SUN_SetBordersWithColor:[UIColor SUN_ColorWithHexString:@"#CAE7B6" alpha:1] andCornerRadius:5 andWidth:1];
        [self resetButtonTitle:@"添加" titleColor:SUN_GlobalTextGreenColor backgroundColor:SUN_GlobalWhiteColor tag:2];
    }
    if ([[self SUN_GetCurrentViewController] isMemberOfClass:NSClassFromString(@"MineBankCardAddViewController")]) {
        [self resetButtonTitle:@"立即绑定" titleColor:nil backgroundColor:SUN_GlobalTextGreenColor tag:3];
    }
    if ([[self SUN_GetCurrentViewController] isMemberOfClass:NSClassFromString(@"HomeConvertViewController")]) {
        [self resetButtonTitle:@"兑换" titleColor:nil backgroundColor:SUN_GlobalTextGreenColor tag:4];
    }
    if ([[self SUN_GetCurrentViewController] isMemberOfClass:NSClassFromString(@"MineBalanceRechargeNumberViewController")]) {
        [self resetButtonTitle:@"充值" titleColor:nil backgroundColor:SUN_GlobalTextGreenColor tag:5];
    }
    
    if ([[self SUN_GetCurrentViewController]isMemberOfClass:NSClassFromString(@"MineBalanceRechargeBankCardViewController")]) {
        [self resetButtonTitle:@"生成汇款订单" titleColor:nil backgroundColor:SUN_GlobalTextGreenColor tag:6];
    }
    
    if ([[self SUN_GetCurrentViewController]isMemberOfClass:NSClassFromString(@"HomeVIPApplicationViewController")]) {
        [self resetButtonTitle:@"提交" titleColor:nil backgroundColor:SUN_GlobalNormalColor tag:7];
    }
    
    if ([[self SUN_GetCurrentViewController] isMemberOfClass:NSClassFromString(@"MineFeedBackViewController")]) {
        [self resetButtonTitle:@"提交" titleColor:nil backgroundColor:SUN_GlobalNormalColor tag:8];
    }
    if ([[self SUN_GetCurrentViewController] isMemberOfClass:NSClassFromString(@"HomeBuyStockPointsViewController")]) {
        [self resetButtonTitle:@"购买" titleColor:nil backgroundColor:SUN_GlobalTextGreenColor tag:9];
    }
}


-(void)resetButtonTitle:(NSString*)title titleColor:(UIColor*)color backgroundColor:(UIColor*)backgroundColor tag:(NSInteger)tag{
    if (color) {
        [self.button setTitleColor:color forState:UIControlStateNormal];
    }
    if (backgroundColor) {
        [self.button setBackgroundColor:backgroundColor];
    }
    if (title) {
        [self.button setTitle:title forState:UIControlStateNormal];
    }
    if (tag) {
        self.button.tag = tag;
    }
    [self.button addTarget:self action:@selector(commitBtnClick) forControlEvents:UIControlEventTouchUpInside];

}

-(void)commitBtnClick{
    switch (self.button.tag) {
        case 0:
            [((MineModifyPasswordViewController*)[self SUN_GetCurrentViewController]).viewModel modifyPasswordBtnClickBy:[self SUN_GetCurrentViewController]];
            break;
        case 1:
            [((MineTransactionPasswordViewController*)[self SUN_GetCurrentViewController]).viewModel setTransactionPasswordBy:[self SUN_GetCurrentViewController]];
            break;
        case 2:
        {
            MineBankCardAddViewController *vc = [MineBankCardAddViewController new];
            vc.title = @"添加银行卡";
            [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];
        }
            break;
        case 3:
            [[self SUN_GetCurrentNavigationController] popViewControllerAnimated:YES];
            break;
        case 5:
        {
            MineBalanceSuccessViewController *vc = [MineBalanceSuccessViewController new];
            vc.title = @"充值成功";
            [[self SUN_GetCurrentNavigationController]pushViewController:vc animated:YES];
            
        }
        case 7:
            [((HomeVIPApplicationViewController*)[self SUN_GetCurrentViewController]).viewModel commitBtnClick];
            break;
        default:
            break;
    }
    
}

@end
