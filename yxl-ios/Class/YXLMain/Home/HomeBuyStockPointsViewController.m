//
//  HomeBuyStockPointsViewController.m
//  yxl-ios
//
//  Created by mac on 17/1/2.
//  Copyright © 2017年 孙若淮. All rights reserved.
//

#import "HomeBuyStockPointsViewController.h"
#import "HomeConvertViewModel.h"
@interface HomeBuyStockPointsViewController ()
@property( nonatomic, strong) HomeConvertViewModel        * viewModel;
@end

@implementation HomeBuyStockPointsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewModel];
}
-(HomeConvertViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[HomeConvertViewModel alloc]initWithViewController:self];
    }
    return _viewModel;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
