//
//  LoginViewController.m
//  yxl-ios
//
//  Created by mac on 16/12/23.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "LoginViewController.h"
#import "UserViewModel.h"
@interface LoginViewController ()
@property( nonatomic, strong) UserViewModel        * viewModel;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewModel];
    [self setUpNavi];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];

    [self.navigationController.navigationBar setBackgroundImage:[UIColor SUN_ImageWithColor:SUN_GlobalWhiteColor] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:SUN_GlobalTextBlackColor}];
    
}
-(void)setUpNavi{
    
    self.navigationController.navigationBar.shadowImage = [UIColor SUN_ImageWithColor:SUN_GlobalWhiteColor];
    self.title = @"登录";
    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc]initWithTitle:@"Ｘ" style:UIBarButtonItemStyleDone target:self action:@selector(cancelBtnClick)];
    cancelBtn.tintColor = SUN_GlobalTextBlackColor;
    
    UIBarButtonItem *signUpBtn = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStyleDone target:self action:@selector(signUpBtnClick)];
    signUpBtn.tintColor = SUN_GlobalTextBlackColor;
    
    self.navigationItem.leftBarButtonItem = cancelBtn;
    self.navigationItem.rightBarButtonItem = signUpBtn;

}
-(void)cancelBtnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)signUpBtnClick{
    [self.viewModel pushToSignUpBy:self];
}

-(UserViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[UserViewModel alloc]initWithUIViewController:self];
    }
    return _viewModel;
}
- (IBAction)loginBtnClick:(UIButton *)sender {
    [self.viewModel login:self.phoneTF.text password:self.passwordTF.text viewController:self];
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
