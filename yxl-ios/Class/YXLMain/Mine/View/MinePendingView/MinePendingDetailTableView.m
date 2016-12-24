//
//  MinePendingDetailTableView.m
//  yxl-ios
//
//  Created by mac on 16/12/24.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MinePendingDetailTableView.h"
#import "MinePendingHeaderRowCell.h"
#import "MinePendingPriceRowCell.h"
#import "MinePendingFooterRowCell.h"
#import "MinePendingInformationRowCell.h"
#define MINEPENDING_HEADER_ROWCELL @"PendingHeaderRowCell"
#define MINEPENDING_INFORMATION_ROWCELL @"PendingInformationRowCell"
#define MINEPENDING_PRICE_ROWCELL @"PendingPriceRowCell"
#define MINEPENDING_FOOTER_ROWCELL @"PendingFooterRowCell"

@implementation MinePendingDetailTableView

-(void)buildUI{
    [super buildUI];
    self.delegate = self;
    self.dataSource = self;
    self.backgroundColor = [UIColor clearColor];
    
    SUN_TableRegisterCell(self, @"MinePendingHeaderRowCell", MINEPENDING_HEADER_ROWCELL);
    SUN_TableRegisterCell(self, @"MinePendingInformationRowCell", MINEPENDING_INFORMATION_ROWCELL);
    SUN_TableRegisterCell(self, @"MinePendingPriceRowCell", MINEPENDING_PRICE_ROWCELL);
    SUN_TableRegisterCell(self, @"MinePendingFooterRowCell", MINEPENDING_FOOTER_ROWCELL);

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;
        case 3:
            return 1;
            break;
        default:
            return 5;
            break;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1 || indexPath.section == 2) {
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
            UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectZero];
            

            [rightBtn setTitleColor:SUN_GlobalTextGreyColor forState:UIControlStateNormal];
            [rightBtn.titleLabel SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:10 bold:NO textAlignment:NSTextAlignmentCenter];
            rightBtn.layer.cornerRadius = 5;
            rightBtn.layer.borderColor = [UIColor SUN_ColorWithHexString:@"#E6E6E6" alpha:1].CGColor;
            rightBtn.layer.borderWidth = 1;
            rightBtn.clipsToBounds = YES;
            MinePendingFooterRowCell *cell = [tableView dequeueReusableCellWithIdentifier:MINEPENDING_FOOTER_ROWCELL forIndexPath:indexPath];
            [rightBtn setTitle:@"退款" forState:UIControlStateNormal];

            [cell.contentView addSubview:rightBtn];
            
                [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.mas_equalTo(-20);
                    make.centerY.mas_equalTo(cell.contentView);
                    make.height.mas_equalTo(28);
                    make.width.mas_equalTo(50);
                }];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        
        MinePendingInformationRowCell *cell = [tableView dequeueReusableCellWithIdentifier:MINEPENDING_INFORMATION_ROWCELL forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;

    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"test"];
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
@end
