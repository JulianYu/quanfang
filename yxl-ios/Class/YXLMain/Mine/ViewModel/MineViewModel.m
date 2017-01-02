//
//  MineViewModel.m
//  yxl-ios
//
//  Created by mac on 16/12/13.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineViewModel.h"
#import "MineHeaderView.h"
#import "MineTrunkView.h"
#import "MineModel.h"
#import "MineInfromationTableView.h"
#import "MineDetailViewController.h"
#import "MineModifyNicknameView.h"
@interface MineViewModel()
@property( nonatomic, strong) MineHeaderView                * headerView;
@property( nonatomic, strong) MineTrunkView                 * trunkView;
@property( nonatomic, strong) MineModel                     * model;
@property( nonatomic, strong) MineModifyNicknameView        * nicknameView;

@property( nonatomic, strong) MineInfromationTableView      * informationTableView;
@end
@implementation MineViewModel
- (instancetype)initWithViewController:(YXLBaseViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        if ([viewController isMemberOfClass:NSClassFromString(@"MineViewController")]) {
            viewController.navigationController.navigationBar.hidden = YES;
            [viewController.view addSubview:self.headerView];
            [viewController.view addSubview:self.trunkView];
            [self.trunkView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(UIEdgeInsetsMake(self.headerView.height, 0, 49, 0));
            }];

        }
        if ([viewController isMemberOfClass:NSClassFromString(@"MineDetailViewController")]) {
            [viewController.view addSubview:self.informationTableView];
        }
        if ([viewController isMemberOfClass:NSClassFromString(@"MineModifyNickNameViewController")]) {
            [viewController.view addSubview:self.nicknameView];
            
        }
        if ([viewController isMemberOfClass:NSClassFromString(@"MineModifySexViewController")]) {
            
        }
        
    }
    return self;
}
#pragma mark - lazy
-(MineHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[MineHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 130)];
        
    }
    return _headerView;
}
-(MineTrunkView *)trunkView{
    if (!_trunkView) {
        _trunkView = [[MineTrunkView alloc]initWithFrame:CGRectZero];
    }
    return _trunkView;
}
-(MineInfromationTableView *)informationTableView{
    if (!_informationTableView) {
        _informationTableView = [[MineInfromationTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _informationTableView;
}
-(MineModifyNicknameView *)nicknameView{
    if (!_nicknameView) {
        _nicknameView = [[MineModifyNicknameView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _nicknameView;
}

#pragma mark - network requests
-(void)uploadAvatarImage:(NSArray *)imagesArray{
    NSString *url = [NSString stringWithFormat:@"%@/ApiPersonal/getImg",[ServerConfig sharedServerConfig].url];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [NetManager uploadImageWithUrlString:url parameters:params ImageArray:imagesArray FileName:@"QuanFangTest.png" SuccessBlock:^(id response) {
        
        STATUS *status = [STATUS mj_objectWithKeyValues:[response objectForKey:@"status"]];
        if (status.succeed == 1) {
            [self modifyUserInformationByHead_ico:[[response objectForKey:@"data"] objectForKey:@"data"] nickname:nil sex:nil CompletionHandle:^(id model, id error) {
                
            }];

        }
        else{
            [YXLBaseViewModel presentFailureHUD:status];
        }
        
    } FailurBlock:^(NSError *error) {
        [UserViewModel presentFailureHUD:nil];
    } UpLoadProgress:^(int64_t bytesProgress, int64_t totalBytesProgress) {
        [HUD SUN_ShowProgress:totalBytesProgress/bytesProgress status:@"修改中"];
    }];
    
}
-(void)modifyUserInformationByHead_ico:(NSString*)head_ico nickname:(NSString*)nickname sex:(NSString*)sex CompletionHandle:(void (^)(id, id))completionHandle{
    NSString *url = [NSString stringWithFormat:@"%@/ApiPersonal/personalInformation",[ServerConfig sharedServerConfig].url];
    Session *session = [UserModel sharedUserModel].session;
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"session":[session mj_keyValues]}];
    if (head_ico) {
        [params setValue:head_ico forKey:@"head_ico"];
    }
    if (nickname) {
        [params setValue:nickname forKey:@"nickname"];
    }
    if (sex) {
        //1 男  2女
        [params setValue:sex forKey:@"sex"];
    }
    [NetManager requestWithType:HttpRequestTypePost UrlString:url Parameters:params SuccessBlock:^(id response) {
        STATUS *status = [STATUS mj_objectWithKeyValues:[response objectForKey:@"status"]];
        if (status.succeed == 1) {
            [HUD SUN_ShowSuccessWithStatus:status.msg];
            if (head_ico) {
                [UserModel sharedUserModel].user.head_ico = head_ico;
                [[NSNotificationCenter defaultCenter]postNotificationName:UserInformationDidChangeSuccessByHeadIcon object:self];
            }
            if (nickname) {
                [UserModel sharedUserModel].user.nickname = nickname;
                [[NSNotificationCenter defaultCenter]postNotificationName:UserInformationDidChangeSuccessByNickname object:self];
                completionHandle(response,status.msg);
            }
            if (sex) {
                [UserModel sharedUserModel].user.sex = sex;
                completionHandle(response,status.msg);
            }
            
            NSUserDefaults *userDef = SUN_DEFAULTS;
            [userDef setObject:[[UserModel sharedUserModel].user mj_keyValues] forKey:@"user"];
            [userDef synchronize];

        }
        else{
            [YXLBaseViewModel presentFailureHUD:status];
        }
    } FailureBlock:^(NSError *error) {
    } progress:nil];

    
}

#pragma mark -method

-(void)pushToPersonalViewControllerBY:(UIViewController *)viewController{
    if ([UserViewModel online]) {
        MineDetailViewController *vc = [MineDetailViewController new];
        vc.title = @"资料信息";
        [viewController.navigationController pushViewController:vc animated:YES];
    }
    else{
        [UserViewModel showLogin];
    }

}
@end
