//
//  AppDelegate+Category.m
//  yxl-ios
//
//  Created by mac on 16/12/12.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "AppDelegate+Category.h"
#import "YXLTabBarController.h"
@implementation AppDelegate (Category)
-(void)isFirstLaunched{

    // 创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = [[YXLTabBarController alloc] init];
    
    [self.window makeKeyAndVisible];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

}

@end
