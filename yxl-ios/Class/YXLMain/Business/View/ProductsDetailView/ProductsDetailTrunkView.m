//
//  ProductsDetailTrunkView.m
//  yxl-ios
//
//  Created by mac on 16/12/19.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "ProductsDetailTrunkView.h"
#import "ProductsDetailHeaderView.h"
#import "ProductInformationFirstRowCell.h"
#import "ProductInformationSecondRowCell.h"
#import "ProductSellerFirstRowCell.h"
#import "ProductSellerSecondRowCell.h"
#import "ProductRankRowCell.h"
#import "YXLBaseTableView.h"
#import "BusinessProductsDetailViewController.h"
#define PRODUCTINFORMATION_FIRSTROWCELL @"informationFirstCell"
#define PRODUCTINFORMATION_SECONDROWCELL @"informationSecondCell"
#define PRODUCTSELLER_FIRSTROWCELL @"sellerFirstCell"
#define PRODUCTSELLER_SECONDROWCELL @"sellerSecondCell"
#define PRODUCTRANK_ROWCELL @"rankRowCell"
@interface ProductsDetailTrunkView ()
<
UITableViewDelegate,
UITableViewDataSource,
UIScrollViewDelegate
>
{
    CGPoint center;

}
@property( nonatomic, strong) ProductsDetailHeaderView          * headerView;
@property( nonatomic, strong) UITableView                       * tableView;
@end
@implementation ProductsDetailTrunkView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildUI];
    }
    return self;
}
-(void)buildUI{
    [self tableView];
    
}
-(void)setDetailModel:(BusinessProductDetailModel *)detailModel{
    _detailModel = detailModel;
    [self.tableView reloadData];
    int i = 0;
    for (UIImageView *imageView in self.headerView.imageViewArray) {
        if (i<detailModel.data.photo.count) {
            NSString *url = [NSString stringWithFormat:@"%@/%@",[ServerConfig sharedServerConfig].url,[detailModel.data.photo objectAtIndex:i].img];
            [imageView sd_setImageWithURL:[NSURL URLWithString:url]];
        }
        i++;
    }
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[YXLBaseTableView alloc]initWithFrame:CGRectZero];;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.allowsSelection = NO;
        self.headerView = [[ProductsDetailHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT*5/8)];
        _tableView.tableHeaderView = self.headerView;
        SUN_RegisterCell(@"ProductInformationFirstRowCell", PRODUCTINFORMATION_FIRSTROWCELL);
        SUN_RegisterCell(@"ProductInformationSecondRowCell", PRODUCTINFORMATION_SECONDROWCELL);
        SUN_RegisterCell(@"ProductSellerFirstRowCell", PRODUCTSELLER_FIRSTROWCELL);
        SUN_RegisterCell(@"ProductSellerSecondRowCell", PRODUCTSELLER_SECONDROWCELL);
        SUN_RegisterCell(@"ProductRankRowCell", PRODUCTRANK_ROWCELL);
        
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(-20, 0, 0, 0));
        }];
    }
    return _tableView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 2;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 1;
            break;
        case 3:
            if (!self.detailModel.data.properties.count) {
                return 2;
            }
            else{
                return self.detailModel.data.properties.count+1;
            }
            break;
        case 4:
            return 2;
            break;
        default:
            return 1;
            break;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 60;
        }
        return 34;
    }
    else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            return 50;
        }
        return 60;
    }
    else if (indexPath.section == 2){
        return 34;
    }
    
    return 44;

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            ProductInformationFirstRowCell *cell = [tableView dequeueReusableCellWithIdentifier:PRODUCTINFORMATION_FIRSTROWCELL forIndexPath:indexPath];
            cell.data = self.detailModel.data;
            return cell;
        }
        ProductInformationSecondRowCell *cell = [tableView dequeueReusableCellWithIdentifier:PRODUCTINFORMATION_SECONDROWCELL forIndexPath:indexPath];
        cell.sellNumberLabel.text = [NSString stringWithFormat:@"销量%@",self.detailModel.data.buy_num];
        cell.collectNumberLabel.text = [NSString stringWithFormat:@"收藏%@",self.detailModel.data.favorite];
        return cell;
    }
    else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            ProductSellerFirstRowCell *cell = [tableView dequeueReusableCellWithIdentifier:PRODUCTSELLER_FIRSTROWCELL forIndexPath:indexPath];
            
            NSString *url = [NSString stringWithFormat:@"%@/%@",[ServerConfig sharedServerConfig].url,self.detailModel.data.sellerinfo.head_ico];
            
            [cell.sellerImageView sd_setImageWithURL:[NSURL URLWithString:url]];
            
            cell.sellerNameLabel.text = self.detailModel.data.sellerinfo.username;
            return cell;
        }
        ProductSellerSecondRowCell *cell = [tableView dequeueReusableCellWithIdentifier:PRODUCTSELLER_SECONDROWCELL forIndexPath:indexPath];
        return cell;
        
    }
    else if (indexPath.section == 2){
        ProductRankRowCell *cell = [tableView dequeueReusableCellWithIdentifier:PRODUCTRANK_ROWCELL forIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cellTap)];
        [cell addGestureRecognizer:tap];
        return cell;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"productDetailCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"productDetailCell"];
    }
    
        if (indexPath.section == 3){
            if (indexPath.row == 0) {
                cell.textLabel.text = @"基本参数";
                
                [cell.textLabel SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:14 bold:NO textAlignment:NSTextAlignmentLeft];
                [cell.textLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(25);
                    make.centerY.mas_equalTo(cell.contentView);
                }];
                return cell;
            }
            if (!self.detailModel.data.properties.count) {
                cell.textLabel.text = @"无";
                cell.detailTextLabel.text = @"";
            }
            else{
                cell.textLabel.text = [self.detailModel.data.properties objectAtIndex:indexPath.row-1].name;
                cell.detailTextLabel.text = [self.detailModel.data.properties objectAtIndex:indexPath.row-1].attribute_value;
            }
            [cell.textLabel SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:12 bold:NO textAlignment:NSTextAlignmentLeft];
            [cell.textLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(cell.contentView);
                make.left.mas_equalTo(25);
            }];
            [cell.detailTextLabel SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:12 bold:NO textAlignment:NSTextAlignmentLeft];
            [cell.detailTextLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(cell.contentView);
                make.left.mas_equalTo(cell.textLabel.mas_right).mas_offset(5);
            }];
            return cell;

        }
        else if (indexPath.section == 4){
            if (indexPath.row == 0) {
                cell.textLabel.text = @"商品描述";
                [cell.textLabel SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:14 bold:NO textAlignment:NSTextAlignmentLeft];
                [cell.textLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(25);
                    make.centerY.mas_equalTo(cell.contentView);
                }];

            }
        }
        else{
            
        }
    
    return cell;
    
    
}
-(void)cellTap{
    [((BusinessProductsDetailViewController*)[self SUN_GetCurrentViewController]).viewModel show];
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.y <=SCREEN_WIDTH*6/10) {
        [self SUN_GetCurrentNavigationController].navigationBar.hidden = YES;
    }
    else if ( scrollView.contentOffset.y >SCREEN_WIDTH*6/10 && scrollView.contentOffset.y < SCREEN_HEIGHT*5.0/8-20 - 64 ) {
        [self SUN_GetCurrentViewController].navigationController.navigationBar.hidden = NO;
        [self SUN_GetCurrentViewController].navigationController.navigationBar.alpha = scrollView.contentOffset.y/(SCREEN_HEIGHT*5.0/8-20 -64-SCREEN_WIDTH*6/10);
    }
    else{
        [self SUN_GetCurrentNavigationController].navigationBar.hidden = NO;
    }
    
}
@end

