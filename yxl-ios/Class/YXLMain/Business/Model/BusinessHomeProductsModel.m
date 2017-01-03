//
//  BusinessHomeProductsModel.m
//  yxl-ios
//
//  Created by mac on 17/1/3.
//  Copyright © 2017年 孙若淮. All rights reserved.
//

#import "BusinessHomeProductsModel.h"

@implementation BusinessHomeProductsModel


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [ProductsData class]};
}
@end



@implementation ProductsData

+ (NSDictionary *)objectClassInArray{
    return @{@"goods" : [Goods class]};
}

@end


@implementation Goods

@end
