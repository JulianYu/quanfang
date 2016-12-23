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
        LoginViewController *vc = [[LoginViewController alloc]init];
        YXLNavigationController *navi = [[YXLNavigationController alloc]initWithRootViewController:vc];
        self.window.rootViewController = navi;
        
    }
    else{
        if (![UserViewModel online]) {
            
            [UIApplication sharedApplication].statusBarHidden = NO;
            LoginViewController *vc = [[LoginViewController alloc]init];
            YXLNavigationController *navi = [[YXLNavigationController alloc]initWithRootViewController:vc];
            self.window.rootViewController = navi;
            
        }
        else{
            
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
            self.window.rootViewController = [[YXLTabBarController alloc]init];
        }
    
    }
    
    
    [self.window makeKeyAndVisible];

}

@end
