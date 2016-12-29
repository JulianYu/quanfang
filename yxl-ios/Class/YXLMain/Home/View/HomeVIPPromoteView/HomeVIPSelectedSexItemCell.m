//
//  HomeVIPSelectedSexItemCell.m
//  yxl-ios
//
//  Created by mac on 16/12/24.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "HomeVIPSelectedSexItemCell.h"

@implementation HomeVIPSelectedSexItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)rightBtnClick:(id)sender {
    self.rightBtn.selected = YES;
    self.leftBtn.selected = NO;
}
- (IBAction)leftBtnClick:(id)sender {
    self.leftBtn.selected = YES;
    self.rightBtn.selected = NO;
}

@end
