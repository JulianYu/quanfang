//
//  YXLBaseViewModel.h
//  yxl-ios
//
//  Created by mac on 16/12/13.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXLBaseViewController.h"
#import "MJExtension.h"
#import "HUD.h"
#import "YXLBaseModel.h"
#import "LoginViewController.h"
#import "YXLNavigationController.h"
#import "UserModel.h"
#define SUN_DEFAULTS [NSUserDefaults standardUserDefaults]

@interface YXLBaseViewModel : NSObject
-(instancetype)initWithViewController:(YXLBaseViewController*)viewController;

-(instancetype)initWithUIViewController:(UIViewController *)viewController;

+(void)presentFailureHUD:(STATUS*)status;

@end
