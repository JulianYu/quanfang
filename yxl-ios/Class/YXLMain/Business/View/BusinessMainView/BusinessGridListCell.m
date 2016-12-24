//
//  BusinessGridListCell.m
//  yxl-ios
//
//  Created by mac on 16/12/15.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "BusinessGridListCell.h"
#import "MJExtension.h"
#import "BusinessModel.h"
@interface BusinessGridListCell(){
    int row;
    int line;
}
@property( nonatomic, strong) BusinessModel        * model;
@end
@implementation BusinessGridListCell

-(void)buildUI{
    self.backgroundColor = SUN_GlobalWhiteColor;
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
        [btn SUN_SetEnlargeEdgeWithTop:0 right:0 bottom:15 left:0];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
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
-(void)btnClick:(UIButton*)sender{
    NSLog(@"%ld",(long)sender.tag);
}

@end
