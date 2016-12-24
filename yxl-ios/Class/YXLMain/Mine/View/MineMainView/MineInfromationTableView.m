//
//  MineInfromationTableView.m
//  yxl-ios
//
//  Created by mac on 16/12/22.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineInfromationTableView.h"
#import "MineModifyNickNameViewController.h"
#import "MineModifySexViewController.h"
@implementation MineInfromationTableView


-(void)buildUI{
    [super buildUI];
    self.delegate = self;
    self.dataSource = self;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    else{
        return 2;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 60;
    }
    else{
        return 44;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"personalCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"personalCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.textLabel SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:14 bold:NO textAlignment:NSTextAlignmentLeft];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.section == 0) {
        cell.textLabel.text = @"头像";
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"昵称";
        }
        else{
            cell.textLabel.text = @"性别";
        }
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        
    }
    else{
        if (indexPath.row == 0) {
            MineModifyNickNameViewController *vc = [MineModifyNickNameViewController new];
            vc.title = @"昵称";
            [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];
        }
        else{
            MineModifySexViewController *vc = [MineModifySexViewController new];
            vc.title = @"性别";
            [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];
        }
    }
}
@end
