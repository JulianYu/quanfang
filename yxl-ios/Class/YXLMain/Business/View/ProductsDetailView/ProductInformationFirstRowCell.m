//
//  ProductInformationFirstRowCell.m
//  yxl-ios
//
//  Created by mac on 16/12/20.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "ProductInformationFirstRowCell.h"

@implementation ProductInformationFirstRowCell

- (void)awakeFromNib {
    [super awakeFromNib];
    NSString *sellPrice = @"￥3398.00元";
    NSString *marketPrice = @"市场价格￥3398.00元";
    NSString *str =[NSString stringWithFormat:@"%@  %@",sellPrice,marketPrice];
    NSMutableAttributedString *price = [[NSMutableAttributedString alloc]initWithString:str];
    [price beginEditing];
    [price addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:[str rangeOfString:sellPrice]];
    [price addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:[str rangeOfString:marketPrice]];
    [price addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:[str rangeOfString:sellPrice]];
    [price addAttribute:NSForegroundColorAttributeName value:SUN_GlobalTextGreyColor range:[str rangeOfString:marketPrice]];
    [price addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid|NSUnderlineStyleSingle) range:[str rangeOfString:marketPrice]];
    self.priceLabel.attributedText = price;
    self.priceLabel.numberOfLines = 1;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
