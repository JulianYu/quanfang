//
//  MineModel.h
//  yxl-ios
//
//  Created by mac on 16/12/13.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SectionData;
@class RowData;
@interface MineModel : NSObject
@property( nonatomic, strong) NSArray<SectionData*>        * dataArray;
@end

@interface SectionData : NSObject
@property( nonatomic, copy) NSString         * title;
@property( nonatomic, strong) NSArray<RowData*>        * data;

@end
@interface RowData : NSObject
@property( nonatomic, copy) NSString        * img;
@property( nonatomic, copy) NSString        * text;


@end
