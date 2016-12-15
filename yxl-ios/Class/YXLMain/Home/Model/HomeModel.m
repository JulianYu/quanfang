//
//  HomeModel.m
//  yxl-ios
//
//  Created by mac on 16/12/14.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel

+ (NSDictionary *)objectClassInArray{
    return @{@"dataArray" : [HomeSectionData class]};
}

@end
@implementation HomeSectionData

+ (NSDictionary *)objectClassInArray{
    return @{@"first" : [HomeRowData class],@"second" : [HomeRowData class]};
}

@end
@implementation HomeRowData



@end
