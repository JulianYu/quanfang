//
//  MineCommonFooterView.m
//  yxl-ios
//
//  Created by mac on 16/12/22.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineCommonFooterView.h"
#import "MineBankCardAddViewController.h"
#import "MineBalanceSuccessViewController.h"
@implementation MineCommonFooterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildUI];
    }
    return self;
}
-(void)buildUI{
    self.button = [[UIButton alloc]initWithFrame:CGRectZero];
    [self addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(self);
        make.height.mas_equalTo(self);
        make.width.mas_equalTo(SCREEN_WIDTH*5/6);
    }];
    [self.button setBackgroundColor:SUN_GlobalNormalColor];
    [self.button SUN_SetCornerRadius:5];
    self.button.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.button setTintColor:SUN_GlobalWhiteColor];
}
-(void)update{
    if ([[self SUN_GetCurrentViewController] isMemberOfClass:NSClassFromString(@"MineModifyPasswordViewController")]) {
        [self.button setTitle:@"保存" forState:UIControlStateNormal];
    }
    if ([[self SUN_GetCurrentViewController] isMemberOfClass:NSClassFromString(@"MineTransactionPasswordViewController")]) {
        [self.button setTitle:@"确认" forState:UIControlStateNormal];
    }
    if ([[self SUN_GetCurrentViewController] isMemberOfClass:NSClassFromString(@"MineBankCardListViewController")]) {
        [self.button setBackgroundColor:SUN_GlobalWhiteColor];
        [self.button SUN_SetBordersWithColor:[UIColor SUN_ColorWithHexString:@"#CAE7B6" alpha:1] andCornerRadius:5 andWidth:1];
        [self.button setTitleColor:[UIColor SUN_ColorWithHexString:@"#CAE7B6" alpha:1] forState:UIControlStateNormal];
        [self.button setTitle:@"添加" forState:UIControlStateNormal];
        
        [self.button addTarget:self action:@selector(addBankCard) forControlEvents:UIControlEventTouchUpInside];
    }
    if ([[self SUN_GetCurrentViewController] isMemberOfClass:NSClassFromString(@"MineBankCardAddViewController")]) {
        [self.button setBackgroundColor:SUN_GlobalTextGreenColor];
        [self.button setTitle:@"立即绑定" forState:UIControlStateNormal];
        [self.button addTarget:self action:@selector(bindBankCard) forControlEvents:UIControlEventTouchUpInside];
        
    }
    if ([[self SUN_GetCurrentViewController] isMemberOfClass:NSClassFromString(@"HomeConvertViewController")]) {

        [self.button setBackgroundColor:SUN_GlobalTextGreenColor];
        [self.button setTitle:@"兑换" forState:UIControlStateNormal];
    }
    if ([[self SUN_GetCurrentViewController] isMemberOfClass:NSClassFromString(@"MineBalanceRechargeNumberViewController")]) {
        [self.button setBackgroundColor:SUN_GlobalTextGreenColor];
        [self.button addTarget:self action:@selector(paySuccess) forControlEvents:UIControlEventTouchUpInside];
        [self.button setTitle:@"充值" forState:UIControlStateNormal];
    }
    
    if ([[self SUN_GetCurrentViewController]isMemberOfClass:NSClassFromString(@"MineBalanceRechargeBankCardViewController")]) {
        [self.button setBackgroundColor:SUN_GlobalTextGreenColor];
        [self.button setTitle:@"生成汇款订单" forState:UIControlStateNormal];
    }
    
    if ([[self SUN_GetCurrentViewController]isMemberOfClass:NSClassFromString(@"HomeVIPApplicationViewController")]) {
        [self.button setBackgroundColor:SUN_GlobalNormalColor];
        [self.button addTarget:self action:@selector(applyVip) forControlEvents:UIControlEventTouchUpInside];
        [self.button setTitle:@"提交" forState:UIControlStateNormal]; 
    }
    
    if ([[self SUN_GetCurrentViewController] isMemberOfClass:NSClassFromString(@"MineFeedBackViewController")]) {
        [self.button setBackgroundColor:SUN_GlobalNormalColor];
        [self.button setTitle:@"提交" forState:UIControlStateNormal];
    }
    
}
-(void)applyVip{
    NSString *url = [NSString stringWithFormat:@"%@/ApiPersonal/applyLevel",[ServerConfig sharedServerConfig].url];
        Session *session = [UserModel sharedUserModel].session;
        
        NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"session":[session mj_keyValues]}];
    [params setValue:@"孙若淮" forKey:@"true_name"];
    [params setValue:@"445202199308190316" forKey:@"idcard"];
    [params setValue:@"13822260454" forKey:@"mobile"];
    [params setValue:@"7" forKey:@"group_id"];
    
    [NetManager requestWithType:HttpRequestTypePost UrlString:url Parameters:params SuccessBlock:^(id response) {
        [HUD setMinimumDismissTimeInterval:1];
        STATUS *status = [STATUS mj_objectWithKeyValues:[response objectForKey:@"status"]];
        if (status.succeed == 1) {
            [HUD SUN_ShowSuccessWithStatus:status.msg];
        }
        else{
            [YXLBaseViewModel presentFailureHUD:status];
        }
    } FailureBlock:^(NSError *error) {
    } progress:nil];

}
-(void)paySuccess{
    MineBalanceSuccessViewController *vc = [MineBalanceSuccessViewController new];
    vc.title = @"充值成功";
    [[self SUN_GetCurrentNavigationController]pushViewController:vc animated:YES];
}
-(void)addBankCard{
    MineBankCardAddViewController *vc = [MineBankCardAddViewController new];
    vc.title = @"添加银行卡";
    [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];;
}
-(void)bindBankCard{
    [[self SUN_GetCurrentNavigationController] popViewControllerAnimated:YES];
}

@end
