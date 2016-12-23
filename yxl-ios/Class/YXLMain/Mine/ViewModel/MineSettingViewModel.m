//
//  MineSettingViewModel.m
//  yxl-ios
//
//  Created by mac on 16/12/21.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineSettingViewModel.h"
#import "MineSettingsTableView.h"
#import "MineModifyPasswordTableView.h"
#import "MineCommonFooterView.h"
#import "MineTransactionPasswordViewController.h"
@interface MineSettingViewModel ()
@property( nonatomic, strong) MineSettingsTableView        * settingTableView;
@property( nonatomic, strong) MineModifyPasswordTableView        * modifyTableView;
@property( nonatomic, strong) MineCommonFooterView        * footerView;
@end
@implementation MineSettingViewModel
- (instancetype)initWithViewController:(YXLBaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        if ([viewController isKindOfClass:NSClassFromString(@"MineSettingViewController")]) {
            [viewController.view addSubview:self.settingTableView];
        }
        if ([viewController isKindOfClass:NSClassFromString(@"MineModifyPasswordViewController")]) {
            [viewController.view addSubview:self.modifyTableView];
            self.footerView.y = self.modifyTableView.height+20;
            [viewController.view addSubview:self.footerView];
            [self.footerView update];
        }
        if ([viewController isKindOfClass:NSClassFromString(@"MineTransactionPasswordViewController")]) {
            self.footerView.y = ((MineTransactionPasswordViewController*)viewController).rePasswordTF.bottom+20;
            [viewController.view addSubview:self.footerView];
            [self.footerView update];
        }

    }
    return self;
}
-(MineModifyPasswordTableView *)modifyTableView{
    if (!_modifyTableView) {
        _modifyTableView = [[MineModifyPasswordTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10+44*3)];
    }
    return _modifyTableView;
}
-(MineSettingsTableView *)settingTableView{
    if (!_settingTableView) {
        _settingTableView = [[MineSettingsTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10*3+44*6)];
    }
    return _settingTableView;
}
-(MineCommonFooterView *)footerView{
    if (!_footerView) {
        _footerView= [[MineCommonFooterView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    }
    return _footerView;
}
@end
