//
//  MineSettingsTableView.m
//  yxl-ios
//
//  Created by mac on 16/12/21.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineSettingsTableView.h"
#import "MineModifyPasswordViewController.h"
#import "MineTransactionPasswordViewController.h"
#import "LoginViewController.h"
#import "YXLNavigationController.h"
#import "MineAddressManageViewController.h"
#import "MineFeedBackViewController.h"
@implementation MineSettingsTableView


-(void)buildUI{
    [super buildUI];
    self.delegate = self;
    self.dataSource = self;
    self.backgroundColor = [UIColor clearColor];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logout) name:UserStateChangeToLogoutSuccess object:nil];
    
}
-(void)logout{
    [self reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if ([UserViewModel online]) {
        return 3;
    }
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }
    if (section == 1) {
        return 3;
    }
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"settingCell"];
    if (!cell) {
        if (indexPath.section == 2) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"settingCell"];
        }
        else{
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"settingCell"];
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.textLabel SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:14 bold:NO textAlignment:NSTextAlignmentLeft];
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"修改密码";
        }
        else if (indexPath.row == 1){
            cell.textLabel.text = @"交易密码";
        }
        else{
            cell.textLabel.text = @"地址管理";
        }
    }
    
    if (indexPath.section == 1) {
        
        if (indexPath.row == 2) {
            //获取当前本地版本
            NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
            
            NSString *currentVersion = [infoDict objectForKey:@"CFBundleVersion"];
            
            cell.detailTextLabel.text = [NSString stringWithFormat:@"V%@",currentVersion];
            
            cell.textLabel.text = @"软件版本";
            [cell.detailTextLabel SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:12 bold:NO textAlignment:NSTextAlignmentLeft];
        }
        else{
            if (indexPath.row == 0) {
                cell.textLabel.text = @"建议反馈";
            }
            if (indexPath.row ==1) {
                cell.textLabel.text = @"关于我们";
            }
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    else{
        if (indexPath.section !=2) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        else{
            cell.textLabel.text = @"退出系统";
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
        }
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (![UserViewModel online]) {
            [UserViewModel showLogin];
            return;

        }
        if (indexPath.row == 0) {
                MineModifyPasswordViewController *vc = [MineModifyPasswordViewController new];
                vc.title = @"密码修改";
                [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 1) {
            if ([UserViewModel online]) {
                MineTransactionPasswordViewController *vc = [MineTransactionPasswordViewController new];
                vc.title = @"交易密码";
                [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];
            }
            else{
                [UserViewModel showLogin];
            }
        }
        else{
            if ([UserViewModel online]) {
                MineAddressManageViewController *vc = [MineAddressManageViewController new];
                vc.title = @"地址管理";
                [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];
            }
            else{
                [UserViewModel showLogin];
            }
        }
    }
    else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            if (![UserViewModel online]) {
                [UserViewModel showLogin];
                return;
                
            }
            else{
                MineFeedBackViewController *vc = [MineFeedBackViewController new];
                vc.title = @"建议反馈";
                [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];
            }
        }
        
    }
    else {
        UserViewModel *viewModel = [UserViewModel new];
        [viewModel logoutBy:[self SUN_GetCurrentViewController]];
    }
}
@end
