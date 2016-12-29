//
//  YXLBaseViewModel.m
//  yxl-ios
//
//  Created by mac on 16/12/13.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLBaseViewModel.h"
#import "NetManager.h"

@implementation YXLBaseViewModel
- (instancetype)initWithViewController:(YXLBaseViewController *)viewController
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(instancetype)initWithUIViewController:(UIViewController *)viewController
{
    self = [super init];
    if (self) {
        
    }
    return self;

}
+(void)presentFailureHUD:(STATUS *)status{
    if (status.error == 2) {
        [HUD SUN_ShowErrorWithStatus:@"帐号信息过期"];
    }
    else{
        [HUD SUN_ShowErrorWithStatus:status.msg];
    }
}
@end
