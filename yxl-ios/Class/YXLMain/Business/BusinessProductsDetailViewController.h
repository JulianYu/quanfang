//
//  BusinessProductsDetailViewController.h
//  yxl-ios
//
//  Created by mac on 16/12/19.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLBaseViewController.h"
#import "ProductsDetailViewModel.h"
#import "BusinessHomeProductsModel.h"
@interface BusinessProductsDetailViewController : YXLBaseViewController
@property( nonatomic, strong) ProductsDetailViewModel        * viewModel;
@property( nonatomic, strong) Goods        * data;

@end
