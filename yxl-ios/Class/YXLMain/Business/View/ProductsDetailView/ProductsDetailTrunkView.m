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
#import "SUNControl.h"
#import "YXLBaseTableView.h"
#define PRODUCTINFORMATION_FIRSTROWCELL @"informationFirstCell"
#define PRODUCTINFORMATION_SECONDROWCELL @"informationSecondCell"
#define PRODUCTSELLER_FIRSTROWCELL @"sellerFirstCell"
#define PRODUCTSELLER_SECONDROWCELL @"sellerSecondCell"
#define PRODUCTRANK_ROWCELL @"rankRowCell"
@interface ProductsDetailTrunkView ()
<
UITableViewDelegate,
UITableViewDataSource,
UIScrollViewDelegate,
SUNControlDelegate
>

@property( nonatomic, strong) ProductsDetailHeaderView        * headerView;
@property( nonatomic, strong) UITableView           * tableView;
@property( nonatomic, strong) SUNControl            * sunControl;
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
            return 6;
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
            return cell;
        }
        ProductInformationSecondRowCell *cell = [tableView dequeueReusableCellWithIdentifier:PRODUCTINFORMATION_SECONDROWCELL forIndexPath:indexPath];
        return cell;
    }
    else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            ProductSellerFirstRowCell *cell = [tableView dequeueReusableCellWithIdentifier:PRODUCTSELLER_FIRSTROWCELL forIndexPath:indexPath];
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
            cell.textLabel.text = @"测试测试";
            cell.detailTextLabel.text = @"测试测试测试测试测试测试测试";
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
//    [[self SUN_GetCurrentViewController].view addSubview:self.sunControl];
//    [self.sunControl reloadData];
//    NSLog(@"我被点击了");
}
-(SUNControl *)sunControl{
    if (!_sunControl) {
        _sunControl = [[SUNControl alloc]initWithFrame:CGRectMake(0, self.height- 398 - 50, self.width, 398)];
        _sunControl.backgroundColor = [UIColor clearColor];
        _sunControl.delegate = self;
    }
    return _sunControl;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.y <10) {
        [self SUN_GetCurrentViewController].navigationController.navigationBar.hidden = YES;
    }
    
    
    if (scrollView.contentOffset.y >0){
        [self SUN_GetCurrentViewController].navigationController.navigationBar.hidden = NO;
        
        if (scrollView.contentOffset.y < SCREEN_HEIGHT*5.0/8-20 - 64 ) {
            [self SUN_GetCurrentViewController].navigationController.navigationBar.alpha = scrollView.contentOffset.y/(SCREEN_HEIGHT*5.0/8-20 -64 );
        }
        
        

        
    }
    
}
- (void) configScrollViewData:(UIScrollView *) scrollView {
    NSUInteger rowCount = 10;
    for (int i = 0; i < rowCount; i++) {
        int row = i / 4;
        int colomn = i % 4;
        UILabel *label = [[UILabel alloc] initWithFrame:
                          CGRectMake(80 * colomn + 10 * (colomn + 1), 40 * row + 10 * (row + 1), 80, 40)];
        label.text = [NSString stringWithFormat:@"sku-%d--",i];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor redColor];
        [scrollView addSubview:label];
    }
    
    scrollView.contentSize = CGSizeMake(self.width, rowCount * 50);
    
}
- (void) configImageView:(UIImageView *) imageView
                   price:(UILabel *) priceLabel
                   store:(UILabel *) storeLabel
                  choose:(UILabel *) chooseLabel
                  number:(SUNNumberChooseControl *) numberControl {
    //    imageView.image = [UIImage imageNamed:@"mail"];
    priceLabel.text = @"￥399.9";
    storeLabel.text = @"库存24044件";
    chooseLabel.text = @"请选择颜色分类";
    numberControl.maxNumber = 5;
    numberControl.minNumber = 2;
}


@end

