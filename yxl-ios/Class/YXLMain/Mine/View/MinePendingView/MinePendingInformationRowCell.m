//
//  MinePendingInformationRowCell.m
//  yxl-ios
//
//  Created by mac on 16/12/21.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MinePendingInformationRowCell.h"

@implementation MinePendingInformationRowCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.pendingImageView setBackgroundColor:[UIColor randomColor]];
    
    NSString *pendingInformation = @"欧米茄钢款计时自动机械男士手表";
    NSString *pendingRank = @"尺寸：21mm；颜色分类：棕色银色扣";
    
    NSString *str = [NSString stringWithFormat:@"%@\n%@",pendingInformation,pendingRank];
    NSMutableAttributedString *information = [[NSMutableAttributedString alloc]initWithString:str];
    [information addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:[str rangeOfString:pendingInformation]];
    [information addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10] range:[str rangeOfString:pendingRank]];
    [information addAttribute:NSForegroundColorAttributeName value:SUN_GlobalTextBlackColor range:[str rangeOfString:pendingInformation]];
    [information addAttribute:NSForegroundColorAttributeName value:SUN_GlobalTextGreyColor range:[str rangeOfString:pendingRank]];
    self.pendingInformationLabel.attributedText = information;
    self.pendingInformationLabel.numberOfLines = 3;
    
    
    NSString *price = @"￥350.00";
    NSString *number = @"x1";
    
    str = [NSString stringWithFormat:@"%@\n%@",price,number];
    NSMutableAttributedString *priceNumber = [[NSMutableAttributedString alloc]initWithString:str];
    [priceNumber addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:[str rangeOfString:price]];
    [priceNumber addAttribute:NSForegroundColorAttributeName value:SUN_GlobalTextBlackColor range:[str rangeOfString:price]];
    [priceNumber addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:[str rangeOfString:number]];
    [priceNumber addAttribute:NSForegroundColorAttributeName value:SUN_GlobalTextGreyColor range:[str rangeOfString:number]];
    self.pendingPriceNumberLabel.attributedText = priceNumber;
    self.pendingPriceNumberLabel.textAlignment = NSTextAlignmentRight;
    self.pendingPriceNumberLabel.numberOfLines = 2;
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
