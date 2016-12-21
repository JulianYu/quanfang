//
//  MinePendingPriceRowCell.m
//  yxl-ios
//
//  Created by mac on 16/12/21.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MinePendingPriceRowCell.h"

@implementation MinePendingPriceRowCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSString *leftPrice = @"共2件商品 合计:";
    NSString *price = @"￥700.00";
    NSString *rightPrice = @"(含运费￥0.00)";
    NSString *str = [NSString stringWithFormat:@"%@ %@%@",leftPrice,price,rightPrice];
    NSMutableAttributedString *pendingPrice = [[NSMutableAttributedString alloc]initWithString:str];
    [pendingPrice addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:[str rangeOfString:leftPrice]];

    [pendingPrice addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:[str rangeOfString:rightPrice]];
    
    [pendingPrice addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:[str rangeOfString:price]];

    [pendingPrice addAttribute:NSForegroundColorAttributeName value:SUN_GlobalTextGreyColor range:[str rangeOfString:str]];

    self.pendingPriceLabel.attributedText = pendingPrice;
    self.pendingPriceLabel.numberOfLines = 1;
    self.pendingPriceLabel.textAlignment = NSTextAlignmentRight;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
