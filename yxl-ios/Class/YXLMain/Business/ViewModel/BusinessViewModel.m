//
//  BusinessViewModel.m
//  yxl-ios
//
//  Created by mac on 16/12/14.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "BusinessViewModel.h"
#import "BusinessTrunkView.h"

@interface BusinessViewModel ()

@property( nonatomic, strong) BusinessTrunkView         * trunkView;
@end
@implementation BusinessViewModel
- (instancetype)initWithViewController:(YXLBaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        if ([viewController isKindOfClass:NSClassFromString(@"BusinessViewController")]) {
            [viewController.view addSubview:self.trunkView];
            [self.trunkView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 49, 0));
                
            }];
            [self setupNavi:viewController];
        }
    }
    return self;
}
#pragma mark - methods
-(void)setupNavi:(YXLBaseViewController *)viewController{
    [viewController.navigationController.navigationBar setTintColor:[UIColor whiteColor]];

    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"yxl_shop_menu"] style:UIBarButtonItemStyleDone target:self action:@selector(menuClick)];
    
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"yxl_shop_location"] style:UIBarButtonItemStyleDone target:self action:@selector(locationClick)];
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 7, SCREEN_WIDTH*3/4, 30)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"搜索";
    textField.backgroundColor = SUN_GlobalWhiteColor;
    viewController.navigationItem.titleView = textField;
    
}
-(void)menuClick{
    
}
-(void)locationClick{

}
#pragma mark - lazy
-(BusinessTrunkView *)trunkView{
    if (!_trunkView) {
        _trunkView = [[BusinessTrunkView alloc]initWithFrame:CGRectZero];
    }
    return _trunkView;
}
#pragma mark - network requests
-(void)getBannerList{
    NSString *url = [NSString stringWithFormat:@"%@/ApiUser/bannerList",[ServerConfig sharedServerConfig].url];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [NetManager requestWithType:HttpRequestTypePost UrlString:url Parameters:params SuccessBlock:^(id response) {
        STATUS *status = [STATUS mj_objectWithKeyValues:[response objectForKey:@"status"]];
        if (status.succeed == 1) {
            
        }
        else{
            [YXLBaseViewModel presentFailureHUD:status];
        }
    } FailureBlock:^(NSError *error) {
    } progress:nil];

}
@end
