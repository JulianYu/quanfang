//
//  MinePendingViewModel.m
//  yxl-ios
//
//  Created by mac on 16/12/21.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MinePendingViewModel.h"
#import "MinePendingViewController.h"
#import "MinePendingTrunkTableView.h"
@interface MinePendingViewModel()
@property( nonatomic, strong) MinePendingTrunkTableView        * trunkTabelView;
@end
@implementation MinePendingViewModel
- (instancetype)initWithViewController:(YXLBaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        
        if ([viewController isKindOfClass:[MinePendingViewController class]]) {
            [viewController.view addSubview:self.trunkTabelView];
        }
    }
    return self;
}
-(MinePendingTrunkTableView *)trunkTabelView{
    if (!_trunkTabelView) {
        _trunkTabelView = [[MinePendingTrunkTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44+34+44+54+54+10)];
    }
    return _trunkTabelView;
}
@end
