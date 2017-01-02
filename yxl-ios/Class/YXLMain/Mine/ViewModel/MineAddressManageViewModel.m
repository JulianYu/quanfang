//
//  MineAddressManageViewModel.m
//  yxl-ios
//
//  Created by mac on 16/12/27.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineAddressManageViewModel.h"
#import "MineAddressListTableView.h"
#import "MineAddressAddTableView.h"
@interface MineAddressManageViewModel()
@property( nonatomic, strong) MineAddressListTableView          * listTableView;
@property( nonatomic, strong) MineAddressAddTableView           * addTableView;
@end
@implementation MineAddressManageViewModel
- (instancetype)initWithViewController:(YXLBaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        if ([viewController isMemberOfClass:NSClassFromString(@"MineAddressManageViewController")]) {
            [viewController.view addSubview:self.listTableView];
        }
        if ([viewController isMemberOfClass:NSClassFromString(@"MineAddressAddViewController")]) {
            [viewController.view addSubview:self.addTableView];
        }
    }
    return self;
}
#pragma mark - lazy
-(MineAddressAddTableView *)addTableView{
    if (!_addTableView) {
        _addTableView = [[MineAddressAddTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _addTableView;
}
-(MineAddressListTableView *)listTableView{
    if (!_listTableView) {
        _listTableView = [[MineAddressListTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _listTableView;
}

@end
