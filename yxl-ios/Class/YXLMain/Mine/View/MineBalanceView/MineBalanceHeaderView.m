//
//  MineBalanceHeaderView.m
//  yxl-ios
//
//  Created by mac on 16/12/23.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineBalanceHeaderView.h"
@interface MineBalanceHeaderView ()
@property( nonatomic, strong) UILabel           * titleLabel;
@property( nonatomic, strong) UIButton          * detailBtn;
@property( nonatomic, strong) UIButton          * backBtn;
@property( nonatomic, strong) UILabel           * accountLabel;
@property( nonatomic, strong) UILabel           * balanceLabel;
@end
@implementation MineBalanceHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildUI];
    }
    return self;
}
-(void)buildUI{
    self.backgroundColor = SUN_GlobalNormalColor;
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.detailBtn = [[UIButton alloc]initWithFrame:CGRectZero];
    self.backBtn = [[UIButton alloc]initWithFrame:CGRectZero];
    self.accountLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.balanceLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    
    self.titleLabel.text = @"现金盾";
    [self.titleLabel SUN_SetTitleWithColor:SUN_GlobalWhiteColor FontSize:17 bold:YES textAlignment:NSTextAlignmentCenter];
    
    self.accountLabel.text = @"余额帐户(元)";
    [self.accountLabel SUN_SetTitleWithColor:SUN_GlobalWhiteColor FontSize:12 bold:NO textAlignment:NSTextAlignmentCenter];
    
    [self.backBtn setImage:[UIImage imageNamed:@"yxl_nav_back"] forState:UIControlStateNormal];
    self.backBtn.contentMode = UIViewContentModeScaleAspectFit;
    [self.backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.detailBtn setTitle:@"明细" forState:UIControlStateNormal];
    [self.detailBtn.titleLabel SUN_SetTitleWithColor:SUN_GlobalWhiteColor FontSize:14 bold:YES textAlignment:NSTextAlignmentLeft];
    
    self.balanceLabel.text = @"35.00";
    [self.balanceLabel SUN_SetTitleWithColor:SUN_GlobalWhiteColor FontSize:35 bold:NO textAlignment:NSTextAlignmentCenter];
    
    [self SUN_AddSubViewsWithArray:@[self.titleLabel,self.detailBtn,self.backBtn,self.accountLabel,self.balanceLabel]];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(20);
        make.top.mas_equalTo(32);
        make.centerX.mas_equalTo(self);
    }];
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(34);
        make.top.mas_equalTo(23);
        make.left.mas_equalTo(10);
    }];
    [self.detailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(34);
        make.height.mas_equalTo(15);
        make.top.mas_equalTo(38);
        make.right.mas_equalTo(-10);
        
    }];
    
    [self.accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(15);
        make.centerX.mas_equalTo(self);
        make.centerY.mas_equalTo(self);
    }];
    
    [self.balanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(self.accountLabel.mas_bottom).mas_offset(5);
        make.centerX.mas_equalTo(self);
    }];
    
    
}
-(void)backBtnClick{
    [self SUN_GetCurrentNavigationController].navigationBar.hidden = NO;
    [[self SUN_GetCurrentNavigationController] popViewControllerAnimated:YES];
}
@end
