//
//  MineBalanceRechargeTableView.m
//  yxl-ios
//
//  Created by mac on 16/12/24.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineBalanceRechargeTableView.h"

@implementation MineBalanceRechargeTableView


-(void)buildUI{
    [super buildUI];
    self.delegate = self;
    self.dataSource = self;
    self.backgroundColor = [UIColor clearColor];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rechargeCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"rechargeCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [cell.textLabel SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:14 bold:NO textAlignment:NSTextAlignmentLeft];
    [cell.imageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(8);
        make.bottom.mas_equalTo(-8);
        make.left.mas_equalTo(20);
        make.width.mas_equalTo(28);
    }];
    [cell.textLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(cell.imageView.mas_right).offset(10);
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(100);
    }];
    
    switch (indexPath.row) {
        case 0:
            [cell.imageView setImage:[UIImage imageNamed:@"yxl_pay_weChatPay"]];
            cell.textLabel.text = @"微信充值";
            break;
        case 1:
            [cell.imageView setImage:[UIImage imageNamed:@"yxl_pay_aliPay"]];
            cell.textLabel.text = @"支付宝充值";
            break;
        default:
            [cell.imageView setImage:[UIImage imageNamed:@"yxl_mine_pendingPay"]];
            cell.textLabel.text = @"银行转帐";
            break;
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            
            break;
        case 1:
            
            break;
        default:
            break;
    }
}

@end
