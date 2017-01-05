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
    
}
-(void)setData:(Data *)data{
    self.productNameLabel.text = data.name;
    
    self.sellPrice = [NSString stringWithFormat:@"￥%@元",data.sell_price];
    self.marketPrice = [NSString stringWithFormat:@"市场价格￥%@元",data.market_price];
    NSString *str =[NSString stringWithFormat:@"%@  %@",self.sellPrice,self.marketPrice];
    NSMutableAttributedString *price = [[NSMutableAttributedString alloc]initWithString:str];
    [price beginEditing];
    [price addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:[str rangeOfString:self.sellPrice]];
    [price addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:[str rangeOfString:self.marketPrice]];
    [price addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:[str rangeOfString:self.sellPrice]];
    [price addAttribute:NSForegroundColorAttributeName value:SUN_GlobalTextGreyColor range:[str rangeOfString:self.marketPrice]];
    [price addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid|NSUnderlineStyleSingle) range:[str rangeOfString:self.marketPrice]];
    self.priceLabel.attributedText = price;
    self.priceLabel.numberOfLines = 1;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
