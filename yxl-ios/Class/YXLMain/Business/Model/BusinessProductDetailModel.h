//
//  BusinessProductDetailModel.h
//  yxl-ios
//
//  Created by mac on 17/1/5.
//  Copyright © 2017年 孙若淮. All rights reserved.
//

#import "YXLBaseModel.h"

@class Data,Photo,Properties,Specification,Sellerinfo;
@interface BusinessProductDetailModel : YXLBaseModel

@property (nonatomic, strong) Data *data;

@end

@interface Data : NSObject

@property (nonatomic, copy) NSString *up_time;

@property (nonatomic, copy) NSString *ad_img;

@property (nonatomic, copy) NSString *group_price;

@property (nonatomic, strong) NSArray<Specification *> *specification;

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *category;

@property (nonatomic, copy) NSString *cost_price;

@property (nonatomic, copy) NSString *comments;

//@property (nonatomic, copy) NSString *description;

@property (nonatomic, copy) NSString *is_del;

@property (nonatomic, copy) NSString *visit;

@property (nonatomic, copy) NSString *unit;

@property (nonatomic, copy) NSString *brand_id;

@property (nonatomic, copy) NSString *sort;

@property (nonatomic, copy) NSString *grade;

@property (nonatomic, strong) NSArray<Photo *> *photo;

@property (nonatomic, copy) NSString *refer;

@property (nonatomic, copy) NSString *discussion;

@property (nonatomic, copy) NSString *is_share;

@property (nonatomic, copy) NSString *create_time;

@property (nonatomic, assign) NSInteger active_id;

@property (nonatomic, copy) NSString *model_id;

@property (nonatomic, copy) NSString *buy_num;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *favorite;

@property (nonatomic, copy) NSString *store_nums;

@property (nonatomic, copy) NSString *exp;

@property (nonatomic, strong) NSArray<Properties *> *properties;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *market_price;

@property (nonatomic, copy) NSString *promo;

@property (nonatomic, copy) NSString *goods_no;

@property (nonatomic, copy) NSString *sell_price;

@property (nonatomic, copy) NSString *down_time;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, copy) NSString *keywords;

@property (nonatomic, copy) NSString *sale;

@property (nonatomic, copy) NSString *search_words;

@property (nonatomic, copy) NSString *point;

@property (nonatomic, copy) NSString *seller_id;

@property (nonatomic, copy) NSString *weight;

@property (nonatomic, strong) Sellerinfo *sellerinfo;

@end

@interface Sellerinfo : NSObject

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *username;

@property (nonatomic, copy) NSString *head_ico;

@end

@interface Photo : NSObject

@property (nonatomic, copy) NSString *img;

@property (nonatomic, copy) NSString *photo_id;

@end

@interface Properties : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *attribute_value;

@end

@interface Specification : NSObject

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *value;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *type;

@end
