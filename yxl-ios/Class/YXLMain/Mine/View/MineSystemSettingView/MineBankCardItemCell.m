//
//  MineBankCardItemCell.m
//  yxl-ios
//
//  Created by mac on 16/12/22.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineBankCardItemCell.h"

@implementation MineBankCardItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    NSString *bankcardTitle = @"建设银行";
    NSString *name = @"谢XX";
    NSString *bankcardNumber = @"**** **** **** 5254";
    NSString *str = [NSString stringWithFormat:@"%@\n%@\n%@",bankcardTitle,name,bankcardNumber];
    NSMutableAttributedString *bankcard = [[NSMutableAttributedString alloc]initWithString:str];
    [bankcard beginEditing];
    self.bankcardInformationLabel.attributedText = bankcard;
    self.bankcardInformationLabel.numberOfLines = 3;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
