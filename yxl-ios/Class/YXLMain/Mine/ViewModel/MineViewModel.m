//
//  MineViewModel.m
//  yxl-ios
//
//  Created by mac on 16/12/13.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineViewModel.h"
#import "MineHeaderView.h"
#import "MineTrunkView.h"
#import "MineModel.h"
#import "MineInfromationTableView.h"
#import "MineDetailViewController.h"
@interface MineViewModel()
@property( nonatomic, strong) MineHeaderView        * headerView;
@property( nonatomic, strong) MineTrunkView         * trunkView;
@property( nonatomic, strong) MineModel             * model;

@property( nonatomic, strong) MineInfromationTableView        * informationTableView;
@end
@implementation MineViewModel
- (instancetype)initWithViewController:(YXLBaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        if ([viewController isMemberOfClass:NSClassFromString(@"MineViewController")]) {
            viewController.navigationController.navigationBar.hidden = YES;
            [viewController.view addSubview:self.headerView];
            [viewController.view addSubview:self.trunkView];
            [self.trunkView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(UIEdgeInsetsMake(self.headerView.height, 0, 49, 0));
            }];

        }
        if ([viewController isMemberOfClass:NSClassFromString(@"MineDetailViewController")]) {
            [viewController.view addSubview:self.informationTableView];
        }
        if ([viewController isMemberOfClass:NSClassFromString(@"MineModifyNickNameViewController")]) {
            
        }
        if ([viewController isMemberOfClass:NSClassFromString(@"MineModifySexViewController")]) {
            
        }
        
    }
    return self;
}
-(MineHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[MineHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 130)];
        
    }
    return _headerView;
}
-(MineTrunkView *)trunkView{
    if (!_trunkView) {
        _trunkView = [[MineTrunkView alloc]initWithFrame:CGRectZero];
    }
    return _trunkView;
}
-(MineInfromationTableView *)informationTableView{
    if (!_informationTableView) {
        _informationTableView = [[MineInfromationTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _informationTableView;
}
-(void)pushToPersonalViewControllerBY:(UIViewController *)viewController{
    if ([UserViewModel online]) {
        MineDetailViewController *vc = [MineDetailViewController new];
        vc.title = @"资料信息";
        [viewController.navigationController pushViewController:vc animated:YES];
    }
    else{
        [UserViewModel showLogin];
    }
    

}
@end
