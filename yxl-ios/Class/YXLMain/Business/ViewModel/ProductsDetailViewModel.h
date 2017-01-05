//
//  ProductsDetailViewModel.h
//  yxl-ios
//
//  Created by mac on 16/12/19.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLBaseViewModel.h"
#import "BusinessHomeProductsModel.h"
@interface ProductsDetailViewModel : YXLBaseViewModel
@property( nonatomic, strong) Goods        * data;
-(void)show;
@end
