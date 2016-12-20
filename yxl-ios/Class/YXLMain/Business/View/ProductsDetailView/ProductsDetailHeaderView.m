//
//  ProductsDetailHeaderView.m
//  yxl-ios
//
//  Created by mac on 16/12/19.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "ProductsDetailHeaderView.h"
@interface ProductsDetailHeaderView()
@property( nonatomic, strong) UIButton              * backBtn;
@property( nonatomic, strong) UIButton              * shareBtn;
@property( nonatomic, strong) UIScrollView          * scrollView;

@end
@implementation ProductsDetailHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildUI];
    }
    return self;
}
-(void)buildUI{
    self.backgroundColor = [UIColor randomColor];
    self.backBtn = [[UIButton alloc]initWithFrame:CGRectZero];
    [self.backBtn setImage:[UIImage imageNamed:@"yxl_nav_back"] forState:UIControlStateNormal];
    
    [self.backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.shareBtn = [[UIButton alloc]initWithFrame:CGRectZero];
    [self.shareBtn setImage:[UIImage imageNamed:@"yxl_nav_share"] forState:UIControlStateNormal];
    [self SUN_AddSubViewsWithArray:@[self.backBtn,self.shareBtn]];
    
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(22);
        make.left.mas_equalTo(15);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(44);
    }];
    
    [self.shareBtn addTarget:self action:@selector(shareBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(22);
        make.right.mas_equalTo(-15);
        make.width.mas_equalTo(44);
        make.height.mas_equalTo(44);
    }];

}
-(void)backBtnClick{
    [self SUN_GetCurrentNavigationController].navigationBar.hidden = NO;
    [[self SUN_GetCurrentNavigationController] popViewControllerAnimated:YES];
    
}
-(void)shareBtnClick{
    
}

@end
