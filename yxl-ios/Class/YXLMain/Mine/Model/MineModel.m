//
//  MineModel.m
//  yxl-ios
//
//  Created by mac on 16/12/13.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineModel.h"

@implementation MineModel

+ (NSDictionary *)objectClassInArray{
    return @{@"dataArray" : [SectionData class]};
}

@end

@implementation SectionData
+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [RowData class]};
}


@end
@implementation RowData



@end
