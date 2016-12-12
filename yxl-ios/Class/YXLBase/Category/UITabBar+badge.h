//
//  UITabBar+badge.h
//  RCloudMessage
//
//  Created by mac on 16/12/12.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (badge)

//重写是为了修改badge小红点儿的颜色
- (void)SUN_ShowBadgeOnItemIndex:(int)index; //显示小红点

- (void)SUN_ShowBadgeOnItemIndex:(int)index badgeValue:(int)badgeValue; //显示带badge的红点

- (void)SUN_HideBadgeOnItemIndex:(int)index; //隐藏小红点

@end
