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
#import "HomeNoticeListModel.h"
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
        if ([viewController isKindOfClass:NSClassFromString(@"HomeViewController")]) {

            viewController.navigationController.navigationBar.hidden = YES;
            [viewController.view SUN_AddSubViewsWithArray:@[self.headerView,self.functionView,self.trunkView]];
            [self.trunkView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(UIEdgeInsetsMake(self.functionView.bottom, 0, 49, 0));
            }];
            [self getNoticeList];
        }
    }
    return self;
}
#pragma mark - lazy
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
#pragma mark - network requests
-(void)getNoticeList{
    NSString *url = [NSString stringWithFormat:@"%@/ApiOther/noticeList",[ServerConfig sharedServerConfig].url];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [NetManager requestWithType:HttpRequestTypePost UrlString:url Parameters:params SuccessBlock:^(id response) {
        STATUS *status = [STATUS mj_objectWithKeyValues:[response objectForKey:@"status"]];
        if (status.succeed == 1) {
            self.trunkView.noticeListModel = [HomeNoticeListModel mj_objectWithKeyValues:response];
        }
        else{
            [YXLBaseViewModel presentFailureHUD:status];
        }
    } FailureBlock:^(NSError *error) {
    } progress:nil];


}
@end
