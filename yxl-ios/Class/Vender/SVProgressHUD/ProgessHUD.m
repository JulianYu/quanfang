//
//  ProgessHUD.m
//  StockRight
//
//  Created by 虞军军 on 16/11/3.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "ProgessHUD.h"

@implementation ProgessHUD
+ (void)showWithStatus:(NSString *)status {
    [super showWithStatus:status];
    [[self appearance] setDefaultStyle:SVProgressHUDStyleDark];
}
+ (void)showUploadingProgress:(NSProgress *)progress {
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
+ (void)showProgress:(float)progress {
    [self showProgress:progress status:nil];
}
+ (void)showProgress:(float)progress status:(NSString *)status {
    [super showProgress:progress status:status];
    
}
+ (instancetype)appearance {
    return [super appearance];
}


@end
