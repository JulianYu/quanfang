//
//  ProgessHUD.h
//  StockRight
//
//  Created by 虞军军 on 16/11/3.
//  Copyright © 2016年 erongchuang. All rights reserved.
//

#import "SVProgressHUD.h"

@interface ProgessHUD : SVProgressHUD

+ (void)showWithStatus:(NSString *)status;
/** 上传图片时提示 */
+ (void)showUploadingProgress:(NSProgress *)progress;
+ (void)showProgress:(float)progress;
+ (void)showProgress:(float)progress status:(NSString *)status;

@end
