//
//  MineAddressAddViewController.m
//  yxl-ios
//
//  Created by mac on 16/12/27.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineAddressAddViewController.h"
#import "MineAddressManageViewModel.h"
@interface MineAddressAddViewController ()
@property( nonatomic, strong) MineAddressManageViewModel        * viewModel;
@end

@implementation MineAddressAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewModel];
    [self setUpNavi];
}
-(void)setUpNavi{
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    UIBarButtonItem *doneButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(done)];
    self.navigationItem.rightBarButtonItem = doneButtonItem;
}
-(void)done{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)showAddressPickView{
    [self.view endEditing:YES];
    
    AddressPickView *addressPickView = [AddressPickView shareInstance];
    [self.view addSubview:addressPickView];
    addressPickView.block = ^(NSString *province,NSString *city,NSString *town){
        NSLog(@"%@ %@ %@",province,city,town);
    };

}

-(MineAddressManageViewModel *)viewModel{
    if (!_viewModel) {
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
