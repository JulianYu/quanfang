//
//  YXLBaseModel.h
//  yxl-ios
//
//  Created by mac on 16/12/23.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import <Foundation/Foundation.h>
@class STATUS;
@interface YXLBaseModel : NSObject
@property (nonatomic, strong) STATUS *status;
@end

@interface STATUS : NSObject
@property (nonatomic, copy) NSNumber *status;
@property (nonatomic, copy) NSString *msg;
@end
