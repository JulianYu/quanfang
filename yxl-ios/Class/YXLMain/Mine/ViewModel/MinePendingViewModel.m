//
//  MinePendingViewModel.m
//  yxl-ios
//
//  Created by mac on 16/12/21.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MinePendingViewModel.h"
#import "MinePendingTrunkTableView.h"
#import "MinePendingDetailTableView.h"
@interface MinePendingViewModel()
@property( nonatomic, strong) MinePendingTrunkTableView        * trunkTabelView;
@property( nonatomic, strong) MinePendingDetailTableView        * detailTableView;
@end
@implementation MinePendingViewModel
- (instancetype)initWithViewController:(YXLBaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        
        if ([viewController isKindOfClass:NSClassFromString(@"MinePendingViewController")]) {
            [viewController.view addSubview:self.trunkTabelView];
        }
        
        if ([viewController isMemberOfClass:NSClassFromString(@"MinePendingDetailViewController")]) {
            [viewController.view addSubview:self.detailTableView];
        }
    }
    return self;
}
#pragma mark - lazy
-(MinePendingTrunkTableView *)trunkTabelView{
    if (!_trunkTabelView) {
        _trunkTabelView = [[MinePendingTrunkTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44+34+44+54+54+10)];
    }
    return _trunkTabelView;
}
-(MinePendingDetailTableView *)detailTableView{
    if (!_detailTableView) {
        _detailTableView = [[MinePendingDetailTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _detailTableView;
}
@end
