//
//  BusinessModel.m
//  yxl-ios
//
//  Created by mac on 16/12/14.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "BusinessModel.h"

int i ;

@implementation BusinessModel
+ (NSDictionary *)objectClassInArray{
    return @{@"dataArray" : [GridListData class]};
}
-(void)test1{
    i =5;
    
    i = SCREEN_WIDTH;
}

@end

@implementation GridListData
-(void)test2{
    i = 6;
}


@end
