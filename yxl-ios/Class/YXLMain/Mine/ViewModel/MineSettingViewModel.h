//
//  MineSettingViewModel.h
//  yxl-ios
//
//  Created by mac on 16/12/21.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLBaseViewModel.h"

@interface MineSettingViewModel : YXLBaseViewModel
-(void)modifyPasswordBtnClickBy:(UIViewController*)viewController;
-(void)setTransactionPasswordBy:(UIViewController*)viewController;
-(void)sendMobileCode:(NSString*)mobile;
@end
