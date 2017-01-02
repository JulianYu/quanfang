//
//  MineSettingViewModel.m
//  yxl-ios
//
//  Created by mac on 16/12/21.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineSettingViewModel.h"
#import "MineSettingsTableView.h"
#import "MineModifyPasswordTableView.h"
#import "MineCommonFooterView.h"
#import "MineFeedBackTableView.h"
#import "MineTransactionPasswordViewController.h"

@interface MineSettingViewModel ()
@property( nonatomic, strong) MineSettingsTableView        * settingTableView;
@property( nonatomic, strong) MineModifyPasswordTableView        * modifyTableView;
@property( nonatomic, strong) MineCommonFooterView        * footerView;
@property( nonatomic, strong) MineFeedBackTableView        * feedBackTableView;
@end
@implementation MineSettingViewModel
- (instancetype)initWithViewController:(YXLBaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        if ([viewController isMemberOfClass:NSClassFromString(@"MineSettingViewController")]) {
            [viewController.view addSubview:self.settingTableView];
        }
        if ([viewController isMemberOfClass:NSClassFromString(@"MineModifyPasswordViewController")]) {
            [viewController.view addSubview:self.modifyTableView];
            self.footerView.y = self.modifyTableView.height+20;
            [viewController.view addSubview:self.footerView];
            [self.footerView update];
        }
        if ([viewController isMemberOfClass:NSClassFromString(@"MineTransactionPasswordViewController")]) {
            self.footerView.y = ((MineTransactionPasswordViewController*)viewController).rePasswordTF.bottom+20;
            [viewController.view addSubview:self.footerView];
            [self.footerView update];
        }

        if ([viewController isMemberOfClass:NSClassFromString(@"MineFeedBackViewController")]) {
            [viewController.view addSubview:self.feedBackTableView];
            self.footerView.y = self.feedBackTableView.bottom+20;
            [viewController.view addSubview:self.footerView];
            [self.footerView update];
        }
    }
    return self;
}
#pragma mark - lazy
-(MineFeedBackTableView *)feedBackTableView{
    if (!_feedBackTableView) {
        _feedBackTableView = [[MineFeedBackTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 160)];
    }
    return _feedBackTableView;
}
-(MineModifyPasswordTableView *)modifyTableView{
    if (!_modifyTableView) {
        _modifyTableView = [[MineModifyPasswordTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10+44*3)];
    }
    return _modifyTableView;
}
-(MineSettingsTableView *)settingTableView{
    if (!_settingTableView) {
        _settingTableView = [[MineSettingsTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _settingTableView;
}
-(MineCommonFooterView *)footerView{
    if (!_footerView) {
        _footerView= [[MineCommonFooterView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    }
    return _footerView;
}
#pragma mark -network request
-(void)modifyPasswordBtnClickBy:(UIViewController *)viewController{
    
    NSString *url = [NSString stringWithFormat:@"%@/ApiPersonal/password_edit",[ServerConfig sharedServerConfig].url];
    Session *session = [UserModel sharedUserModel].session;
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"session":[session mj_keyValues]}];
    [params setValue:self.modifyTableView.model.fpassword forKey:@"fpassword"];
    [params setValue:self.modifyTableView.model.password forKey:@"password"];
    [params setValue:self.modifyTableView.model.repassword forKey:@"repassword"];
    [NetManager requestWithType:HttpRequestTypePost UrlString:url Parameters:params SuccessBlock:^(id response) {
        STATUS *status = [STATUS mj_objectWithKeyValues:[response objectForKey:@"status"]];
        if (status.succeed == 1) {
            [HUD SUN_ShowSuccessWithStatus:status.msg];
            [viewController.navigationController popViewControllerAnimated:YES];
        }
        else{
            [YXLBaseViewModel presentFailureHUD:status];
        }
    } FailureBlock:^(NSError *error) {
        [YXLBaseViewModel presentFailureHUD:nil];
    } progress:nil];
}
-(void)sendMobileCode:(NSString *)mobile{
    NSString *url = [NSString stringWithFormat:@"%@/ApiPersonal/sendMobileCodes",[ServerConfig sharedServerConfig].url];
    Session *session = [UserModel sharedUserModel].session;
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"session":[session mj_keyValues]}];
    [params setValue:mobile forKey:@"mobile"];
    [NetManager requestWithType:HttpRequestTypePost UrlString:url Parameters:params SuccessBlock:^(id response) {
        STATUS *status = [STATUS mj_objectWithKeyValues:[response objectForKey:@"status"]];
        if (status.succeed == 1) {
            [HUD SUN_ShowSuccessWithStatus:status.msg];
        }
        else{
            [YXLBaseViewModel presentFailureHUD:status];
        }
    } FailureBlock:^(NSError *error) {
    } progress:nil];
    
}

-(void)setTransactionPasswordBy:(UIViewController *)viewController{
    NSString *url = [NSString stringWithFormat:@"%@/ApiPersonal/Paypassword_edit",[ServerConfig sharedServerConfig].url];
    Session *session = [UserModel sharedUserModel].session;
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"session":[session mj_keyValues]}];
    [params setValue:((MineTransactionPasswordViewController*)viewController).phoneTF.text forKey:@"mobile"];
    [params setValue:((MineTransactionPasswordViewController*)viewController).PINTF.text forKey:@"mobild_code"];
    [params setValue:((MineTransactionPasswordViewController*)viewController).passwordTF.text forKey:@"pay_password"];
    [params setValue:((MineTransactionPasswordViewController*)viewController).rePasswordTF.text forKey:@"pay_repassword"];
    [NetManager requestWithType:HttpRequestTypePost UrlString:url Parameters:params SuccessBlock:^(id response) {
        STATUS *status = [STATUS mj_objectWithKeyValues:[response objectForKey:@"status"]];
        if (status.succeed == 1) {
            [HUD SUN_ShowSuccessWithStatus:status.msg];
            [viewController.navigationController popViewControllerAnimated:YES];
        }
        else{
            [YXLBaseViewModel presentFailureHUD:status];
        }
    } FailureBlock:^(NSError *error) {
    } progress:nil];

}
@end
