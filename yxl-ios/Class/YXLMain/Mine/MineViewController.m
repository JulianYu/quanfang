//
//  MineViewController.m
//  yxl-ios
//
//  Created by mac on 16/12/12.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineViewController.h"
#import "MineViewModel.h"
@interface MineViewController ()
@property( nonatomic, strong) MineViewModel         * viewModel;
@end

@implementation MineViewController

-(MineViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[MineViewModel alloc]initWithViewController:self];
    }
    return _viewModel;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self viewModel];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
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
