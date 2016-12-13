//
//  HomeHeaderView.m
//  yxl-ios
//
//  Created by mac on 16/12/13.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "HomeHeaderView.h"
@interface HomeHeaderView()
@property( nonatomic, strong) UILabel           * titleLabel;
@property( nonatomic, strong) UIButton          * addBtn;
@property( nonatomic, strong) UIView            * scanView;
@property( nonatomic, strong) UIView            * cashierView;
@property( nonatomic, strong) UIView            * popularizeView;

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
    self.scanView = [[UIView alloc]initWithFrame:CGRectZero];
    self.cashierView = [[UIView alloc]initWithFrame:CGRectZero];
    self.popularizeView = [[UIView alloc]initWithFrame:CGRectZero];
    
    
}

@end
