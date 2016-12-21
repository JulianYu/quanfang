//
//  HomeViewModel.m
//  yxl-ios
//
//  Created by mac on 16/12/13.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "HomeViewModel.h"
#import "HomeHeaderView.h"
#import "HomeTrunkView.h"
#import "HomeFunctionView.h"
#import "HomeViewController.h"
@interface HomeViewModel()
@property( nonatomic, strong) HomeHeaderView            * headerView;
@property( nonatomic, strong) HomeFunctionView          * functionView;
@property( nonatomic, strong) HomeTrunkView             * trunkView;
@end
@implementation HomeViewModel
- (instancetype)initWithViewController:(YXLBaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        if ([viewController isKindOfClass:[HomeViewController class]]) {

            viewController.navigationController.navigationBar.hidden = YES;
            [viewController.view SUN_AddSubViewsWithArray:@[self.headerView,self.functionView,self.trunkView]];
            [self.trunkView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(UIEdgeInsetsMake(self.functionView.bottom, 0, 49, 0));
            }];
            
//            [self test];
            

            
        }
    }
    return self;
}
-(void)test{
    NSString *url = @"http://192.168.1.230/quanfan/apimy/test";
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@4 forKey:@"id"];
    [NetManager requestWithType:HttpRequestTypePost UrlString:url Parameters:params SuccessBlock:^(id response) {
        NSLog(@"%@",response);
    } FailureBlock:^(NSError *error) {
        
    } progress:nil];

}
-(HomeFunctionView *)functionView{
    if (!_functionView) {
        
        _functionView = [[HomeFunctionView alloc]initWithFrame:CGRectMake(0, self.headerView.bottom, SCREEN_WIDTH, SCREEN_HEIGHT/5)];
    }
    return _functionView;
}
-(HomeHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[HomeHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/4)];
    }
    return _headerView;
}
-(HomeTrunkView *)trunkView{
    if (!_trunkView) {
        _trunkView = [HomeTrunkView new];
    }
    return _trunkView;
}
@end
