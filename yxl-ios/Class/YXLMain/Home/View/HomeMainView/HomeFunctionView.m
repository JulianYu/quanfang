//
//  HomeFunctionView.m
//  yxl-ios
//
//  Created by mac on 16/12/15.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "HomeFunctionView.h"
#import "HomeModel.h"
#import "HomeVIPApplicationViewController.h"
@interface HomeFunctionView (){
    int row;
    int line;
}
@property( nonatomic, strong) HomeModel        * model;

@end

@implementation HomeFunctionView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = SUN_GlobalWhiteColor;
        [self buildUI];
    }
    return self;
}
-(void)buildUI{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"HomeList" ofType:@"plist"];
    self.model = [HomeModel mj_objectWithFile:plistPath];

    int btnWidth = SCREEN_WIDTH/4.0;//记录button的高度
    int btnHeight = (self.height-30)/2.0;
    UIButton *lastBtn = nil;
    UIButton *firstBtn = nil;
    for (int i = 0 ; i < 8; i++) {
        UIButton *btn = [UIButton new];
        [btn setImage:[UIImage imageNamed:self.model.dataArray[i].img] forState:UIControlStateNormal];
        btn.contentMode = UIViewContentModeScaleAspectFit;
        btn.tag = i;
        [btn SUN_SetEnlargeEdgeWithTop:0 right:0 bottom:30 left:0];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        UILabel *label = [UILabel new];
        label.text = self.model.dataArray[i].text;
        [label SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:10 bold:NO textAlignment:NSTextAlignmentCenter];
        [self addSubview:label];
        row = i/4;
        line = i%4;
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(btnHeight);
            make.width.mas_equalTo(btnWidth);
            
            if (!line) {
                make.left.mas_equalTo(0);
            }
            else{
                make.left.mas_equalTo(lastBtn.mas_right);
            }
            
            if (!row) {
                make.top.mas_equalTo(0);
            }
            else{
                if (!line) {
                    make.top.mas_equalTo(lastBtn.mas_bottom).offset(15);
                }else{
                    make.top.mas_equalTo(firstBtn.mas_top);
                }
            }
            
        }];
        if (!line) {
            firstBtn = btn;
        }
        lastBtn = btn;
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(15);
            make.width.mas_equalTo(btnWidth);
            make.top.mas_equalTo(lastBtn.mas_bottom).offset(-5);
            make.left.mas_equalTo(lastBtn.mas_left);
        }];
    }
    
    UIView *lineVI = [UIView new];
    lineVI.backgroundColor = [UIColor SUN_ColorWithHexString:@"#E6E6E6" alpha:1];
    [self addSubview:lineVI];
    
    [lineVI mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
        make.top.mas_equalTo(lastBtn.mas_top).offset(-1);
    }];

}
-(void)btnClick:(UIButton*)sender{
    
    switch (sender.tag) {
        case 0:
        {
            HomeVIPApplicationViewController *vc = [HomeVIPApplicationViewController new];
            vc.title = @"会员升级申请";
            [self SUN_GetCurrentNavigationController].navigationBar.hidden = NO;
            [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
        
        }
            break;
        case 3:
        {
        
        }
            break;
        case 4:
        {
            
        }
            break;
        case 5:
        {
            
        }
            break;
        case 6:
        {
            
        }
            break;
        default:
        {
        
        }
            break;
    }
    
}
@end
