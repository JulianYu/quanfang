//
//  HomeNoticeListModel.h
//  yxl-ios
//
//  Created by mac on 16/12/30.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLBaseModel.h"

@class Notice;
@interface HomeNoticeListModel : YXLBaseModel

@property (nonatomic, strong) NSArray<Notice *> *data;

@end

@interface Notice : NSObject

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *time;

@end
