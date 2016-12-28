//
//  AppDelegate+Category.h
//  yxl-ios
//
//  Created by mac on 16/12/12.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (Category)

//本地服务器
- (void)setServerConfigWithlocal;
//外网
- (void)setServerConfigWithIntel;

- (void)isFirstLaunched;

@end
