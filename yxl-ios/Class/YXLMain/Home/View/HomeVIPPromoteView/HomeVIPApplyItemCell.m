//
//  HomeVIPApplyItemCell.m
//  yxl-ios
//
//  Created by mac on 16/12/24.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "HomeVIPApplyItemCell.h"

@implementation HomeVIPApplyItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.textField.textColor = SUN_GlobalTextBlackColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
