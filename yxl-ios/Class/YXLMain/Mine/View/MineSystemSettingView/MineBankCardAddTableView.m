//
//  MineBankCardAddTableView.m
//  yxl-ios
//
//  Created by mac on 16/12/22.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineBankCardAddTableView.h"
#import "MineCommonSettingModifyCell.h"
#import "MineBankCardToSelectViewController.h"
#define MINECOMMON_SETTINGCELL @"addBankCardCell"
@implementation MineBankCardAddTableView


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
    self.backgroundColor = [UIColor clearColor];
    SUN_TableRegisterCell(self, @"MineCommonSettingModifyCell", MINECOMMON_SETTINGCELL);
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"headerCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"headerCell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.text = @"请输入绑定卡人本人的银行卡";
        [cell.textLabel SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:10 bold:NO textAlignment:NSTextAlignmentLeft];
        return cell;
    }
    else{
        MineCommonSettingModifyCell *cell = [tableView dequeueReusableCellWithIdentifier:MINECOMMON_SETTINGCELL forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.label.textAlignment = NSTextAlignmentLeft;
        if (indexPath.row == 1) {
            cell.label.text = @"持卡人";
            cell.textField.placeholder = @"请输入持卡人";
        }
        if (indexPath.row == 2) {
            cell.label.text = @"卡号";
            cell.textField.placeholder = @"请输入卡号";
        }
        if (indexPath.row == 4) {
            cell.label.text = @"开户行名称";
            cell.textField.placeholder = @"请输入开户行的名称";
        }
        if (indexPath.row == 3) {
            cell.label.text = @"银行";
            cell.textField.placeholder = @"请选择开户银行";
            cell.textField.enabled = NO;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        return cell;
    }
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 3) {
        MineBankCardToSelectViewController *vc = [MineBankCardToSelectViewController new];
        vc.title = @"选择银行";
        [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];
    }
}
@end
