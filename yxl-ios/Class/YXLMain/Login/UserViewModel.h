//
//  UserViewModel.h
//  yxl-ios
//
//  Created by mac on 16/12/23.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLBaseViewModel.h"
#import "UserModel.h"
#import "ServerConfig.h"
#import "SignUpModel.h"
#import "SignUpViewController.h"
#import "LoginViewController.h"
@interface UserViewModel : YXLBaseViewModel
+ (BOOL)online;

- (void)setOnline:(BOOL)flag;
- (void)setOffline:(BOOL)flag;

-(void)pushToSignUpBy:(LoginViewController*)viewController;

-(void)login:(NSString*)phone password:(NSString*)password viewController:(UIViewController*)viewController;
-(void)signUp:(SignUpModel*)model CompletionHandle:(void (^)(id model , id error))completionHandle;
-(void)sendRegMobileCode:(NSString*)mobile;

@end
