//
//  BusinessCartListViewController.m
//  yxl-ios
//
//  Created by mac on 16/12/26.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "BusinessCartListViewController.h"
#import "ProductsCartViewModel.h"
@interface BusinessCartListViewController ()
@property( nonatomic, strong) ProductsCartViewModel        * viewModel;
@end

@implementation BusinessCartListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewModel];
    
}
-(ProductsCartViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[ProductsCartViewModel alloc]initWithViewController:self];
    }
    return _viewModel;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

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
