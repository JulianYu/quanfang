//
//  BusinessBannerModel.h
//  yxl-ios
//
//  Created by mac on 17/1/3.
//  Copyright © 2017年 孙若淮. All rights reserved.
//

#import "YXLBaseModel.h"
@class BannerData,BannerPlayer;

@interface BusinessBannerModel : YXLBaseModel

@property (nonatomic, strong) BannerData *data;

@end

@interface BannerData : NSObject

@property (nonatomic, strong) NSArray<BannerPlayer *> *player;

@end

@interface BannerPlayer : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *img;

@end
