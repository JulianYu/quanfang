//
//  HomeStockPointsHeaderView.m
//  yxl-ios
//
//  Created by mac on 17/1/2.
//  Copyright © 2017年 孙若淮. All rights reserved.
//

#import "HomeStockPointsHeaderView.h"
@interface HomeStockPointsHeaderView ()
@property( nonatomic, strong) UILabel           * titleLabel;
@property( nonatomic, strong) UIButton          * backBtn;
@property( nonatomic, strong) UILabel           * accountLabel;

@end

@implementation HomeStockPointsHeaderView
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
    self.backBtn = [[UIButton alloc]initWithFrame:CGRectZero];
    self.accountLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.pointLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    
    self.titleLabel.text = @"购买库存积分";
    [self.titleLabel SUN_SetTitleWithColor:SUN_GlobalWhiteColor FontSize:17 bold:YES textAlignment:NSTextAlignmentCenter];
    self.accountLabel.text = @"现金帐户余额";
    [self.accountLabel SUN_SetTitleWithColor:SUN_GlobalWhiteColor FontSize:12 bold:NO textAlignment:NSTextAlignmentCenter];
    
    [self.backBtn setImage:[UIImage imageNamed:@"yxl_nav_back"] forState:UIControlStateNormal];
    self.backBtn.contentMode = UIViewContentModeScaleAspectFit;
    [self.backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.pointLabel.text = @"0.00";
    [self.pointLabel SUN_SetTitleWithColor:SUN_GlobalWhiteColor FontSize:35 bold:NO textAlignment:NSTextAlignmentCenter];
    
    [self SUN_AddSubViewsWithArray:@[self.titleLabel,self.backBtn,self.accountLabel,self.pointLabel]];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(20);
        make.top.mas_equalTo(32);
        make.centerX.mas_equalTo(self);
    }];
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(34);
        make.top.mas_equalTo(23);
        make.left.mas_equalTo(10);
    }];
    [self.accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(15);
        make.centerX.mas_equalTo(self);
        make.centerY.mas_equalTo(self);
    }];
    
    [self.pointLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(SCREEN_WIDTH);
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
