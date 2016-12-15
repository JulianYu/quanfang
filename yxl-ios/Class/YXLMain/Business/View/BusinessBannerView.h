//
//  BusinessBannerView.h
//  yxl-ios
//
//  Created by mac on 16/12/14.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLBaseView.h"

@interface BusinessBannerView : YXLBaseView<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView                  *scrollView;
@property (nonatomic, strong) NSTimer                       *timer;
@property (nonatomic, strong) UIPageControl                 *pagecontrol;


@end
