//
//  AddressPickView.h
//  yxl-ios
//
//  Created by mac on 16/12/27.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^AdressBlock) (NSString *province,NSString *city,NSString *town);
@interface AddressPickView : UIView<UIPickerViewDataSource,UIPickerViewDelegate>
+ (instancetype)shareInstance;

@property(nonatomic,copy)AdressBlock block;


@end
