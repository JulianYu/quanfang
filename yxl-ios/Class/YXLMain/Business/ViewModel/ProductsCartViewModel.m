//
//  ProductsCartViewModel.m
//  yxl-ios
//
//  Created by mac on 16/12/26.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "ProductsCartViewModel.h"
#import "CartListTableView.h"
@interface ProductsCartViewModel()
@property( nonatomic, strong) CartListTableView        * CartListtableView;
@end
@implementation ProductsCartViewModel
- (instancetype)initWithViewController:(YXLBaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        if ([viewController isMemberOfClass:NSClassFromString(@"BusinessCartListViewController")]) {
            
        }
    }
    return self;
}



@end
