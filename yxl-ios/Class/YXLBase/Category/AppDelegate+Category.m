//
//  AppDelegate+Category.m
//  yxl-ios
//
//  Created by mac on 16/12/12.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "AppDelegate+Category.h"
#import "YXLTabBarController.h"
#import "YXLNavigationController.h"
#import "LoginViewController.h"
#import "UserViewModel.h"
@implementation AppDelegate (Category)
-(void)isFirstLaunched{

    // 创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = SUN_GlobalNormalColor;
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstStart"]){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstStart"];
        
        NSLog(@"第一次启用APP");
        [HUD setMinimumDismissTimeInterval:1];
        [HUD SUN_ShowWithStatus:@"第一次使用程序"];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        self.window.rootViewController = [[YXLTabBarController alloc]init];
                
    }
    else{
        
//        [UserViewModel online];
        
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        self.window.rootViewController = [[YXLTabBarController alloc]init];
        
    }
    
    
    [self.window makeKeyAndVisible];

}
#pragma mark - *****  服务器 设置

- (void)setServerConfigWithlocal{
    [ServerConfig sharedServerConfig].url = @"http://192.168.1.230/quanfan";
    
}
- (void)setServerConfigWithIntel{
    [ServerConfig sharedServerConfig].url = @"";
    
}


@end
