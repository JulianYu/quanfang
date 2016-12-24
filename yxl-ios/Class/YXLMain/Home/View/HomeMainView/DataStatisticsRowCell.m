//
//  DataStatisticsRowCell.m
//  yxl-ios
//
//  Created by mac on 16/12/14.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "DataStatisticsRowCell.h"

@implementation DataStatisticsRowCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self buildUI];
    }
    return self;
}

-(void)buildUI{
    self.scoreTotalLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.scoreTitleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.convertTotalLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.convertTitleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    
    self.scoreTitleLabel.text = @"上一天新增积分总量";
    self.convertTitleLabel.text = @"上一天转换现金盾总量";
    self.scoreTotalLabel.text = @"+10948855586.88";
    self.convertTotalLabel.text = @"+2183958.65";
    
    [self.scoreTotalLabel SUN_SetTitleWithColor:SUN_GlobalTextBlackColor FontSize:17 bold:NO textAlignment:NSTextAlignmentCenter];

    [self.convertTotalLabel SUN_SetTitleWithColor:SUN_GlobalTextBlackColor FontSize:17 bold:NO textAlignment:NSTextAlignmentCenter];
    
    [self.scoreTitleLabel SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:10 bold:NO textAlignment:NSTextAlignmentCenter];
    
    [self.convertTitleLabel SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:10 bold:NO textAlignment:NSTextAlignmentCenter];
    
    [self.contentView SUN_AddSubViewsWithArray:@[self.scoreTotalLabel,self.scoreTitleLabel,self.convertTotalLabel,self.convertTitleLabel]];
    
    [self.scoreTotalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(SCREEN_WIDTH/2);
        make.height.mas_equalTo(20);
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(self.height/2).offset(-35);
    }];
    [self.convertTotalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(SCREEN_WIDTH/2);
        make.height.mas_equalTo(20);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(self.height/2).offset(-35);
    }];

    [self.scoreTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(SCREEN_WIDTH/2);
        make.height.mas_equalTo(16);
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(self.scoreTotalLabel.mas_bottom);
    }];
    
    [self.convertTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(SCREEN_WIDTH/2);
        make.height.mas_equalTo(16);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.convertTotalLabel.mas_bottom);
        
    }];
    

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
