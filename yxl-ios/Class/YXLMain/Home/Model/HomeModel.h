//
//  HomeModel.h
//  yxl-ios
//
//  Created by mac on 16/12/14.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HomeRowData;
@class HomeFunctionData;
@interface HomeModel : NSObject
@property( nonatomic, strong) NSArray<HomeRowData*>           * HeaderRowData;
@property( nonatomic, strong) NSArray<HomeFunctionData*>      * dataArray;

@end

@interface HomeFunctionData : NSObject
@property( nonatomic, copy) NSString                          * text;
@property( nonatomic, copy) NSString                          * img;

@end

@interface HomeRowData : NSObject
@property( nonatomic, copy) NSString                          * img;
@property( nonatomic, copy) NSString                          * title;


@end

