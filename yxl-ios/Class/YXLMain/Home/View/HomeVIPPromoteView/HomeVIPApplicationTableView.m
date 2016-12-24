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

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildUI];
    }
    return self;
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
    return 7;
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
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [cell.textLabel SUN_SetTitleWithColor:[UIColor blackColor] FontSize:15 bold:NO textAlignment:NSTextAlignmentLeft];
        [cell.textLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(80);
        }];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else{
        HomeVIPApplyItemCell *cell = [tableView dequeueReusableCellWithIdentifier:HOMEVIPAPPLY_ITEMCELL forIndexPath:indexPath];
        switch (indexPath.row) {
            case 0:
                cell.label.text = @"用户ID号";
                cell.textField.placeholder = @"15693932898";
                break;
            case 3:
                cell.label.text = @"真实姓名";
                cell.textField.placeholder = @"请输入姓名";
                break;
            case 4:
                cell.label.text = @"身份证号";
                cell.textField.placeholder = @"请输入身份证";
                break;
            case 5:
                cell.label.text = @"联系电话";
                cell.textField.placeholder = @"请输入联系电话";
                break;
            default:
                cell.label.text = @"推荐人";
                cell.textField.placeholder = @"请输入推荐人ID号";
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
        [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];
    }
}
@end
