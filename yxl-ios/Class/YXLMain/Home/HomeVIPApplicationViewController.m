//
//  HomeVIPApplicationViewController.m
//  yxl-ios
//
//  Created by mac on 16/12/24.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "HomeVIPApplicationViewController.h"

@implementation HomeVIPApplicationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewModel];
}
-(HomePromoteViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[HomePromoteViewModel alloc]initWithViewController:self];
    }
    return _viewModel;
}
-(void)viewWillAppear:(BOOL)animated{
    [self.viewModel reloadData];
    [self.viewModel.applicationTableView reloadData];
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
