//
//  HUD.m
//  xuanxiu-ios
//
//  Created by mac on 16/12/12.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "HUD.h"

@implementation HUD
+ (void)SUN_ShowWithStatus:(NSString *)status {
    [[self appearance] setMinimumDismissTimeInterval:1];
    [super showWithStatus:status];
    [[self appearance] setDefaultStyle:SVProgressHUDStyleDark];
}
+ (void)SUN_ShowUploadingProgress:(NSProgress *)progress {
    CGFloat total = (CGFloat)progress.totalUnitCount;
    CGFloat completed = (CGFloat)progress.completedUnitCount;
    CGFloat tempProgress = completed / total;
    NSString *status = [NSString stringWithFormat:@"上传中...%d%%",(int)(tempProgress*100)];
    [self showProgress:tempProgress status:status];
    [[self appearance] setDefaultStyle:SVProgressHUDStyleCustom];
    [[self appearance] setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [[self appearance] setBackgroundColor:[UIColor blackColor]];
    [[self appearance] setForegroundColor:[UIColor whiteColor]];
    
}
+ (void)SUN_ShowInfoWithStatus:(NSString *)status{
    [[self appearance] setMinimumDismissTimeInterval:1];
    [super showInfoWithStatus:status];
    [[self appearance] setDefaultStyle:SVProgressHUDStyleDark];
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:1];
}
+ (void)SUN_ShowProgress:(float)progress {
    [[self appearance] setMinimumDismissTimeInterval:1];
    [self showProgress:progress status:nil];
    [[self appearance] setDefaultStyle:SVProgressHUDStyleDark];
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:1];

}
+ (void)SUN_ShowErrorWithStatus:(NSString *)status{
    [[self appearance] setMinimumDismissTimeInterval:1];
    [super showErrorWithStatus:status];
    [[self appearance] setDefaultStyle:SVProgressHUDStyleDark];
    
}
+(void)SUN_ShowSuccessWithStatus:(NSString *)status{
    [[self appearance] setMinimumDismissTimeInterval:1];
    [super showSuccessWithStatus:status];
    [[self appearance] setDefaultStyle:SVProgressHUDStyleDark];
    
}

+ (void)SUN_ShowProgress:(float)progress status:(NSString *)status {
    [[self appearance] setMinimumDismissTimeInterval:1];
    [super showProgress:progress status:status];
    [[self appearance] setDefaultStyle:SVProgressHUDStyleDark];
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:1];

    
}
+ (instancetype)appearance {
    
    
    return [super appearance];
}

@end
