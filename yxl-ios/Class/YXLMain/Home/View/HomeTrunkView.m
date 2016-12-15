//
//  HomeTrunkView.m
//  yxl-ios
//
//  Created by mac on 16/12/13.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "HomeTrunkView.h"
#import "HomeModel.h"
#import "FunctionRowCell.h"
#import "DataStatisticsRowCell.h"
#import "HeaderRowCell.h"
#define FUNCTIONROWCELL_IDENTIFIER @"functionsCell"
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
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.tableFooterView = [UIView new];
        _tableView.allowsSelection = NO;
        [_tableView registerNib:[UINib nibWithNibName:@"FunctionRowCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:FUNCTIONROWCELL_IDENTIFIER];
        [_tableView registerNib:[UINib nibWithNibName:@"HeaderRowCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:HEADERROWCELL_IDENTIFIER];
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
    }
    return _tableView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.model.dataArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }
    else if (section == 1){
        return 3;
    }
    else{
        return 6;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        FunctionRowCell *cell = [tableView dequeueReusableCellWithIdentifier:FUNCTIONROWCELL_IDENTIFIER forIndexPath:indexPath];
        for (UIImageView *imageView in cell.imageArray) {
            HomeRowData *data = nil;
            if (indexPath.row == 0) {
                data =  self.model.dataArray[indexPath.section].first[imageView.tag];
            }
            else{
                data = self.model.dataArray[indexPath.section].second[imageView.tag];
            }
            [imageView setImage:[UIImage imageNamed:data.img]];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
        }
        
        for (UILabel *label in cell.labelArray) {
            HomeRowData *data = nil;
            if (indexPath.row == 0) {
                data =  self.model.dataArray[indexPath.section].first[label.tag];
            }
            else{
                data = self.model.dataArray[indexPath.section].second[label.tag];
            }
            label.textColor = SUN_GlobalTextGreyColor;
            label.text = data.text;

        }
        
        return cell;
    }
    else if (indexPath.row == 0) {
        HeaderRowCell *cell = [tableView dequeueReusableCellWithIdentifier:HEADERROWCELL_IDENTIFIER forIndexPath:indexPath];
        
        cell.headerIV.contentMode = UIViewContentModeScaleAspectFill;
        [cell.headerIV setImage:[UIImage imageNamed:self.model.dataArray[indexPath.section].img]];
        [cell.headerLabel SUN_SetTitleWithColor:SUN_GlobalTextBlackColor FontSize:12 bold:NO textAlignment:NSTextAlignmentLeft];
        cell.headerLabel.text = self.model.dataArray[indexPath.section].title;
        return cell;
    }
    else{
        if (indexPath.section == 1) {
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
    if (indexPath.section == 0) {
        return (SCREEN_HEIGHT-44-10)/8;
    }
    else if (indexPath.section == 1){
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
    if (section == 0) {
        return 0;
    }
    return 10;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0 ) {
        return;
    }
    else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            return;
        }
    }
    
    else{
        cell.transform = CGAffineTransformTranslate(cell.transform, 0, (SCREEN_HEIGHT-44-10)/8);
        
        cell.alpha = 0.0;
        
        [UIView animateWithDuration:0.3 animations:^{
            
            cell.transform = CGAffineTransformIdentity;
            
            cell.alpha = 1.0;
            
        } completion:^(BOOL finished) {
        }];

    }

}


@end
