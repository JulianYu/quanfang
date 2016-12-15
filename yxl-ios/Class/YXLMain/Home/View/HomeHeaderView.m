//
//  HomeHeaderView.m
//  yxl-ios
//
//  Created by mac on 16/12/13.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "HomeHeaderView.h"
#define HEADER_TITLE_HEIGHT 20
#define HEADER_MEMBER_WIDTH SCREEN_WIDTH/3
@interface HomeHeaderView()
@property( nonatomic, strong) UILabel           * titleLabel;
@property( nonatomic, strong) UIButton          * addBtn;
@property( nonatomic, strong) UIButton          * scanBtn;
@property( nonatomic, strong) UIButton          * cashierBtn;
@property( nonatomic, strong) UIButton          * popularizeBtn;
@property( nonatomic, strong) UILabel           * scanLabel;
@property( nonatomic, strong) UILabel           * cashierLabel;
@property( nonatomic, strong) UILabel           * popularizeLabel;

@end
@implementation HomeHeaderView
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
    self.addBtn = [[UIButton alloc]initWithFrame:CGRectZero];
    self.scanBtn = [[UIButton alloc]initWithFrame:CGRectZero];
    self.cashierBtn = [[UIButton alloc]initWithFrame:CGRectZero];
    self.popularizeBtn = [[UIButton alloc]initWithFrame:CGRectZero];
    self.scanLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.cashierLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.popularizeLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    
    self.titleLabel.text = @"银信联财富";
    [self.titleLabel SUN_SetTitleWithColor:SUN_GlobalWhiteColor FontSize:17 bold:YES textAlignment:NSTextAlignmentCenter];
    [self SUN_AddSubViewsWithArray:@[self.titleLabel,self.addBtn,self.scanBtn,self.cashierBtn,self.popularizeBtn,self.scanLabel,self.cashierLabel,self.popularizeLabel]];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(20);
        make.top.mas_equalTo(32);
        make.centerX.mas_equalTo(self);
    }];
    
    [self.addBtn setImage:[UIImage imageNamed:@"yxl_nav_add"] forState:UIControlStateNormal];
    self.addBtn.contentMode = UIViewContentModeScaleAspectFit;
    [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(34);
        make.top.mas_equalTo(23);
        make.right.mas_equalTo(-10);
    }];
    
    
    [self.scanBtn setImage:[UIImage imageNamed:@"yxl_home_scan"] forState:UIControlStateNormal];
    self.scanLabel.text = @"扫一扫";
    [self.scanLabel SUN_SetTitleWithColor:SUN_GlobalWhiteColor FontSize:13 bold:NO textAlignment:NSTextAlignmentCenter];
    self.cashierLabel.text = @"收款";
    [self.cashierBtn setImage:[UIImage imageNamed:@"yxl_home_cashier"] forState:UIControlStateNormal];
    [self.cashierLabel SUN_SetTitleWithColor:SUN_GlobalWhiteColor FontSize:13 bold:NO textAlignment:NSTextAlignmentCenter];
    self.popularizeLabel.text = @"推广码";
    [self.popularizeBtn setImage:[UIImage imageNamed:@"yxl_home_popularize"] forState:UIControlStateNormal];
    [self.popularizeLabel SUN_SetTitleWithColor:SUN_GlobalWhiteColor FontSize:13 bold:NO textAlignment:NSTextAlignmentCenter];
    
    
    [self.scanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(HEADER_MEMBER_WIDTH);
        make.height.mas_equalTo(HEADER_TITLE_HEIGHT);
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(-15);
    }];
    [self.cashierLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(HEADER_MEMBER_WIDTH);
        make.height.mas_equalTo(HEADER_TITLE_HEIGHT);
        make.bottom.mas_equalTo(-15);
        make.left.mas_equalTo(self.scanLabel.mas_right);
    }];
    [self.popularizeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(HEADER_MEMBER_WIDTH);
        make.height.mas_equalTo(HEADER_TITLE_HEIGHT);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-15);
    }];
    [self.scanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(HEADER_MEMBER_WIDTH);
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(self.scanLabel);
        make.top.mas_equalTo(self.titleLabel.mas_bottom);
    }];
    [self.cashierBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(HEADER_MEMBER_WIDTH);
        make.left.mas_equalTo(self.scanBtn.mas_right);
        make.bottom.mas_equalTo(self.scanLabel);
        make.top.mas_equalTo(self.scanBtn.mas_top);

    }];
    [self.popularizeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(HEADER_MEMBER_WIDTH);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(self.scanLabel);
        make.top.mas_equalTo(self.scanBtn.mas_top);

    }];
    
}

@end
