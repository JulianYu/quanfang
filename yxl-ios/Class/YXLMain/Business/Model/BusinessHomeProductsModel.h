//
//  BusinessHomeProductsModel.h
//  yxl-ios
//
//  Created by mac on 17/1/3.
//  Copyright © 2017年 孙若淮. All rights reserved.
//

#import "YXLBaseModel.h"

@class ProductsData,Goods;
@interface BusinessHomeProductsModel : YXLBaseModel

@property (nonatomic, copy) NSString *url;

@property (nonatomic, strong) NSArray<ProductsData *> *data;

@end

@interface ProductsData : NSObject

@property (nonatomic, copy) NSString *sort;

@property (nonatomic, copy) NSString *seller_id;

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *keywords;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, strong) NSArray<Goods *> *goods;

@property (nonatomic, copy) NSString *parent_id;

@property (nonatomic, copy) NSString *descript;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *visibility;

@end

@interface Goods : NSObject

@property (nonatomic, copy) NSString *market_price;

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, copy) NSString *sell_price;

@property (nonatomic, copy) NSString *name;

@end
