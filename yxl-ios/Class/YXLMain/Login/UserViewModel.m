//
//  UserViewModel.m
//  yxl-ios
//
//  Created by mac on 16/12/23.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "UserViewModel.h"
#import "YXLTabBarController.h"
#import "UserModel.h"
@interface UserViewModel ()
@property( nonatomic, strong) UIButton           * forgotBtn;
@property( nonatomic, strong) UserModel          * userModel;
@end
@implementation UserViewModel
+(BOOL)online{
//    NSUserDefaults *userDef = SUN_DEFAULTS;
//    NSDictionary *session = [userDef objectForKey:@"session"];
//    [UserModel sharedUserModel].session  = [Session mj_objectWithKeyValues:session];
    if ([UserModel sharedUserModel].session) {
        return YES;
    }
    return NO;
}
-(void)setOnline:(BOOL)flag{
    NSUserDefaults *userDef = SUN_DEFAULTS;
    [userDef setObject:[self.userModel.session mj_keyValues] forKey:@"session"];
    [userDef synchronize];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:UserStateChangeToLoginSuccess object:self];
    
}
-(void)setOffline:(BOOL)flag{
    [SUN_DEFAULTS removeObjectForKey:@"session"];
    [SUN_DEFAULTS synchronize];

    [[NSNotificationCenter defaultCenter]postNotificationName:UserStateChangeToLogoutSuccess object:self];
}
-(UserModel *)userModel{
    if (!_userModel) {
        _userModel = [UserModel sharedUserModel];
    }
    return _userModel;
}
- (instancetype)initWithUIViewController:(UIViewController *)viewController
{
    self = [super initWithUIViewController:viewController];
    if (self) {
        if ([viewController isMemberOfClass:NSClassFromString(@"LoginViewController")]) {

        }
        if ([viewController isMemberOfClass:NSClassFromString(@"SignUpViewController")]) {
        
        }
    }
    
    return self;
}
-(void)pushToSignUpBy:(LoginViewController *)viewController{
    SignUpViewController *vc = [SignUpViewController new];
    vc.title = @"注册";
    [viewController.navigationController pushViewController:vc animated:YES];
}
-(void)setForgotBtn:(UIButton *)forgotBtn{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"忘记密码"];
    NSRange strRange = {0,[str length]};
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
    [str addAttribute:NSForegroundColorAttributeName value:SUN_GlobalTextBlackColor range:strRange];
    [forgotBtn setAttributedTitle:str forState:UIControlStateNormal];
}

-(void)login:(NSString *)phone password:(NSString *)password viewController:(UIViewController *)viewController{
    NSString *url = [NSString stringWithFormat:@"%@/Apiuser/login_act",[ServerConfig sharedServerConfig].url];    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [params setValue:phone forKey:@"login_info"];
    [params setValue:password forKey:@"password"];

    [NetManager requestWithType:HttpRequestTypePost UrlString:url Parameters:params SuccessBlock:^(id response) {
        [HUD setMinimumDismissTimeInterval:1];
        STATUS *status = [STATUS mj_objectWithKeyValues:[response objectForKey:@"status"]];
        if (status.succeed == 1) {
            [HUD SUN_ShowSuccessWithStatus:@"登录成功"];
            self.userModel.session = [Session mj_objectWithKeyValues:[[response objectForKey:@"data"]objectForKey:@"session"]];
            self.userModel.user = [User mj_objectWithKeyValues:[[response objectForKey:@"data"] objectForKey:@"user"]];
            [self setOnline:YES];

            [viewController dismissViewControllerAnimated:YES completion:nil];
        }
        else{
            [self presentFailureHUD:status];
        }
    } FailureBlock:^(NSError *error) {
    } progress:nil];
}
-(void)signUp:(SignUpModel *)model CompletionHandle:(void (^)(id, id))completionHandle{
    NSString *url = [NSString stringWithFormat:@"%@/Apiuser/reg_act",[ServerConfig sharedServerConfig].url];
    NSMutableDictionary *params = [model mj_keyValues];
    [params setValue:model.password forKey:@"repassword"];
    [NetManager requestWithType:HttpRequestTypePost UrlString:url Parameters:params SuccessBlock:^(id response) {
        [HUD setMinimumDismissTimeInterval:1];
        STATUS *status = [STATUS mj_objectWithKeyValues:[response objectForKey:@"status"]];
        if (status.succeed == 1) {
            [HUD SUN_ShowSuccessWithStatus:@"注册成功"];
            
            completionHandle(response,nil);
                    }
        else{
            [self presentFailureHUD:status];
        }
    } FailureBlock:^(NSError *error) {
    } progress:nil];

}

-(void)sendRegMobileCode:(NSString*)mobile{
    [HUD setMinimumDismissTimeInterval:1];
    if ([mobile isEqualToString:@""]) {
        [HUD SUN_ShowWithStatus:@"请输入手机号码"];
        return;
    }
    NSString *url = [NSString stringWithFormat:@"%@/Apiuser/sendRegMobileCode",[ServerConfig sharedServerConfig].url];

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:mobile forKey:@"mobile"];
    [NetManager requestWithType:HttpRequestTypePost UrlString:url Parameters:params SuccessBlock:^(id response) {
        STATUS *status = [STATUS mj_objectWithKeyValues:[response objectForKey:@"status"]];
        if (status.succeed == 1) {
            [HUD SUN_ShowSuccessWithStatus:@"发送验证码成功"];
            
        }
        else{
            [self presentFailureHUD:status];
        }
    } FailureBlock:^(NSError *error) {
    } progress:nil];

}
@end