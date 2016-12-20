//
//  ProductListViewModel.m
//  yxl-ios
//
//  Created by mac on 16/12/16.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "ProductListViewModel.h"
#import "BusinessProductsListViewController.h"
#import "ProductsListTrunkView.h"

@interface ProductListViewModel()
@property( nonatomic, strong) ProductsListTrunkView        * trunkView;
@end

@implementation ProductListViewModel
- (instancetype)initWithViewController:(YXLBaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        if ([viewController isKindOfClass:[BusinessProductsListViewController class]]) {
            [viewController.view addSubview:self.trunkView];
            [self setupNavi:viewController];
        }
        
        
    }
    return self;
}
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
-(ProductsListTrunkView *)trunkView{
    if (!_trunkView) {
        _trunkView = [[ProductsListTrunkView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _trunkView;
}


@end
