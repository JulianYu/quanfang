//
//  MineTransactionPasswordViewController.h
//  yxl-ios
//
//  Created by mac on 16/12/22.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLBaseViewController.h"
#import "MineSettingViewModel.h"

@interface MineTransactionPasswordViewController : YXLBaseViewController
@property (weak, nonatomic) IBOutlet UITextField            *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField            *PINTF;
@property (weak, nonatomic) IBOutlet UITextField            *passwordTF;
@property (weak, nonatomic) IBOutlet UITextField            *rePasswordTF;

@property( nonatomic, strong) MineSettingViewModel          *viewModel;
@end
