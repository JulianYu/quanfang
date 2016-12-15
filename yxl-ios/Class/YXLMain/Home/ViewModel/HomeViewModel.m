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
@end
@implementation HomeViewModel
- (instancetype)initWithViewController:(YXLBaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        if ([viewController isKindOfClass:[HomeViewController class]]) {

            viewController.navigationController.navigationBar.hidden = YES;
            [viewController.view SUN_AddSubViewsWithArray:@[self.headerView,self.trunkView]];
            [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.right.mas_equalTo(0);
                make.height.mas_equalTo(SCREEN_HEIGHT/4);
            }];
            [self.trunkView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(UIEdgeInsetsMake(SCREEN_HEIGHT/4, 0, 49, 0));
            }];

        }
    }
    return self;
}
-(HomeHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [HomeHeaderView new];
        
    }
    return _headerView;
}
-(HomeTrunkView *)trunkView{
    if (!_trunkView) {
        _trunkView = [HomeTrunkView new];
    }
    return _trunkView;
}
@end
