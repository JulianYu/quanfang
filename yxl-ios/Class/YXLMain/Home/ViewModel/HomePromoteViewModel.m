//
//  HomePromoteViewModel.m
//  yxl-ios
//
//  Created by mac on 16/12/24.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "HomePromoteViewModel.h"
#import "HomeVIPRankListModel.h"
#import "HomeVIPRankLisTableView.h"
#import "MineCommonFooterView.h"
@interface HomePromoteViewModel ()
@property( nonatomic, strong) HomeVIPRankListModel                  * rankModel;
@property( nonatomic, strong) HomeVIPRankLisTableView               * listTableView;
@property( nonatomic, strong) MineCommonFooterView                  * footerView;
@end


@implementation HomePromoteViewModel

- (instancetype)initWithViewController:(YXLBaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        if ([viewController isMemberOfClass:NSClassFromString(@"HomeVIPApplicationViewController")]) {
            viewController.view.backgroundColor = SUN_GlobalWhiteColor;
            [viewController.view addSubview:self.applicationTableView];
            self.footerView.y = self.applicationTableView.bottom+20;
            [viewController.view addSubview:self.footerView];
            
            [self.footerView update];
        }
        if ([viewController isMemberOfClass:NSClassFromString(@"HomeVIPLevelViewController")]) {
            [viewController.view addSubview:self.listTableView];
            [self getVIPRankListCompletionHandle:^(id model, id error) {
                self.listTableView.model = model;
            }];
        }
    }
    return self;
}

-(HomeVIPApplicationTableView *)applicationTableView{
    if (!_applicationTableView) {
        _applicationTableView = [[HomeVIPApplicationTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44*7)];
    }
    return _applicationTableView;
}
-(HomeVIPRankLisTableView *)listTableView{
    if (!_listTableView) {
        _listTableView = [[HomeVIPRankLisTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _listTableView;
}
-(MineCommonFooterView *)footerView{
    if (!_footerView) {
        _footerView = [[MineCommonFooterView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    }
    return _footerView;
}
-(void)reloadData{
    [self.applicationTableView reloadData];
}

-(void)getVIPRankListCompletionHandle:(void (^)(id model , id error))completionHandle{
    NSString *url = [NSString stringWithFormat:@"%@/ApiOther/RankList",[ServerConfig sharedServerConfig].url];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [NetManager requestWithType:HttpRequestTypePost UrlString:url Parameters:params SuccessBlock:^(id response) {
        [HUD setMinimumDismissTimeInterval:1];
        STATUS *status = [STATUS mj_objectWithKeyValues:[response objectForKey:@"status"]];
        if (status.succeed == 1) {
            self.rankModel = [HomeVIPRankListModel mj_objectWithKeyValues:response];
            completionHandle(self.rankModel,status.msg);
        }
        else{
            [YXLBaseViewModel presentFailureHUD:status];
        }
    } FailureBlock:^(NSError *error) {
    } progress:nil];
    
}
@end
