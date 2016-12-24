//
//  UserViewModel.m
//  yxl-ios
//
//  Created by mac on 16/12/23.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "UserViewModel.h"
#import "YXLTabBarController.h"
@interface UserViewModel ()
@property( nonatomic, strong) UITextField        * phoneTF;
@property( nonatomic, strong) UITextField        * passwordTF;
@property( nonatomic, strong) UITextField        * rePasswordTF;
@property( nonatomic, strong) UIButton           * forgotBtn;
@end
@implementation UserViewModel
+(BOOL)online{
    if ([UserModel sharedUserModel].session) {
        return YES;
    }
    return NO;
}
-(void)setOnline:(BOOL)flag{

}
-(void)setOffline:(BOOL)flag{

}

- (instancetype)initWithUIViewController:(UIViewController *)viewController
{
    self = [super initWithUIViewController:viewController];
    if (self) {
        if ([viewController isMemberOfClass:NSClassFromString(@"LoginViewController")]) {
            self.phoneTF = ((LoginViewController*)viewController).phoneTF;
            self.passwordTF = ((LoginViewController*)viewController).passwordTF;
            self.phoneTF = ((LoginViewController*)viewController).phoneTF;
            self.forgotBtn = ((LoginViewController*)viewController).forgotPasswordBtn;
                    }
        
    }
    return self;
}
-(void)pushToSignUpBy:(LoginViewController *)viewController{
    SignUpViewController *vc = [SignUpViewController new];
    vc.title = @"注册";
    [viewController.navigationController pushViewController:vc animated:YES];
}
-(void)checkToLogin{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [UIApplication sharedApplication].keyWindow.rootViewController = [[YXLTabBarController alloc]init];
}
-(void)setForgotBtn:(UIButton *)forgotBtn{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"忘记密码"];
    NSRange strRange = {0,[str length]};
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
    [str addAttribute:NSForegroundColorAttributeName value:SUN_GlobalTextBlackColor range:strRange];
    [forgotBtn setAttributedTitle:str forState:UIControlStateNormal];
}
@end
