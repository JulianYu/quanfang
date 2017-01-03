//
//  ProductsOrderViewModel.m
//  yxl-ios
//
//  Created by mac on 17/1/3.
//  Copyright © 2017年 孙若淮. All rights reserved.
//

#import "ProductsOrderViewModel.h"
#import "OrderDetailTableView.h"
@interface ProductsOrderViewModel ()
@property( nonatomic, strong) OrderDetailTableView        * detailTableView;
@end
@implementation ProductsOrderViewModel
- (instancetype)initWithViewController:(YXLBaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        if ([viewController isMemberOfClass:NSClassFromString(@"BusinessOrderViewController")]) {
            [viewController.view addSubview:self.detailTableView];
        }
    }
    return self;
}

-(OrderDetailTableView *)detailTableView{
    if (!_detailTableView) {
        _detailTableView = [[OrderDetailTableView alloc]initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH-20, SCREEN_HEIGHT)];
    }
    return _detailTableView;
}

@end
