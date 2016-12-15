//
//  BusinessGridListView.m
//  yxl-ios
//
//  Created by mac on 16/12/14.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "BusinessGridListView.h"
#import "BusinessModel.h"
@interface BusinessGridListView()

@property( nonatomic, strong) BusinessModel        * model;
@end
@implementation BusinessGridListView{
    int row;
    int line;
}
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
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"BusinessGridlist" ofType:@"plist"];
    self.model = [BusinessModel mj_objectWithFile:plistPath];
    
    int btnWidth = SCREEN_WIDTH/5.0;//记录button的高度
    int btnHeight = (self.height-30)/2.0;
    UIButton *lastBtn = nil;
    UIButton *firstBtn = nil;
    

    for (int i = 0 ; i < 10; i++) {
        UIButton *btn = [UIButton new];
        [btn setImage:[UIImage imageNamed:self.model.dataArray[i].img] forState:UIControlStateNormal];
        btn.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:btn];
        
        UILabel *label = [UILabel new];
        label.text = self.model.dataArray[i].title;
        [label SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:10 bold:NO textAlignment:NSTextAlignmentCenter];
        [self addSubview:label];
            row = i/5;
            line = i%5;
        
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
}

@end
