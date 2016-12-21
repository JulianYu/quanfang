//
//  MinePendingHeaderRowCell.m
//  yxl-ios
//
//  Created by mac on 16/12/21.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MinePendingHeaderRowCell.h"

@implementation MinePendingHeaderRowCell

- (void)awakeFromNib {
    [super awakeFromNib];
    NSString *pendingNubmer = @"订单号 15812497773205";
    NSString *checkTime = @" 成交时间 2016-05-06 20:02";
    NSString *str = [NSString stringWithFormat:@"%@\n%@",pendingNubmer,checkTime];
    NSMutableAttributedString *pending = [[NSMutableAttributedString alloc]initWithString:str];
    [pending beginEditing];
    [pending addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:[str rangeOfString:pendingNubmer]];
    [pending addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10] range:[str rangeOfString:checkTime]];
    [pending addAttribute:NSForegroundColorAttributeName value:SUN_GlobalTextBlackColor range:[str rangeOfString:pendingNubmer]];
    [pending addAttribute:NSForegroundColorAttributeName value:SUN_GlobalTextGreyColor range:[str rangeOfString:checkTime]];
    self.PendingNumberLabel.attributedText = pending;
    self.PendingNumberLabel.numberOfLines= 2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
