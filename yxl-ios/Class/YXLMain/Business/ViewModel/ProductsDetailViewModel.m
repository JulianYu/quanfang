//
//  ProductsDetailViewModel.m
//  yxl-ios
//
//  Created by mac on 16/12/19.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "ProductsDetailViewModel.h"
#import "ProductsDetailTrunkView.h"
#import "ProductsDetailFooterView.h"
#import "ProductChooseView.h"
#import "BusinessProductDetailModel.h"
@interface ProductsDetailViewModel()
@property( nonatomic, strong) ProductsDetailTrunkView           * trunkView;
@property( nonatomic, strong) ProductsDetailFooterView          * footerView;
@property( nonatomic, strong) ProductChooseView                 * chooseView;
@property( nonatomic, strong) BusinessProductDetailModel        * detailModel;
@end
@implementation ProductsDetailViewModel

- (instancetype)initWithViewController:(YXLBaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        if ([viewController isKindOfClass:NSClassFromString(@"BusinessProductsDetailViewController")]) {
            [viewController.view SUN_AddSubViewsWithArray:@[self.trunkView,self.footerView,self.choosetView]];
            viewController.view.backgroundColor = [UIColor blackColor];
        }
    }
    return self;
}
#pragma mark - lazy
-(ProductChooseView *)choosetView{
    if (!_chooseView) {
        _chooseView = [[ProductChooseView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)];
        [_chooseView.cancelBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [_chooseView.checkBtn addTarget:self action:@selector(check) forControlEvents:UIControlEventTouchUpInside];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [_chooseView.alphaView addGestureRecognizer:tap];

    }
    return _chooseView;
}
-(ProductsDetailFooterView *)footerView{
    if (!_footerView) {
        _footerView = [[ProductsDetailFooterView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-49, SCREEN_WIDTH, 49)];
        _footerView.backgroundColor = [UIColor clearColor];
    }
    return _footerView;
}
-(ProductsDetailTrunkView *)trunkView{
    if (!_trunkView) {
        _trunkView = [[ProductsDetailTrunkView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-49)];
        _trunkView.backgroundColor = [UIColor clearColor];
    }
    return _trunkView;
}

#pragma mark - methods
-(void)setData:(Goods *)data{
    [self getProductDetailByProductId:data.id];
}

-(void)show{
    
    [UIView animateWithDuration: 0.35 animations: ^{
        
        self.trunkView.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.9,0.9);
        self.footerView.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.9,0.9);
        
        self.chooseView.frame =CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    } completion: nil];
    
}
/**
 *  点击半透明部分或者取消按钮，弹出视图消失
 */
-(void)dismiss
{
    
    [UIView animateWithDuration: 0.35 animations: ^{
        self.chooseView.frame =CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.trunkView.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
        self.footerView.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
    } completion: nil];
    
}
-(void)check
{
    [self dismiss];
    
    
    [HUD SUN_ShowSuccessWithStatus:@"添加成功"];
}

#pragma mark - network requests
-(void)getProductDetailByProductId:(NSString*)productId{
    NSString *url = [NSString stringWithFormat:@"%@/ApiOther/productsdetail",[ServerConfig sharedServerConfig].url];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:productId forKey:@"goods_id"];
    [NetManager requestWithType:HttpRequestTypePost UrlString:url Parameters:params SuccessBlock:^(id response) {
        STATUS *status = [STATUS mj_objectWithKeyValues:[response objectForKey:@"status"]];
        if (status.succeed == 1) {
            self.detailModel = [BusinessProductDetailModel mj_objectWithKeyValues:response];
            self.trunkView.detailModel = self.detailModel;
        }
        else{
            [YXLBaseViewModel presentFailureHUD:status];
        }
    } FailureBlock:^(NSError *error) {
    } progress:nil];

}


@end
