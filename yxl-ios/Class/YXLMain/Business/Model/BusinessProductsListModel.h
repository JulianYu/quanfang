//
//  BusinessProductsListModel.h
//  yxl-ios
//
//  Created by mac on 17/1/5.
//  Copyright © 2017年 孙若淮. All rights reserved.
//

#import "YXLBaseModel.h"
@class ProductListData;
@interface BusinessProductsListModel : YXLBaseModel

@property (nonatomic, strong) NSArray<ProductListData *> *data;

@end

@interface ProductListData : NSObject

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, copy) NSString *sell_price;

@property (nonatomic, copy) NSString *name;

@end

