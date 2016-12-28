//
//  SignUpModel.h
//  yxl-ios
//
//  Created by mac on 16/12/28.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLBaseModel.h"

@interface SignUpModel : YXLBaseModel

@property( nonatomic, copy) NSString        * mobile;

@property( nonatomic, copy) NSString        * username;

@property( nonatomic, copy) NSString        * password;

@property( nonatomic, copy) NSString        * mobile_code;

@property( nonatomic, copy) NSString        * pid;

@property( nonatomic, copy) NSString        * province;

@property( nonatomic, copy) NSString        * city;

@property( nonatomic, copy) NSString        * area;

@end
