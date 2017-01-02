//
//  HomeVIPApplicationTableView.m
//  yxl-ios
//
//  Created by mac on 16/12/24.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "HomeVIPApplicationTableView.h"
#import "HomeVIPApplyItemCell.h"
#import "HomeVIPSelectedSexItemCell.h"
#import "HomeVIPLevelViewController.h"
#define HOMEVIPAPPLY_ITEMCELL @"applyItemCell"
#define HOMEVIPSELECTEDSEX_ITEMCELL @"sexItemCell"
@implementation HomeVIPApplicationTableView
-(HomeVIPApplyModel *)model{
    if (!_model) {
        _model = [HomeVIPApplyModel new];
    }
    return _model;
}
-(void)buildUI{
    [super buildUI];
    self.delegate = self;
    self.dataSource = self;
    SUN_TableRegisterCell(self, @"HomeVIPApplyItemCell", HOMEVIPAPPLY_ITEMCELL);
    SUN_TableRegisterCell(self, @"HomeVIPSelectedSexItemCell", HOMEVIPSELECTEDSEX_ITEMCELL);
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        HomeVIPSelectedSexItemCell *cell = [tableView dequeueReusableCellWithIdentifier:HOMEVIPSELECTEDSEX_ITEMCELL forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (indexPath.row == 2) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"test"];
        }
        cell.textLabel.text = @"资格级别";
        if (!self.rankStr) {
            cell.detailTextLabel.text = @"请选择资格级别";
            [cell.detailTextLabel SUN_SetTitleWithColor:[UIColor SUN_ColorWithHexString:@"#CACACF" alpha:1] FontSize:14 bold:NO textAlignment:NSTextAlignmentLeft];

        }else{
            cell.detailTextLabel.text = self.rankStr;
            [cell.detailTextLabel SUN_SetTitleWithColor:SUN_GlobalTextBlackColor FontSize:14 bold:NO textAlignment:NSTextAlignmentLeft];

        }
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [cell.textLabel SUN_SetTitleWithColor:[UIColor blackColor] FontSize:15 bold:NO textAlignment:NSTextAlignmentLeft];
        [cell.textLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(80);
        }];
        [cell.detailTextLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(cell.textLabel.mas_right).mas_equalTo(10);
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(100);
        }];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else{
        HomeVIPApplyItemCell *cell = [tableView dequeueReusableCellWithIdentifier:HOMEVIPAPPLY_ITEMCELL forIndexPath:indexPath];
        cell.textField.tag = indexPath.row;
        [cell.textField addTarget:self action:@selector(textFieldValueChange:) forControlEvents:UIControlEventEditingChanged];
        switch (indexPath.row) {
            case 0:
                cell.label.text = @"用户ID号";
                cell.textField.placeholder = [UserModel sharedUserModel].user.user_id;
                cell.textField.enabled = NO;
                break;
            case 3:
                cell.label.text = @"真实姓名";
                cell.textField.placeholder = @"请输入姓名";
                break;
            case 4:
                cell.label.text = @"身份证号";
                cell.textField.placeholder = @"请输入身份证";
                break;
            default:
                cell.label.text = @"联系电话";
                cell.textField.placeholder = @"请输入联系电话";

                break;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 2) {
        HomeVIPLevelViewController *vc = [HomeVIPLevelViewController new];
        vc.title = @"资格级别";
        vc.viewModel.listTableView.rankDelegate = self;
        [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];
    }
}
-(void)hasSelectedRank:(NSString *)group_name group_id:(NSString *)group_id{
    self.rankStr = group_name;
    self.model.group_id = group_id;
}
-(void)textFieldValueChange:(UITextField*)textField{
    switch (textField.tag) {
        case 3:
            self.model.true_name = textField.text;
            break;
        case 4:
            self.model.idcard = textField.text;
            break;
        default:
            self.model.mobile = textField.text;
            break;
    }
}
@end
