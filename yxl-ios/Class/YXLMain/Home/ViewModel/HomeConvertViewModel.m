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
@interface HomeConvertViewModel ()
@property( nonatomic, strong) HomeConvertTableView        * convertTableView;
@property( nonatomic, strong) MineCommonFooterView        * footerView;
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
    }
    return self;
}
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
@end
