//
//  BusinessProductsDetailViewController.m
//  yxl-ios
//
//  Created by mac on 16/12/19.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "BusinessProductsDetailViewController.h"
@interface BusinessProductsDetailViewController ()
@end

@implementation BusinessProductsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewModel];
}
-(ProductsDetailViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[ProductsDetailViewModel alloc]initWithViewController:self]
        ;
        _viewModel.data = self.data;
    }
    return _viewModel;
}

-(void)viewWillAppear:(BOOL)animated{
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
