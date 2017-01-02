//
//  HomeConvertViewModel.m
//  yxl-ios
//
//  Created by mac on 16/12/24.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "HomeConvertViewModel.h"
#import "HomeConvertTableView.h"
#import "MineCommonFooterView.h"
#import "HomeStockPointsTableView.h"
#import "HomeStockPointsHeaderView.h"
@interface HomeConvertViewModel ()
@property( nonatomic, strong) HomeConvertTableView        * convertTableView;
@property( nonatomic, strong) MineCommonFooterView        * footerView;
@property( nonatomic, strong) HomeStockPointsTableView        * stockTableView;
@property( nonatomic, strong) HomeStockPointsHeaderView        * stockHeaderView;
@end

@implementation HomeConvertViewModel
- (instancetype)initWithViewController:(YXLBaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        if ([viewController isMemberOfClass:NSClassFromString(@"HomeConvertViewController")]) {
            [viewController.view addSubview:self.footerView];
            
            [viewController.view addSubview:self.convertTableView];
            self.footerView.y = self.convertTableView.bottom+10;
            [self.footerView update];
        }
        if ([viewController isMemberOfClass:NSClassFromString(@"HomeBuyStockPointsViewController")]) {
            
            [viewController.view SUN_AddSubViewsWithArray:@[self.stockHeaderView,self.stockTableView]];
            self.footerView.y = self.stockTableView.bottom + 20;
            [viewController.view addSubview:self.footerView];
            [self.footerView update];
        }
        if ([viewController isMemberOfClass:NSClassFromString(@"HomeDistributePointsViewController")]) {
            
        }
    }
    return self;
}
#pragma mark - lazy
-(MineCommonFooterView *)footerView{
    if (!_footerView) {
        _footerView = [[MineCommonFooterView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    }
    return _footerView;
}
-(HomeConvertTableView *)convertTableView{
    if (!_convertTableView) {
        _convertTableView = [[HomeConvertTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 5*44)];
    }
    return _convertTableView;
}
-(HomeStockPointsTableView *)stockTableView{
    if (!_stockTableView) {
        _stockTableView = [[HomeStockPointsTableView alloc]initWithFrame:CGRectMake(0, self.stockHeaderView.bottom, SCREEN_WIDTH, 10+44 *2)];
    }
    return _stockTableView;
}
-(HomeStockPointsHeaderView *)stockHeaderView{
    if (!_stockHeaderView) {
        _stockHeaderView = [[HomeStockPointsHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/4)];
    }
    return _stockHeaderView;
}
@end
