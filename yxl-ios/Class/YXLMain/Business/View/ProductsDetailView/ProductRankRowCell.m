//
//  ProductRankRowCell.m
//  yxl-ios
//
//  Created by mac on 16/12/20.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "ProductRankRowCell.h"

@implementation ProductRankRowCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.rankLabel SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:14 bold:NO textAlignment:NSTextAlignmentLeft];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
