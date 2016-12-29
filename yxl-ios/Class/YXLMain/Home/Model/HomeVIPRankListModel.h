//
//  HomeVIPRankListModel.h
//  yxl-ios
//
//  Created by mac on 16/12/29.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLBaseModel.h"

@class VIPRankList;

@interface HomeVIPRankListModel : YXLBaseModel

@property (nonatomic, strong) NSArray<VIPRankList *> *data;

@end

@interface VIPRankList : NSObject

@property (nonatomic, copy) NSString *discount;

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *minexp;

@property (nonatomic, copy) NSString *group_name;

@property (nonatomic, copy) NSString *message_ids;

@property (nonatomic, copy) NSString *maxexp;

@end
