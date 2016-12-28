//
//  SignUpViewController.m
//  yxl-ios
//
//  Created by mac on 16/12/23.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "SignUpViewController.h"
#import "UserViewModel.h"
#import "SignUpModel.h"
@interface SignUpViewController ()
@property( nonatomic, strong) UserViewModel         * viewModel;
@property( nonatomic, strong) SignUpModel           * signUpModel;
@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewModel];
    [self setUpNavi];
    
}
-(UserViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[UserViewModel alloc]initWithUIViewController:self];
    }
    return _viewModel;
}
-(SignUpModel *)signUpModel{
    if (!_signUpModel) {
        _signUpModel = [SignUpModel new];
    }
    return _signUpModel;
}
-(void)setUpNavi{
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    [self.navigationController.navigationBar setBackgroundImage:[UIColor SUN_ImageWithColor:SUN_GlobalNormalColor] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:SUN_GlobalWhiteColor}];

}
- (IBAction)sendMobile_code:(id)sender {
    
    [self.viewModel sendRegMobileCode:self.phoneTF.text];
}
- (IBAction)signUpBtnClick:(id)sender {
    self.signUpModel.mobile = self.phoneTF.text;
    self.signUpModel.mobile_code = self.PINTF.text;
    self.signUpModel.password = self.passwordTF.text;
    self.signUpModel.username = self.usernameTF.text;
    self.signUpModel.pid = self.pidTF.text;
    self.signUpModel.province = @"440000";
    self.signUpModel.area = @"440306";
    self.signUpModel.city = @"440300";
    
    [self.viewModel signUp:self.signUpModel CompletionHandle:^(id model, id error) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
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
