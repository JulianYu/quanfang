//
//  MineViewModel.m
//  yxl-ios
//
//  Created by mac on 16/12/13.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineViewModel.h"
#import "MineViewController.h"
#import "MineHeaderView.h"
#import "MineTrunkView.h"
#import "MineModel.h"
@interface MineViewModel()
@property( nonatomic, strong) MineHeaderView        * headerView;
@property( nonatomic, strong) MineTrunkView         * trunkView;
@property( nonatomic, strong) MineModel             * model;
@end
@implementation MineViewModel
- (instancetype)initWithViewController:(YXLBaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        if ([viewController isKindOfClass:[MineViewController class]]) {
            viewController.navigationController.navigationBar.hidden = YES;
            [viewController.view SUN_AddSubViewsWithArray:@[self.headerView,self.trunkView]];
            [self.trunkView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(UIEdgeInsetsMake(self.headerView.height, 0, 49, 0));
            }];

        }
        
    }
    return self;
}
-(MineHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[MineHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/5)];
        
    }
    return _headerView;
}
-(MineTrunkView *)trunkView{
    if (!_trunkView) {
        _trunkView = [[MineTrunkView alloc]initWithFrame:CGRectZero];
    }
    return _trunkView;
}

@end
