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
@interface Session : NSObject

@property (nonatomic, copy) NSString *sid;

@property (nonatomic, copy) NSString *uid;
//是否设置交易密码 0为无，1为有
@property (nonatomic, assign) NSInteger pay_password_stat;

@end

@interface User : NSObject
//生日
@property (nonatomic, copy) NSString *birthday;
//会员级别
@property (nonatomic, copy) NSString *group_id;
//注册时间
@property (nonatomic, copy) NSString *time;
//邮政编码
@property (nonatomic, copy) NSString *zip;
//状态1为正常，2为删除，3为锁定
@property (nonatomic, copy) NSString *status;
//用户id
@property (nonatomic, copy) NSString *user_id;
//昵称
@property (nonatomic, copy) NSString *nickname;
//联系电话
@property (nonatomic, copy) NSString *telephone;
//所属区域
@property (nonatomic, copy) NSString *region;
//性别
@property (nonatomic, copy) NSString *sex;
//最后登录时间
@property (nonatomic, copy) NSString *last_login;
//身份证
@property (nonatomic, copy) NSString *idcard;
//余额
@property (nonatomic, copy) NSString *balance;
//用户id
@property (nonatomic, copy) NSString *id;
//手机号
@property (nonatomic, copy) NSString *mobile;
//银积分
@property (nonatomic, copy) NSString *silver;
//金积分
@property (nonatomic, copy) NSString *gold;
//真实姓名
@property (nonatomic, copy) NSString *true_name;
//收货地址
@property (nonatomic, copy) NSString *area;
//推荐人id
@property (nonatomic, copy) NSString *pid;
//头像
@property (nonatomic, copy) NSString *head_ico;
//ＱＱ
@property (nonatomic, copy) NSString *qq;
//经验值
@property (nonatomic, copy) NSString *prop;
//用户名
@property (nonatomic, copy) NSString *username;

@end
