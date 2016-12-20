//
//  ProductSellerSecondRowCell.m
//  yxl-ios
//
//  Created by mac on 16/12/20.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "ProductSellerSecondRowCell.h"

@implementation ProductSellerSecondRowCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.storeBtn setTitleColor:SUN_GlobalTextBlackColor forState:UIControlStateNormal];
    [self.storeBtn SUN_SetBordersWithColor:[UIColor SUN_ColorWithHexString:@"#E6E6E6" alpha:1] andCornerRadius:5 andWidth:1];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
