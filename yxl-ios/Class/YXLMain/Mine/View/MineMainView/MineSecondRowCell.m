//
//  MineSecondRowCell.m
//  yxl-ios
//
//  Created by mac on 16/12/13.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineSecondRowCell.h"

@implementation MineSecondRowCell{
    
    int line;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self buildUI];
    }
    return self;
}
-(void)buildUI{
    int btnWidth = SCREEN_WIDTH/4.0;//记录button的高度
    int btnHeight = (SCREEN_HEIGHT-34-10)/8-20;
    UIButton *lastBtn = nil;
    for (int i = 0 ; i < 4; i++) {
        UIButton *btn = [UIButton new];
        btn.tag = i;
        [btn SUN_SetEnlargeEdgeWithTop:0 right:0 bottom:20 left:0];
        [self.btnArray addObject:btn];
        [self addSubview:btn];
        
        UILabel *label = [UILabel new];
        [label SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:10 bold:NO textAlignment:NSTextAlignmentCenter];
        label.tag = i;
        [self.labelArray addObject:label];
        [self addSubview:label];
        
        line = i%4;
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(btnHeight);
            make.width.mas_equalTo(btnWidth);
            make.top.mas_equalTo(0);

            if (!line) {
                make.left.mas_equalTo(0);
            }
            else{
                make.left.mas_equalTo(lastBtn.mas_right);
            }
            
        }];
        lastBtn = btn;
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(15);
            make.width.mas_equalTo(btnWidth);
            make.top.mas_equalTo(lastBtn.mas_bottom).offset(-5);
            make.left.mas_equalTo(lastBtn.mas_left);
        }];
    }
    
}
-(NSMutableArray<UIButton *> *)btnArray{
    if (!_btnArray) {
        _btnArray = [NSMutableArray array];
    }
    return _btnArray;
}
-(NSMutableArray<UILabel *> *)labelArray{
    if (!_labelArray) {
        _labelArray = [NSMutableArray array];
    }
    return _labelArray;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}


@end
