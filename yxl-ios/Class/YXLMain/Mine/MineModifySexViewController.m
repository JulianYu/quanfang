//
//  MineModifySexViewController.m
//  yxl-ios
//
//  Created by mac on 16/12/30.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineModifySexViewController.h"

@interface MineModifySexViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *womanImageView;
@property (weak, nonatomic) IBOutlet UIImageView *manImageView;

@end

@implementation MineModifySexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    if ([[UserModel sharedUserModel].user.sex isEqualToString:@"1"]) {
        self.manImageView.image = [UIImage imageNamed:@"yxl_login_selected"];
        self.womanImageView.image = [UIImage imageNamed:@"yxl_login_unselect"];
    }
    else if ([[UserModel sharedUserModel].user.sex isEqualToString:@"2"]){
        self.manImageView.image = [UIImage imageNamed:@"yxl_login_unselect"];
        self.womanImageView.image = [UIImage imageNamed:@"yxl_login_selected"];
    }
    else{
        self.manImageView.image = [UIImage imageNamed:@"yxl_login_unselect"];
        self.womanImageView.image = [UIImage imageNamed:@"yxl_login_unselect"];
    }

    [self viewModel];
}
-(MineViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[MineViewModel alloc]initWithViewController:self];
    }
    return _viewModel;
}
- (IBAction)manBtnClick:(id)sender {
    
    [self.viewModel modifyUserInformationByHead_ico:nil nickname:nil sex:@"1" CompletionHandle:^(id model, id error) {
        self.manImageView.image = [UIImage imageNamed:@"yxl_login_selected"];
        self.womanImageView.image = [UIImage imageNamed:@"yxl_login_unselect"];
        
    }];
}
- (IBAction)womanBtnClick:(id)sender {
    [self.viewModel modifyUserInformationByHead_ico:nil nickname:nil sex:@"2" CompletionHandle:^(id model, id error) {
        self.manImageView.image = [UIImage imageNamed:@"yxl_login_unselect"];
        self.womanImageView.image = [UIImage imageNamed:@"yxl_login_selected"];

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
