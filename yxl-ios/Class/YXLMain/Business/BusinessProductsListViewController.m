//
//  BusinessProductsListViewController.m
//  yxl-ios
//
//  Created by mac on 16/12/16.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "BusinessProductsListViewController.h"
#import "ProductListViewModel.h"
@interface BusinessProductsListViewController()
@property( nonatomic, strong) ProductListViewModel        * viewModel;
@end
@implementation BusinessProductsListViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewModel];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.alpha = 1;
    self.navigationController.navigationBar.hidden = NO;
}
- (ProductListViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[ProductListViewModel alloc]initWithViewController:self];
        _viewModel.indexPath = self.indexpath;
    }
    return  _viewModel;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
