//
//  OrderDetailTableView.m
//  yxl-ios
//
//  Created by mac on 17/1/3.
//  Copyright © 2017年 孙若淮. All rights reserved.
//

#import "OrderDetailTableView.h"
#import "OrderAddressRowCell.h"
#import "OrderPaymentRowCell.h"
#import "OrderInformationBodyCell.h"
#import "OrderDetailFooterView.h"
#import "MineAddressManageViewController.h"
#define ORDERADDRESS_ROWCELL @"orderAddressRowCell"
#define ORDERPAYMENT_ROWCELL @"orderPaymentRowCell"
#define ORDERINFORMATION_BODYCELL @"orderInformationBodyCell"

@interface OrderDetailTableView ()
@property( nonatomic, strong) OrderDetailFooterView        * footerView;
@end
@implementation OrderDetailTableView

-(void)buildUI{
    [super buildUI];
    self.delegate = self;
    self.dataSource = self;
    self.backgroundColor = [UIColor clearColor];
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableFooterView = self.footerView;
    SUN_TableRegisterCell(self, @"OrderAddressRowCell", ORDERADDRESS_ROWCELL);
    SUN_TableRegisterCell(self, @"OrderPaymentRowCell", ORDERPAYMENT_ROWCELL);
    SUN_TableRegisterCell(self, @"OrderInformationBodyCell", ORDERINFORMATION_BODYCELL);
    
}
-(OrderDetailFooterView *)footerView{
    if (!_footerView) {
        _footerView = [[OrderDetailFooterView alloc]initWithFrame:CGRectMake(-10, 0, SCREEN_WIDTH+10, 80)];
    }
    return _footerView;

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 3;
            break;
        default:
            return 4;
            break;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
            OrderAddressRowCell *cell = [tableView dequeueReusableCellWithIdentifier:ORDERADDRESS_ROWCELL forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
            break;
        case 1:
        {
            OrderPaymentRowCell *cell = [tableView dequeueReusableCellWithIdentifier:ORDERPAYMENT_ROWCELL forIndexPath:indexPath];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            return cell;
        }
            break;
        default:
        {
            if ( indexPath.row == 0 ) {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"orderCell"];
                if (!cell) {
                    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"orderCell"];
                }
                cell.textLabel.text = @"订单明细";
                [cell.textLabel SUN_SetTitleWithColor:SUN_GlobalTextBlackColor FontSize:15 bold:YES textAlignment:NSTextAlignmentLeft];
                UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(-10, 0, SCREEN_WIDTH, 44)];
                imageView.image = [UIImage imageNamed:@"yxl_order_checkout_headerCellBg"];
                cell.backgroundColor = [UIColor clearColor];
                [cell.contentView addSubview:imageView];
                [cell.contentView sendSubviewToBack:imageView];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;

                return cell;
            }
            else if ( indexPath.row == 3 ) {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"orderCell"];
                if (!cell) {
                    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"orderCell"];
                }
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(-10, 0, SCREEN_WIDTH, 44)];
                imageView.image = [UIImage imageNamed:@"yxl_cart_body"];
                cell.backgroundColor = [UIColor clearColor];
                [cell.contentView addSubview:imageView];
                [cell.contentView sendSubviewToBack:imageView];
                cell.textLabel.text = @"运输费";
                [cell.textLabel SUN_SetTitleWithColor:SUN_GlobalTextBlackColor FontSize:12 bold:NO textAlignment:NSTextAlignmentLeft];
                cell.detailTextLabel.text = @"+0.00";
                [cell.detailTextLabel SUN_SetTitleWithColor:[UIColor redColor] FontSize:12 bold:NO textAlignment:NSTextAlignmentRight];

                return cell;
            }
            else{
                OrderInformationBodyCell *cell  = [tableView dequeueReusableCellWithIdentifier:ORDERINFORMATION_BODYCELL forIndexPath:indexPath];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;

                return cell;
            }
        }
            break;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 100;
    }
    else{
        
        return 44;
    }
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-20, 10)];
    vi.backgroundColor = [UIColor clearColor];
    return vi;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat sectionHeaderHeight = 10;
    if(scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
            MineAddressManageViewController *vc = [MineAddressManageViewController new];
            vc.title = @"选择地址";
            [[self SUN_GetCurrentNavigationController]pushViewController:vc animated:YES];
        }
            break;
        case 1:
            break;
        default:
            break;
    }
}
@end
