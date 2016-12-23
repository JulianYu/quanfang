//
//  BusinessModel.h
//  yxl-ios
//
//  Created by mac on 16/12/14.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GridListData;

@interface BusinessModel : NSObject
@property( nonatomic, strong) NSArray<GridListData*>        * dataArray;
@end

@interface GridListData : NSObject
@property( nonatomic, copy) NSString        * img;
@property( nonatomic, copy) NSString        * title;



@end
