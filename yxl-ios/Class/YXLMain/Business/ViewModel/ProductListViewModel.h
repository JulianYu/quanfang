//
//  ProductListViewModel.h
//  yxl-ios
//
//  Created by mac on 16/12/16.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLBaseViewModel.h"
#import "BusinessHomeProductsModel.h"
@interface ProductListViewModel : YXLBaseViewModel
@property( nonatomic, strong) ProductsData        * productsData;
@end
