//
//  UserModel.h
//  yxl-ios
//
//  Created by mac on 16/12/23.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLBaseModel.h"
#import "Singleton.h"

@class Session;
@class User;

@interface UserModel : YXLBaseModel
SingletonH(UserModel)

@property( nonatomic, strong) User          * user;
@property (nonatomic, strong) Session       * session;

@end
@interface User : NSObject
@property( nonatomic, copy) NSString        * id;
@property( nonatomic, copy) NSString        * username;
@property( nonatomic, copy) NSString        * head_ico;
@property( nonatomic, copy) NSString        * password;

@end

@interface Session : NSObject
@property( nonatomic, copy) NSString        * sid;
@property( nonatomic, copy) NSString        * uid;


@end
