//
//  MineAddressAddTableView.m
//  yxl-ios
//
//  Created by mac on 16/12/27.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineAddressAddTableView.h"
#import "MineAddressAddItemCell.h"
#import "MineAddressAddViewController.h"
#define MINEADDRESSADD_ITEMCELL @"MineAddressAddItemCell"
@implementation MineAddressAddTableView

-(void)buildUI{
    [super buildUI];
    self.delegate = self;
    self.dataSource = self;
    SUN_TableRegisterCell(self, @"MineAddressAddItemCell", MINEADDRESSADD_ITEMCELL);
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MineAddressAddItemCell *cell = [tableView dequeueReusableCellWithIdentifier:MINEADDRESSADD_ITEMCELL forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    switch (indexPath.row) {
        case 0:
            cell.textField.placeholder = @"收货人姓名(必填)";
            break;
        case 1:
            cell.textField.placeholder = @"手机号码(必填)";
            break;
        case 2:
            cell.textField.placeholder = @"Email(必填)";
            break;
        case 3:
            cell.textField.placeholder = @"邮政编码";
            break;
        case 4:
            cell.textField.placeholder = @"所在地区";
            cell.textField.enabled = NO;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        default:
            cell.textField.placeholder = @"详细地址(必填)";
            break;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 4) {
        [((MineAddressAddViewController*)[self SUN_GetCurrentViewController]) showAddressPickView];
    }
}

@end
