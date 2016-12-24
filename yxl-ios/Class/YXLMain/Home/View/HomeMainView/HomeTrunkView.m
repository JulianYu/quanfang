//
//  HomeTrunkView.m
//  yxl-ios
//
//  Created by mac on 16/12/13.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "HomeTrunkView.h"
#import "HomeModel.h"
#import "DataStatisticsRowCell.h"
#import "HeaderRowCell.h"
#import "HomeHeaderView.h"
#import "HomeFunctionView.h"
#import "YXLBaseTableView.h"
#define DATAROWCELL_IDENTIFIER @"dataStatisticsCell"
#define NOTICEROWCELL_IDENTIFIER @"noticesCell"
#define HEADERROWCELL_IDENTIFIER @"headerCell"
#define FOOTERROOCELL_IDENTIFIER @"footerCell"
@interface HomeTrunkView ()<UITableViewDelegate,UITableViewDataSource>

@property( nonatomic, strong) UITableView        * tableView;
@property( nonatomic, strong) HomeModel          * model;
@end

@implementation HomeTrunkView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = SUN_GlobalWhiteColor;
        [self buildUI];
    }
    return self;
}
-(void)buildUI{
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"HomeList" ofType:@"plist"];
    self.model = [HomeModel mj_objectWithFile:plistPath];

    [self.tableView reloadData];
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[YXLBaseTableView alloc]initWithFrame:CGRectZero];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.allowsSelection = NO;
        SUN_RegisterCell(@"HeaderRowCell", HEADERROWCELL_IDENTIFIER);
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
    }
    return _tableView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0){
        return 3;
    }
    else{
        return 6;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        HeaderRowCell *cell = [tableView dequeueReusableCellWithIdentifier:HEADERROWCELL_IDENTIFIER forIndexPath:indexPath];
        
        cell.headerIV.contentMode = UIViewContentModeScaleAspectFill;
        [cell.headerIV setImage:[UIImage imageNamed:self.model.HeaderRowData[indexPath.section].img]];
        [cell.headerLabel SUN_SetTitleWithColor:SUN_GlobalTextBlackColor FontSize:12 bold:NO textAlignment:NSTextAlignmentLeft];
        cell.headerLabel.text = self.model.HeaderRowData[indexPath.section].title;
        return cell;
    }
    else{
        if (indexPath.section == 0) {
            if (indexPath.row == 1) {
                DataStatisticsRowCell *cell = [tableView dequeueReusableCellWithIdentifier:DATAROWCELL_IDENTIFIER];
                if (!cell) {
                    cell = [[DataStatisticsRowCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:DATAROWCELL_IDENTIFIER];
                }
                return cell;
            }
            else {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FOOTERROOCELL_IDENTIFIER];
                if (!cell) {
                    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FOOTERROOCELL_IDENTIFIER];
                }
                cell.textLabel.text = @"查看";
                [cell.textLabel SUN_SetTitleWithColor:SUN_GlobalTextSystemColor FontSize:13 bold:NO textAlignment:NSTextAlignmentCenter];
                return cell;
            }
        }
        else{
            if (indexPath.row != 5) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NOTICEROWCELL_IDENTIFIER];
                if (!cell) {
                    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NOTICEROWCELL_IDENTIFIER];
                }
                [cell.textLabel SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:12 bold:NO textAlignment:NSTextAlignmentLeft];
                cell.textLabel.text = @"全场免费消费百分百返利";
                cell.detailTextLabel.text = @"2016-10-10";
                [cell.detailTextLabel SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:10 bold:NO textAlignment:NSTextAlignmentLeft];
                return cell;
            }
            else{
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FOOTERROOCELL_IDENTIFIER];
                if (!cell) {
                    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FOOTERROOCELL_IDENTIFIER];
                }
                cell.textLabel.text = @"立即查看更多内容";
                [cell.textLabel SUN_SetTitleWithColor:SUN_GlobalTextSystemColor FontSize:13 bold:NO textAlignment:NSTextAlignmentCenter];
                return cell;

            }
        }
    }

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0){
        if (indexPath.row == 1) {
            return (SCREEN_HEIGHT-44-10)/8;
        }
        else{
            return 34;
        }
    }
    else {
        return 34;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}



@end
