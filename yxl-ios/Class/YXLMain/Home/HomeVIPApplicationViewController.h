//
//  HomeVIPApplicationViewController.h
//  yxl-ios
//
//  Created by mac on 16/12/24.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLBaseViewController.h"
#import "Singleton.h"
#import "HomePromoteViewModel.h"

@interface HomeVIPApplicationViewController : YXLBaseViewController
@property( nonatomic, strong) HomePromoteViewModel        * viewModel;

@end
