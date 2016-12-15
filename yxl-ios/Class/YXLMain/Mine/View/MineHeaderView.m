//
//  MineHeaderView.m
//  yxl-ios
//
//  Created by mac on 16/12/13.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineHeaderView.h"

@interface MineHeaderView ()

@property( nonatomic, strong) UIButton           * personalBtn;
@property( nonatomic, strong) UIImageView        * avatarImageView;
@property( nonatomic, strong) UILabel            * nickNameLabel;
@property( nonatomic, strong) UILabel            * IDNumberLabel;
@property( nonatomic, strong) UILabel            * VIPLevelLabel;
@property( nonatomic, strong) UIImageView        * scanImageView;
@property( nonatomic, strong) UIImageView        * detailImageView;

@end
@implementation MineHeaderView

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
    
    self.personalBtn = [[UIButton alloc]initWithFrame:CGRectZero];
    self.avatarImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    self.nickNameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.IDNumberLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.VIPLevelLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.scanImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    self.detailImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    
    [self SUN_AddSubViewsWithArray:@[self.personalBtn,self.avatarImageView,self.nickNameLabel,self.IDNumberLabel,self.VIPLevelLabel,self.scanImageView,self.detailImageView]];
    
    [self.personalBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0 , 0, 0, 0));
    }];
    
    [self.avatarImageView SUN_SetBordersWithColor:[UIColor whiteColor] andCornerRadius:30.0f andWidth:1];
    self.avatarImageView.backgroundColor = [UIColor yellowColor];
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(40);
        make.height.width.mas_equalTo(60);
    }];
    
    
    [self.detailImageView setImage:[UIImage imageNamed:@"yxl_mine_detail"]];
    [self.scanImageView setImage:[UIImage imageNamed:@"yxl_mine_scan"]];
    
    [self.detailImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(20);
        make.bottom.mas_equalTo(-40);
        make.right.mas_equalTo(-20);
    }];
    [self.scanImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(30);
        make.bottom.mas_equalTo(self.detailImageView.mas_bottom).offset(5);
        make.right.mas_equalTo(self.detailImageView.mas_left).offset(-10);
    }];
    
    
    self.nickNameLabel.text = @"Tinna";
    [self.nickNameLabel SUN_SetTitleWithColor:SUN_GlobalWhiteColor FontSize:22 bold:NO textAlignment:NSTextAlignmentLeft];
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.avatarImageView.mas_right).offset(10);
        make.top.mas_equalTo(self.avatarImageView.mas_top);
        make.height.mas_equalTo(24);
        make.right.mas_equalTo(self.scanImageView.mas_left).offset(-10);

    }];
    
    [self.IDNumberLabel SUN_SetTitleWithColor:SUN_GlobalWhiteColor FontSize:10 bold:NO textAlignment:NSTextAlignmentLeft];
    [self.VIPLevelLabel SUN_SetTitleWithColor:SUN_GlobalWhiteColor FontSize:10 bold:NO textAlignment:NSTextAlignmentLeft];
    self.IDNumberLabel.text = @"ID号: 13800138000";
    [self.IDNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nickNameLabel.mas_left).offset(5);
        make.right.mas_equalTo(self.nickNameLabel.mas_right);
        make.height.mas_equalTo(15);
        make.top.mas_equalTo(self.nickNameLabel.mas_bottom).offset(2);
    }];
    self.VIPLevelLabel.text = @"会员等级: 创业会员";
    [self.VIPLevelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nickNameLabel.mas_left).offset(5);
        make.right.mas_equalTo(self.nickNameLabel.mas_right);
        make.height.mas_equalTo(15);
        make.top.mas_equalTo(self.IDNumberLabel.mas_bottom);
    }];
    
}

@end
