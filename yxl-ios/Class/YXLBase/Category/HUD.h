//
//  HUD.h
//  xuanxiu-ios
//
//  Created by mac on 16/12/12.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "SVProgressHUD.h"

@interface HUD : SVProgressHUD
/** 上传图片时提示 */
+ (void)SUN_ShowUploadingProgress:(NSProgress *)progress;
/** 提示当前进度 */
+ (void)SUN_ShowProgress:(float)progress;
/** 带文件提示进度 */
+ (void)SUN_ShowProgress:(float)progress status:(NSString *)status;
/** 成功时提示 */
+(void)SUN_ShowSuccessWithStatus:(NSString *)status;
/** 展示提示 */
+(void)SUN_ShowWithStatus:(NSString *)status;
/** 错误时提示 */
+(void)SUN_ShowErrorWithStatus:(NSString *)status;
@end
