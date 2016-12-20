//
//  ProductsDetailViewModel.m
//  yxl-ios
//
//  Created by mac on 16/12/19.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "ProductsDetailViewModel.h"
#import "ProductsDetailTrunkView.h"
#import "ProductsDetailFooterView.h"
#import "BusinessProductsDetailViewController.h"
@interface ProductsDetailViewModel()
@property( nonatomic, strong) ProductsDetailTrunkView           * trunkView;
@property( nonatomic, strong) ProductsDetailFooterView          * footerView;
@end
@implementation ProductsDetailViewModel

- (instancetype)initWithViewController:(YXLBaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        if ([viewController isKindOfClass:[BusinessProductsDetailViewController class]]) {
            [viewController.view SUN_AddSubViewsWithArray:@[self.trunkView,self.footerView]];
        }
    }
    return self;
}
-(ProductsDetailFooterView *)footerView{
    if (!_footerView) {
        _footerView = [[ProductsDetailFooterView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-49, SCREEN_WIDTH, 49)];
        _footerView.backgroundColor = [UIColor clearColor];
    }
    return _footerView;
}
-(ProductsDetailTrunkView *)trunkView{
    if (!_trunkView) {
        _trunkView = [[ProductsDetailTrunkView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-49)];
        _trunkView.backgroundColor = [UIColor clearColor];
    }
    return _trunkView;
}

@end
