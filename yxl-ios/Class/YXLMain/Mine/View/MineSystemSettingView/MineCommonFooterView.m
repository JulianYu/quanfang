//
//  MineCommonFooterView.m
//  yxl-ios
//
//  Created by mac on 16/12/22.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineCommonFooterView.h"
#import "MineBankCardAddViewController.h"
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
        [self.button setTitle:@"保存" forState:UIControlStateNormal];
    }
    if ([[self SUN_GetCurrentViewController] isMemberOfClass:NSClassFromString(@"MineTransactionPasswordViewController")]) {
        [self.button setTitle:@"确认" forState:UIControlStateNormal];
    }
    if ([[self SUN_GetCurrentViewController] isMemberOfClass:NSClassFromString(@"MineBankCardListViewController")]) {
        [self.button setBackgroundColor:SUN_GlobalWhiteColor];
        [self.button SUN_SetBordersWithColor:[UIColor SUN_ColorWithHexString:@"#CAE7B6" alpha:1] andCornerRadius:5 andWidth:1];
        [self.button setTitleColor:[UIColor SUN_ColorWithHexString:@"#CAE7B6" alpha:1] forState:UIControlStateNormal];
        [self.button setTitle:@"添加" forState:UIControlStateNormal];
        
        [self.button addTarget:self action:@selector(addBankCard) forControlEvents:UIControlEventTouchUpInside];
    }
    if ([[self SUN_GetCurrentViewController] isMemberOfClass:NSClassFromString(@"MineBankCardAddViewController")]) {
        [self.button setBackgroundColor:SUN_GlobalTextGreenColor];
        [self.button setTitle:@"立即绑定" forState:UIControlStateNormal];
        [self.button addTarget:self action:@selector(bindBankCard) forControlEvents:UIControlEventTouchUpInside];
        
    }
    if ([[self SUN_GetCurrentViewController] isMemberOfClass:NSClassFromString(@"HomeConvertViewController")]) {

        [self.button setBackgroundColor:SUN_GlobalTextGreenColor];
        [self.button setTitle:@"兑换" forState:UIControlStateNormal];
    }
    
}
-(void)addBankCard{
    MineBankCardAddViewController *vc = [MineBankCardAddViewController new];
    vc.title = @"添加银行卡";
    [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];;
}
-(void)bindBankCard{
    [[self SUN_GetCurrentNavigationController] popViewControllerAnimated:YES];
}

@end
