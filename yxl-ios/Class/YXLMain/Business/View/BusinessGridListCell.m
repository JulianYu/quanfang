//
//  BusinessGridListCell.m
//  yxl-ios
//
//  Created by mac on 16/12/15.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "BusinessGridListCell.h"
@implementation BusinessGridListCell


-(BusinessGridListView *)gridListView{
    if (!_gridListView) {
        _gridListView = [[BusinessGridListView alloc]initWithFrame:self.contentView.frame];
        [self addSubview:_gridListView];
    }
    return _gridListView;
}

@end
