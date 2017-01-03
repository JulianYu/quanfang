//
//  BusinessViewModel.m
//  yxl-ios
//
//  Created by mac on 16/12/14.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "BusinessViewModel.h"
#import "BusinessTrunkView.h"
#import "BusinessBannerModel.h"
#import "BusinessHomeProductsModel.h"
@interface BusinessViewModel ()

@property( nonatomic, strong) BusinessTrunkView         * trunkView;
@property( nonatomic, strong) BusinessBannerModel        * bannerModel;
@property( nonatomic, strong) BusinessHomeProductsModel        * homeproductsModel;
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
            [self setUpProductsData];
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

-(void)setUpBannerDataBy:(BusinessBannerCell *)cell{
    
    [self getBannerListCompletionHandle:^(id model, id error) {
        [cell updateDataBy:model];
    }];
}
-(void)setUpProductsData{
    [self getChildCategoryByParentidCompletionHandle:^(id model, id error) {
        self.trunkView.model = model;
        [self.trunkView.collectionView reloadData];
    }];
}


#pragma mark - lazy
-(BusinessTrunkView *)trunkView{
    if (!_trunkView) {
        _trunkView = [[BusinessTrunkView alloc]initWithFrame:CGRectZero];
    }
    return _trunkView;
}
#pragma mark - network requests

-(void)getChildCategoryByParentidCompletionHandle:(void (^)(id model , id error))completionHandle{
    NSString *url = [NSString stringWithFormat:@"%@/ApiOther/getChildCategoryByParentid",[ServerConfig sharedServerConfig].url];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [NetManager requestWithType:HttpRequestTypePost UrlString:url Parameters:params SuccessBlock:^(id response) {
        STATUS *status = [STATUS mj_objectWithKeyValues:[response objectForKey:@"status"]];
        if (status.succeed == 1) {
            self.homeproductsModel = [BusinessHomeProductsModel mj_objectWithKeyValues:response];
            completionHandle(self.homeproductsModel,nil);
        }
        else{
            [YXLBaseViewModel presentFailureHUD:status];
        }
    } FailureBlock:^(NSError *error) {
    } progress:nil];

}

-(void)getBannerListCompletionHandle:(void (^)(id model , id error))completionHandle{
    NSString *url = [NSString stringWithFormat:@"%@/ApiUser/bannerList",[ServerConfig sharedServerConfig].url];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [NetManager requestWithType:HttpRequestTypePost UrlString:url Parameters:params SuccessBlock:^(id response) {
        STATUS *status = [STATUS mj_objectWithKeyValues:[response objectForKey:@"status"]];
        if (status.succeed == 1) {
            self.bannerModel = [BusinessBannerModel mj_objectWithKeyValues:response];
            completionHandle(self.bannerModel,status.msg);
        }
        else{
            [YXLBaseViewModel presentFailureHUD:status];
        }
    } FailureBlock:^(NSError *error) {
    } progress:nil];

}

@end
