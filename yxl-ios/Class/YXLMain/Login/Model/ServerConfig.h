//
//  ServerConfig.h
//  xuanxiu-ios
//
//  Created by mac on 16/10/22.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "YXLBaseModel.h"

@interface ServerConfig : YXLBaseModel
SingletonH(ServerConfig)
@property (nonatomic, strong) NSString *url;
@end
