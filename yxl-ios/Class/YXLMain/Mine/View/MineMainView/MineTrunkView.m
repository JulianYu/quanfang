//
//  MineTrunkView.m
//  yxl-ios
//
//  Created by mac on 16/12/13.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineTrunkView.h"
#import "MineModel.h"
#import "MineSecondRowCell.h"
#import "MinePendingViewController.h"
#import "MineSettingViewController.h"
#import "MineBankCardListViewController.h"
#import "MineCollectionListViewController.h"
#import "MineBalanceViewController.h"
#import "YXLBaseTableView.h"
#import "HomeConvertViewController.h"
#import "MineGoldSilverViewController.h"
#define FIRSTROWCELL_IDENTIFIER @"firstCell"
#define SECONDROWCELL_IDENTIFIER @"secondCell"
@interface MineTrunkView()<UITableViewDelegate,UITableViewDataSource>
@property( nonatomic, strong) NSIndexPath        * indexPath;
@property( nonatomic, strong) UITableView        * tableView;
@property( nonatomic, strong) MineModel          * model;
@end

@implementation MineTrunkView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self buildUI];
    }
    return self;
}
-(void)buildUI{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"MineList" ofType:@"plist"];
    self.model = [MineModel mj_objectWithFile:plistPath];
    
    [self.tableView reloadData];
    
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[YXLBaseTableView alloc]initWithFrame:CGRectZero];;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.allowsSelection = NO;

        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(-10, 0, 0, 0));
        }];
        
    }
    return _tableView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.model.dataArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FIRSTROWCELL_IDENTIFIER];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:FIRSTROWCELL_IDENTIFIER];
        }
        cell.textLabel.text = self.model.dataArray[indexPath.section].title;
        cell.textLabel.font = [UIFont systemFontOfSize:12];
        cell.textLabel.textColor = SUN_GlobalTextGreyColor;
        return cell;
    }
    else{
        MineSecondRowCell *cell = [tableView dequeueReusableCellWithIdentifier:SECONDROWCELL_IDENTIFIER];
        if (!cell) {
            cell = [[MineSecondRowCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:SECONDROWCELL_IDENTIFIER];
        }
        for (UIButton * imageBtn in cell.btnArray) {
            if (imageBtn.tag%1000 == self.model.dataArray[indexPath.section].data.count) {
                break;
            }
            RowData *data = self.model.dataArray[indexPath.section].data[imageBtn.tag%1000];
            
            [imageBtn setImage:[UIImage imageNamed:data.img] forState:UIControlStateNormal];
            imageBtn.contentMode = UIViewContentModeScaleAspectFit;
            [imageBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            imageBtn.tag = (indexPath.section+1)*1000+imageBtn.tag;
        }
        for (UILabel *label in cell.labelArray) {
            if (label.tag == self.model.dataArray[indexPath.section].data.count) {
                break;
            }
            RowData *data = self.model.dataArray[indexPath.section].data[label.tag];
            label.textColor = SUN_GlobalTextGreyColor;
            label.text = data.text;
        }
        
        
        return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 34;
    }
    return (SCREEN_HEIGHT-34-10)/8;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 10;
}
-(void)btnClick:(UIButton*)sender{
    self.indexPath = [NSIndexPath indexPathForRow:sender.tag%1000 inSection:sender.tag/1000];

    
    if (!(self.indexPath.section == 4 && self.indexPath.row == 0)) {
        if (![UserViewModel online]) {
            [UserViewModel showLogin];
            return;
        }
    }
    
    if (self.indexPath.section == 1) {
        MinePendingViewController *vc = [[MinePendingViewController alloc] init];

        switch (self.indexPath.row) {
            case 0:
                vc.title = @"待付款订单";
                break;
            case 1:
                vc.title = @"待发货订单";
                break;
            case 2:
                vc.title = @"待收货订单";
                break;
            default:
                vc.title = @"全部订单";
                break;
        }
        
        [self SUN_GetCurrentNavigationController].navigationBar.hidden = NO;
        [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];

    }
    if (self.indexPath.section == 2) {
        switch (self.indexPath.row) {
            case 0:
            {
                MineBalanceViewController *vc = [[MineBalanceViewController alloc]init];
                [self SUN_GetCurrentNavigationController].navigationBar.hidden = NO;
                [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];
            }
                
                break;
            case 1:
            {
                MineGoldSilverViewController *vc = [MineGoldSilverViewController new];
                vc.delegate = 0;
                [self SUN_GetCurrentNavigationController].navigationBar.hidden = NO;
                [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];
            }
                break;
            case 2:
            {
                MineGoldSilverViewController *vc = [MineGoldSilverViewController new];
                vc.delegate = 1;
                [self SUN_GetCurrentNavigationController].navigationBar.hidden = NO;
                [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];
            }
                break;
            default:
            {
                HomeConvertViewController *vc = [HomeConvertViewController new];
                vc.title = @"币盾兑换";
                [self SUN_GetCurrentNavigationController].navigationBar.hidden = NO;
                [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];
            }
                break;
        }
    }
    if (self.indexPath.section == 3) {
        switch (self.indexPath.row) {
            case 0:
                break;
                
            default:
                break;
        }
    }
    
    if (self.indexPath.section == 4) {
        switch (self.indexPath.row) {
            case 0:
            {
                MineSettingViewController *vc = [[MineSettingViewController alloc]init];
                vc.title = @"设置";
                [self SUN_GetCurrentNavigationController].navigationBar.hidden = NO;
                [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];
        
            }
                break;
            case 1:
            {
                MineBankCardListViewController *vc = [[MineBankCardListViewController alloc]init];
                vc.title = @"银行卡";
                [self SUN_GetCurrentNavigationController].navigationBar.hidden = NO;
                [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];
                
            }
                break;
            case 2:
            {
                MineCollectionListViewController *vc = [[MineCollectionListViewController alloc]init];
                vc.title = @"我的收藏";
                [self SUN_GetCurrentNavigationController].navigationBar.hidden = NO;
                [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];

            }
                break;
            default:
                //二维码
                break;
        }
        
        
    }
    
    
    
    
}

@end
