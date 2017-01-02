//
//  MineHeaderView.m
//  yxl-ios
//
//  Created by mac on 16/12/13.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineHeaderView.h"
#import "MineDetailViewController.h"
#import "MineViewModel.h"
@interface MineHeaderView ()

@property( nonatomic, strong) UIButton           * personalBtn;
@property( nonatomic, strong) UIImageView        * avatarImageView;
@property( nonatomic, strong) UILabel            * informationLabel;
@property( nonatomic, strong) UIImageView        * scanImageView;
@property( nonatomic, strong) UIImageView        * detailImageView;
@property( nonatomic, strong) MineViewModel      * viewModel;
@property( nonatomic, copy) NSString             * nickNameStr;
@property( nonatomic, copy) NSString             * IDNumberStr;
@property( nonatomic, copy) NSString             * VIPLevelStr;

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
-(MineViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [MineViewModel new];
    }
    return _viewModel;
}
-(void)buildUI{
    self.backgroundColor = SUN_GlobalNormalColor;
    self.personalBtn = [[UIButton alloc]initWithFrame:CGRectZero];
    self.avatarImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    self.informationLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.scanImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    self.detailImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    
    [self SUN_AddSubViewsWithArray:@[self.personalBtn,
                                     self.avatarImageView,
                                     self.informationLabel,
                                     self.scanImageView,
                                     self.detailImageView]];
    
    [self.personalBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0 , 0, 0, 0));
    }];
    
    [self.personalBtn addTarget:self action:@selector(personalBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.avatarImageView SUN_SetBordersWithColor:[UIColor whiteColor] andCornerRadius:30.0f andWidth:2];
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
    if ([UserViewModel online]) {
        [self login];
    }
    else{
        [self.avatarImageView setImage:[UIImage imageNamed:@"yxl_placeholder_avatar"]];
        [self.informationLabel SUN_SetTitleWithColor:SUN_GlobalWhiteColor FontSize:16 bold:NO textAlignment:NSTextAlignmentLeft];
        self.informationLabel.text = @"点击此处登录";
    }
    
    [self.informationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.avatarImageView.mas_right).offset(10);
        make.top.mas_equalTo(self.avatarImageView.mas_top);
        make.right.mas_equalTo(self.scanImageView.mas_left).offset(-10);
        make.bottom.mas_equalTo(self.avatarImageView.mas_bottom);
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(login) name:UserStateChangeToLoginSuccess object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logout) name:UserStateChangeToLogoutSuccess object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeHeadIcon) name:UserInformationDidChangeSuccessByHeadIcon object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(login) name:UserInformationDidChangeSuccessByNickname object:nil];
    
}
-(void)changeHeadIcon{
    NSString *url = [NSString stringWithFormat:@"%@/%@",[ServerConfig sharedServerConfig].url,[UserModel sharedUserModel].user.head_ico];
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"yxl_placeholder_avatar"]];
}
-(void)logout{
    [self.informationLabel SUN_SetTitleWithColor:SUN_GlobalWhiteColor FontSize:16 bold:NO textAlignment:NSTextAlignmentLeft];
    self.informationLabel.text = @"点击此处登录";
    [self.avatarImageView setImage:[UIImage imageNamed:@"yxl_placeholder_avatar"]];
}
-(void)login{
    if (![[UserModel sharedUserModel].user.nickname isEqualToString:@""]) {
        self.nickNameStr = [UserModel sharedUserModel].user.nickname;
    }
    else{
        self.nickNameStr = [UserModel sharedUserModel].user.username;
    }
    self.IDNumberStr = [NSString stringWithFormat:@"ID号：%@",[UserModel sharedUserModel].user.user_id];
    if (![UserModel sharedUserModel].user.group_id) {
        self.VIPLevelStr = @"会员等级：普通用户";
    }
    else{
        self.VIPLevelStr = [NSString stringWithFormat:@"会员等级: %@",[UserModel sharedUserModel].user.group_id];
    }
    NSString *string = [NSString stringWithFormat:@"%@\n%@\n%@",self.nickNameStr,self.IDNumberStr,self.VIPLevelStr];
    NSMutableAttributedString *informationStr = [[NSMutableAttributedString alloc]initWithString:string];
    [informationStr beginEditing];
    [self SUN_SetAttributeFontSize:22 Color:SUN_GlobalWhiteColor attributedString:informationStr string:string rangeOfString:self.nickNameStr];
    [self SUN_SetAttributeFontSize:12 Color:SUN_GlobalWhiteColor attributedString:informationStr string:string rangeOfString:self.IDNumberStr];
    [self SUN_SetAttributeFontSize:12 Color:SUN_GlobalWhiteColor attributedString:informationStr string:string rangeOfString:self.VIPLevelStr];
    self.informationLabel.attributedText = informationStr;
    self.informationLabel.numberOfLines = 3;
    NSString *url = [NSString stringWithFormat:@"%@/%@",[ServerConfig sharedServerConfig].url,[UserModel sharedUserModel].user.head_ico];
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"yxl_placeholder_avatar"]];    
}
-(void)personalBtnClick{
    [self.viewModel pushToPersonalViewControllerBY:[self SUN_GetCurrentViewController]];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
