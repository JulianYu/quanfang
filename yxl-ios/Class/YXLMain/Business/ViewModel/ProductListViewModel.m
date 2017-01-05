//
//  ProductListViewModel.m
//  yxl-ios
//
//  Created by mac on 16/12/16.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "ProductListViewModel.h"
#import "ProductsListTrunkView.h"
#import "BusinessProductsListModel.h"
@interface ProductListViewModel()
@property( nonatomic, strong) ProductsListTrunkView        * trunkView;
@property( nonatomic, strong) BusinessProductsListModel        * listModel;
@end

@implementation ProductListViewModel
- (instancetype)initWithViewController:(YXLBaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        if ([viewController isKindOfClass:NSClassFromString(@"BusinessProductsListViewController")]) {
            [viewController.view addSubview:self.trunkView];
            [self setupNavi:viewController];
        }
        
        
    }
    return self;
}
#pragma mark - methods

-(void)setupNavi:(YXLBaseViewController*)viewController{
    [viewController.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    UILabel *siftoutLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 35, 30)];
    siftoutLabel.text = @"筛选";
    [siftoutLabel SUN_SetTitleWithColor:SUN_GlobalWhiteColor FontSize:14 bold:NO textAlignment:NSTextAlignmentCenter];
    [siftoutLabel SUN_SetBordersWithColor:SUN_GlobalWhiteColor andCornerRadius:5 andWidth:1];
    
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:siftoutLabel];

    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 7, SCREEN_WIDTH*2/3, 25)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"请输入搜索关键字";
    textField.backgroundColor = SUN_GlobalWhiteColor;
    viewController.navigationItem.titleView = textField;

}
-(void)setProductsData:(ProductsData *)productsData{
    [self getProductsByCategory:productsData.id WithSort:@"is_hot"];
}
#pragma mark - lazy
-(ProductsListTrunkView *)trunkView{
    if (!_trunkView) {
        _trunkView = [[ProductsListTrunkView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _trunkView;
}

#pragma mark - network requests
-(void)getProductsByCategory:(NSString*)catId WithSort:(NSString*)sort{
    NSLog(@"%@",catId);
    NSString *url = [NSString stringWithFormat:@"%@/ApiOther/getProductsByCategory",[ServerConfig sharedServerConfig].url];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:catId forKey:@"category_id"];
    [params setValue:sort forKey:@"sort_by"];
    [params setValue:@"" forKey:@"keywords"];
    [params setValue:@"1" forKey:@"page"];
    [params setValue:@"6" forKey:@"count"];
    
    [NetManager requestWithType:HttpRequestTypePost UrlString:url Parameters:params SuccessBlock:^(id response) {
        STATUS *status = [STATUS mj_objectWithKeyValues:[response objectForKey:@"status"]];
        if (status.succeed == 1) {
            self.listModel = [BusinessProductsListModel mj_objectWithKeyValues:response];
            self.trunkView.model = self.listModel;
        }
        else{
            [YXLBaseViewModel presentFailureHUD:status];
        }
    } FailureBlock:^(NSError *error) {
    } progress:nil];


}

@end
