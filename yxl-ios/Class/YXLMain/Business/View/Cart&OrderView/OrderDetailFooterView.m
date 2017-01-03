//
//  OrderDetailFooterView.m
//  yxl-ios
//
//  Created by mac on 17/1/3.
//  Copyright © 2017年 孙若淮. All rights reserved.
//

#import "OrderDetailFooterView.h"

@implementation OrderDetailFooterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildUI];
    }
    return self;
}
-(void)buildUI{
    
    UIImageView *backImageView = [[UIImageView alloc]initWithFrame:self.frame];
    backImageView.image = [UIImage imageNamed:@"yxl_cart_footer"];
    [self addSubview:backImageView];
    
    self.totalPriceLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.checkOutBtn = [[UIButton alloc]initWithFrame:CGRectZero];
    
    [self SUN_AddSubViewsWithArray:@[self.totalPriceLabel,self.checkOutBtn]];
    
    NSString *total = @"总额";
    NSString *price = @"￥400.00元";
    NSString *str = [NSString stringWithFormat:@"%@ %@",total,price];
    NSMutableAttributedString *priceStr = [[NSMutableAttributedString alloc]initWithString:str];
    [priceStr beginEditing];
    [self SUN_SetAttributeFontSize:14 Color:SUN_GlobalTextBlackColor attributedString:priceStr string:str rangeOfString:total];
    [self SUN_SetAttributeFontSize:14 Color:[UIColor redColor] attributedString:priceStr string:str rangeOfString:price];
    
    self.totalPriceLabel.attributedText = priceStr;
    self.totalPriceLabel.numberOfLines = 1;
    
    [self.checkOutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(30);
        make.top.mas_equalTo(15);
        make.right.mas_equalTo(self).offset(-30);
    }];
    
    [self.checkOutBtn setBackgroundColor:[UIColor redColor]];
    [self.checkOutBtn setTitle:@"提交订单" forState:UIControlStateNormal];
    [self.checkOutBtn addTarget:self action:@selector(checkOut) forControlEvents:UIControlEventTouchUpInside];
    self.checkOutBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.checkOutBtn setTitleColor:SUN_GlobalWhiteColor forState:UIControlStateNormal];
    
    [self.totalPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(self.checkOutBtn.mas_left).offset(-10);
        make.height.mas_equalTo(21);
    }];
    
}
-(void)checkOut{
}


@end
