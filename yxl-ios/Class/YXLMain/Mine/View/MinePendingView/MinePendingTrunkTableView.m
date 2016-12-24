//
//  MinePendingTrunkTableView.m
//  yxl-ios
//
//  Created by mac on 16/12/21.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MinePendingTrunkTableView.h"
#import "MinePendingHeaderRowCell.h"
#import "MinePendingInformationRowCell.h"
#import "MinePendingPriceRowCell.h"
#import "MinePendingFooterRowCell.h"
#import "MinePendingDetailViewController.h"

#define MINEPENDING_HEADER_ROWCELL @"PendingHeaderRowCell"
#define MINEPENDING_INFORMATION_ROWCELL @"PendingInformationRowCell"
#define MINEPENDING_PRICE_ROWCELL @"PendingPriceRowCell"
#define MINEPENDING_FOOTER_ROWCELL @"PendingFooterRowCell"
@implementation MinePendingTrunkTableView


-(void)buildUI{
    [super buildUI];
    self.delegate = self;
    self.dataSource = self;
    
    SUN_TableRegisterCell(self, @"MinePendingHeaderRowCell", MINEPENDING_HEADER_ROWCELL);
    SUN_TableRegisterCell(self, @"MinePendingInformationRowCell", MINEPENDING_INFORMATION_ROWCELL);
    SUN_TableRegisterCell(self, @"MinePendingPriceRowCell", MINEPENDING_PRICE_ROWCELL);
    SUN_TableRegisterCell(self, @"MinePendingFooterRowCell", MINEPENDING_FOOTER_ROWCELL);
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        MinePendingHeaderRowCell *cell = [tableView dequeueReusableCellWithIdentifier:MINEPENDING_HEADER_ROWCELL forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.row == 3) {
        MinePendingPriceRowCell *cell = [tableView dequeueReusableCellWithIdentifier:MINEPENDING_PRICE_ROWCELL forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    }
    if (indexPath.row == 4) {
        UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectZero];
        UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectZero];
        
        [leftBtn setTitleColor:SUN_GlobalTextGreyColor forState:UIControlStateNormal];
        [rightBtn setTitleColor:SUN_GlobalNormalColor forState:UIControlStateNormal];
        [leftBtn.titleLabel SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:10 bold:NO textAlignment:NSTextAlignmentCenter];
        [rightBtn.titleLabel SUN_SetTitleWithColor:SUN_GlobalNormalColor FontSize:10 bold:NO textAlignment:NSTextAlignmentCenter];
        leftBtn.layer.cornerRadius = 5;
        leftBtn.layer.borderColor = [UIColor SUN_ColorWithHexString:@"#E6E6E6" alpha:1].CGColor;
        leftBtn.layer.borderWidth = 1;
        leftBtn.clipsToBounds = YES;
        rightBtn.layer.cornerRadius = 5;
        rightBtn.layer.borderColor = [UIColor SUN_ColorWithHexString:@"#E6E6E6" alpha:1].CGColor;
        rightBtn.layer.borderWidth = 1;
        rightBtn.clipsToBounds = YES;
        MinePendingFooterRowCell *cell = [tableView dequeueReusableCellWithIdentifier:MINEPENDING_FOOTER_ROWCELL forIndexPath:indexPath];
        if ([[self SUN_GetCurrentViewController].title isEqualToString:@"待发货订单"]) {
            
        }
        else{
            if ([[self SUN_GetCurrentViewController].title isEqualToString:@"待付款订单"]) {
                [leftBtn setTitle:@"取消订单" forState:UIControlStateNormal];
                [rightBtn setTitle:@"付款" forState:UIControlStateNormal];
                [cell.contentView SUN_AddSubViewsWithArray:@[leftBtn,rightBtn]];
            }
            if ([[self SUN_GetCurrentViewController].title isEqualToString:@"待收货订单"]) {
                [leftBtn setTitle:@"查看物流" forState:UIControlStateNormal];
                [rightBtn setTitle:@"确认收货" forState:UIControlStateNormal];
                [cell.contentView SUN_AddSubViewsWithArray:@[leftBtn,rightBtn]];
                
            }
            if ([[self SUN_GetCurrentViewController].title isEqualToString:@"全部订单"]) {
                [leftBtn setTitle:@"查看物流" forState:UIControlStateNormal];
                [rightBtn setTitle:@"待评价" forState:UIControlStateNormal];
                [cell.contentView SUN_AddSubViewsWithArray:@[leftBtn,rightBtn]];
            }
            
            [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(-20);
                make.centerY.mas_equalTo(cell.contentView);
                make.height.mas_equalTo(28);
                make.width.mas_equalTo(50);
            }];
            
            [leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(rightBtn.mas_left).mas_offset(-10);
                make.centerY.mas_equalTo(cell.contentView);
                make.height.mas_equalTo(28);
                make.width.mas_equalTo(50);
            }];
            
        }
        
        

        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    }
    MinePendingInformationRowCell *cell = [tableView dequeueReusableCellWithIdentifier:MINEPENDING_INFORMATION_ROWCELL forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            return 44;
            break;
        case 3:
            return 34;
            break;
        case 4:
            return 44;
            break;
        default:
            return 54;
            break;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1 || indexPath.row == 2) {
        MinePendingDetailViewController *vc = [MinePendingDetailViewController new];
        vc.title  = @"订单详情";
        [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];
    }
}



@end
