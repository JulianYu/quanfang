//
//  HomeStockPointsTableView.m
//  yxl-ios
//
//  Created by mac on 17/1/2.
//  Copyright © 2017年 孙若淮. All rights reserved.
//

#import "HomeStockPointsTableView.h"
#import "MineCommonSettingModifyCell.h"
#define MINECOMMON_ROWCELL @"stockPointsCell"
@implementation HomeStockPointsTableView

-(void)buildUI{
    [super buildUI];
    self.delegate = self;
    self.dataSource = self;
    self.allowsSelection = NO;
    SUN_TableRegisterCell(self, @"MineCommonSettingModifyCell", MINECOMMON_ROWCELL);
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MineCommonSettingModifyCell *cell = [tableView dequeueReusableCellWithIdentifier:MINECOMMON_ROWCELL forIndexPath:indexPath];
    cell.label.textAlignment = NSTextAlignmentLeft;
    switch (indexPath.row) {
        case 0:
            cell.label.text = @"购买金额";
            cell.textField.placeholder = @"请输入购买金额";
            break;
        default:
            cell.label.text = @"可换取库存积分";
            cell.textField.placeholder = @"0.00";
            break;
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

@end
