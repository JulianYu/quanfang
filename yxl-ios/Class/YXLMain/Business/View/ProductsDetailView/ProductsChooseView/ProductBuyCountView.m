//
//  ProductBuyCountView.m
//  yxl-ios
//
//  Created by mac on 16/12/26.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "ProductBuyCountView.h"

@implementation ProductBuyCountView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
        self.label.text = @"购买数量";
        [self.label SUN_SetTitleWithColor:SUN_GlobalTextBlackColor FontSize:14 bold:NO textAlignment:NSTextAlignmentLeft];
        [self addSubview:self.label];
        
        self.addBtn= [UIButton buttonWithType:UIButtonTypeCustom];
        self.addBtn.frame = CGRectMake(self.frame.size.width-10-40, 10,40, 30);
        [self.addBtn setBackgroundColor:[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1]];
        
        [self.addBtn setTitleColor:[UIColor blackColor] forState:0];
        self.addBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [self.addBtn setTitle:@"+" forState:0];
        [self addSubview:self.addBtn];
        
        self.countTF = [[UITextField alloc] initWithFrame:CGRectMake(self.addBtn.frame.origin.x -45, 10, 40, 30)];
        self.countTF.text = @"1";
        self.countTF.textAlignment = NSTextAlignmentCenter;
        self.countTF.font = [UIFont systemFontOfSize:15];
        self.countTF.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
        [self addSubview:self.countTF];
        
        self.reduceBtn= [UIButton buttonWithType:UIButtonTypeCustom];
        self.reduceBtn.frame = CGRectMake(self.countTF.frame.origin.x -45, 10, 40, 30);
        [self.reduceBtn setBackgroundColor:[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1]];
        [self.reduceBtn setTitleColor:[UIColor blackColor] forState:0];
        self.reduceBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [self.reduceBtn setTitle:@"-" forState:0];
        [self addSubview:self.reduceBtn];
        
        
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height-0.5, self.frame.size.width, 0.5)];
        line.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:line];
    }
    return self;
}

@end
