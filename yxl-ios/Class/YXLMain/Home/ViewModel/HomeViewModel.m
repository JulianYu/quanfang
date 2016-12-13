//
//  HomeViewModel.m
//  yxl-ios
//
//  Created by mac on 16/12/13.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "HomeViewModel.h"
#import "HomeHeaderView.h"
#import "HomeTrunkView.h"
#import "HomeViewController.h"
@interface HomeViewModel()
@property( nonatomic, strong) HomeHeaderView            * headerView;
@property( nonatomic, strong) HomeTrunkView             * trunkView;
@property( nonatomic, strong) HomeViewController        * viewController;
@end
@implementation HomeViewModel
- (instancetype)initWithViewController:(YXLBaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        if ([viewController isKindOfClass:[HomeViewController class]]) {
            self.viewController = (HomeViewController*)viewController;
            self.viewController.navigationController.navigationBar.hidden = YES;
            [self headerView];
        }
    }
    return self;
}
-(HomeHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [HomeHeaderView new];
        [self.viewController.view addSubview:_headerView];
        [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(0);
            make.height.mas_equalTo(SCREEN_HEIGHT/6);
        }];
    }
    return _headerView;
}
-(HomeTrunkView *)trunkView{
    if (!_trunkView) {
        _trunkView = [HomeTrunkView new];
        [self.viewController.view addSubview:_trunkView];
        [_trunkView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(SCREEN_HEIGHT/6, 0, 0, 49));
        }];
    }
    return _trunkView;
}
@end
