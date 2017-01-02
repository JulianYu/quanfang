//
//  MineModifyPasswordTableView.m
//  yxl-ios
//
//  Created by mac on 16/12/22.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineModifyPasswordTableView.h"
#import "MineCommonSettingModifyCell.h"
#define MINECOMMONSETTING_MODIFYCELL @"modifyCell"
@implementation MineModifyPasswordTableView
-(MineModifyPasswordModel *)model{
    if (!_model) {
        _model = [MineModifyPasswordModel new];
    }
    return _model;
}

-(void)buildUI{
    [super buildUI];
    self.delegate = self;
    self.dataSource = self;
    
    SUN_TableRegisterCell(self, @"MineCommonSettingModifyCell", MINECOMMONSETTING_MODIFYCELL);
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MineCommonSettingModifyCell *cell = [tableView dequeueReusableCellWithIdentifier:MINECOMMONSETTING_MODIFYCELL forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textField.secureTextEntry = YES;
    cell.textField.tag = indexPath.row;
    [cell.textField addTarget:self action:@selector(textFieldValueChanged:) forControlEvents:UIControlEventEditingChanged];
    switch (indexPath.row) {
        case 0:
            cell.label.text = @"旧密码";
            cell.textField.placeholder = @"请输入旧密码";
            break;
        case 1:
            cell.label.text = @"新密码";
            cell.textField.placeholder = @"字母数字混合至少8位";
            break;
        case 2:
            cell.label.text = @"重复密码";
            cell.textField.placeholder = @"重复输入一次新密码";
            break;
            
        default:
            break;
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(void)textFieldValueChanged:(UITextField*)textField{
    switch (textField.tag) {
        case 0:
            self.model.fpassword = textField.text;
            break;
        case 1:
            self.model.password = textField.text;
            break;
        case 2:
            self.model.repassword = textField.text;
            break;
        default:
            break;
    }
}
@end
