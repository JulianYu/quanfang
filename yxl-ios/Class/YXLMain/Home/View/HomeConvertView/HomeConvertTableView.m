//
//  HomeConvertTableView.m
//  yxl-ios
//
//  Created by mac on 16/12/24.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "HomeConvertTableView.h"
#import "MineCommonSettingModifyCell.h"
#define MINECOMMONSETTING_ITEMCELL @"commonCell"
@implementation HomeConvertTableView

-(void)buildUI{
    [super buildUI];
    self.delegate = self;
    self.dataSource = self;
    self.backgroundColor = [UIColor clearColor];
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    SUN_TableRegisterCell(self, @"MineCommonSettingModifyCell", MINECOMMONSETTING_ITEMCELL);

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row != 3) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"convertCell"];
        if (!cell) {
            if (indexPath.row == 1) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"convertCell"];
            }
            else{
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"convertCell"];
            }
        }
        switch (indexPath.row) {
            case 0:
                cell.backgroundColor = [UIColor clearColor];
                cell.textLabel.text = @"金积分";
                [cell.textLabel SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:12 bold:NO textAlignment:NSTextAlignmentLeft];
                break;
            case 1:
                cell.textLabel.text = @"当前可用";
                [cell.textLabel SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:14 bold:NO textAlignment:NSTextAlignmentLeft];
                cell.detailTextLabel.text = @"500.00";
                [cell.detailTextLabel SUN_SetTitleWithColor:SUN_GlobalTextGreenColor FontSize:14 bold:NO textAlignment:NSTextAlignmentLeft];
                break;
            case 2:
                cell.backgroundColor = [UIColor clearColor];
                break;
            default:
                cell.backgroundColor = [UIColor clearColor];
                cell.textLabel.text = @"兑换说明：金积分可以兑换现金，现金券不能兑换金积分。";
                [cell.textLabel SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:10 bold:NO textAlignment:NSTextAlignmentLeft];
                break;
        }
        
        return cell;
    }
    else{
        MineCommonSettingModifyCell *cell = [tableView dequeueReusableCellWithIdentifier:MINECOMMONSETTING_ITEMCELL forIndexPath:indexPath];
        cell.label.text = @"兑换现金";
        [cell.label SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:14 bold:NO textAlignment:NSTextAlignmentLeft];
        cell.textField.placeholder = @"请输入金积分";
        return cell;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 4) {
        return 20;
    }
    return 44;
}
@end
