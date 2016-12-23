//
//  MineBalanceTableView.m
//  yxl-ios
//
//  Created by mac on 16/12/23.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineBalanceTableView.h"
#import "MineBalanceWithdrawViewController.h"
#import "MineBalanceRechargeViewController.h"
@implementation MineBalanceTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildUI];
    }
    return self;
}
-(void)buildUI{
    [super buildUI];
    self.delegate = self;
    self.dataSource = self;
    self.scrollEnabled = NO;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"balanceCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"balanceCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [cell.textLabel SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:16 bold:NO textAlignment:NSTextAlignmentLeft];
    [cell.imageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(8);
        make.bottom.mas_equalTo(-8);
        make.left.mas_equalTo(20);
        make.width.mas_equalTo(28);
    }];

    
    switch (indexPath.row) {
        case 0:
            [cell.imageView setImage:[UIImage imageNamed:@"yxl_mine_silver"]];
            cell.textLabel.text = @"充值";
            break;
            
        default:

            [cell.imageView setImage:[UIImage imageNamed:@"yxl_mine_pendingPay"]];
            cell.textLabel.text = @"提现";
            break;
    }
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            MineBalanceRechargeViewController *vc = [MineBalanceRechargeViewController new];
            vc.title = @"充值";
            [self SUN_GetCurrentNavigationController].navigationBar.hidden = NO;
            [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];
        }
            break;
        default:
        {
            MineBalanceWithdrawViewController *vc = [MineBalanceWithdrawViewController new];
            vc.title = @"提现";
            [self SUN_GetCurrentNavigationController].navigationBar.hidden = NO;
            [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];
        }
            break;
    }
}
@end
