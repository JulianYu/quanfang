//
//  UserViewModel.h
//  yxl-ios
//
//  Created by mac on 16/12/23.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLBaseViewModel.h"
#import "UserModel.h"
#import "SignUpViewController.h"
#import "LoginViewController.h"
@interface UserViewModel : YXLBaseViewModel
+ (BOOL)online;

- (void)setOnline:(BOOL)flag;
- (void)setOffline:(BOOL)flag;

-(void)pushToSignUpBy:(LoginViewController*)viewController;
@end
