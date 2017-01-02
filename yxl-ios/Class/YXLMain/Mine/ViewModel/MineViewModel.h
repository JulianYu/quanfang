//
//  MineViewModel.h
//  yxl-ios
//
//  Created by mac on 16/12/13.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLBaseViewModel.h"

@interface MineViewModel : YXLBaseViewModel
-(void)pushToPersonalViewControllerBY:(UIViewController*)viewController;
-(void)uploadAvatarImage:(NSArray*)imagesArray;
-(void)modifyUserInformationByHead_ico:(NSString*)head_ico nickname:(NSString*)nickname sex:(NSString*)sex CompletionHandle:(void (^)(id model , id error))completionHandle;

@end
