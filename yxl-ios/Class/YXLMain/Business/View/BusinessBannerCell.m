//
//  BusinessBannerCell.m
//  yxl-ios
//
//  Created by mac on 16/12/15.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "BusinessBannerCell.h"


@implementation BusinessBannerCell

-(BusinessBannerView *)bannerView{
    if (!_bannerView) {
        _bannerView = [[BusinessBannerView alloc]initWithFrame:self.contentView.frame];
        [self addSubview:_bannerView];
    }
    return _bannerView;
}

@end
