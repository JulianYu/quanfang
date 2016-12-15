//
//  HomeModel.h
//  yxl-ios
//
//  Created by mac on 16/12/14.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HomeRowData;
@class HomeSectionData;
@interface HomeModel : NSObject
@property( nonatomic, strong) NSArray<HomeSectionData*>        * dataArray;

@end

@interface HomeSectionData : NSObject
@property( nonatomic, strong) NSArray<HomeRowData*>        * first;
@property( nonatomic, strong) NSArray<HomeRowData*>        * second;
@property( nonatomic, copy) NSString                   * title;
@property( nonatomic, copy) NSString                   * img;

@end

@interface HomeRowData : NSObject
@property( nonatomic, copy) NSString        * img;
@property( nonatomic, copy) NSString        * text;


@end
