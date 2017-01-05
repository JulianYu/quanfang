//
//  BusinessViewModel.h
//  yxl-ios
//
//  Created by mac on 16/12/14.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLBaseViewModel.h"
#import "BusinessBannerCell.h"
@interface BusinessViewModel : YXLBaseViewModel

-(void)setUpBannerDataBy:(BusinessBannerCell*)cell;

-(void)getChildCategoryByParentid:(NSString*)parentId CompletionHandle:(void (^)(id model , id error))completionHandle;

@end
