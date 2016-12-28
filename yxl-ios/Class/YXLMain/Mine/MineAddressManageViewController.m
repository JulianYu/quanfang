//
//  MineAddressManageViewController.m
//  yxl-ios
//
//  Created by mac on 16/12/27.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineAddressManageViewController.h"
#import "MineAddressManageViewModel.h"
#import "MineAddressAddViewController.h"
@interface MineAddressManageViewController ()
@property( nonatomic, strong) MineAddressManageViewModel        * viewModel;
@end

@implementation MineAddressManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewModel];
    
    [self setUpNavi];
    
}

-(void)setUpNavi{
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];

    UIBarButtonItem *addButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"yxl_nav_add"] style:UIBarButtonItemStyleDone target:self action:@selector(addAddress)];
    self.navigationItem.rightBarButtonItem = addButtonItem;
}
-(void)addAddress{
    MineAddressAddViewController *vc = [MineAddressAddViewController new];
    vc.title = @"添加地址";
    [self.navigationController pushViewController:vc animated:YES];
}

-(MineAddressManageViewModel *)viewModel{
    if (!_viewModel ) {
        _viewModel = [[MineAddressManageViewModel alloc]initWithViewController:self];
    }
    return _viewModel;
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
