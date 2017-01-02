//
//  MineGoldSilverTableView.m
//  yxl-ios
//
//  Created by mac on 16/12/30.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineGoldSilverTableView.h"
@interface MineGoldSilverTableView()
@property( nonatomic, strong) UILabel        * headerLabel;
@end
@implementation MineGoldSilverTableView
@dynamic tag;

-(void)buildUI{
    [super buildUI];
    self.delegate = self;
    self.dataSource = self;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"test"];
    }
    cell.textLabel.text = @"购买商品";
    [cell.textLabel SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:14 bold:NO textAlignment:NSTextAlignmentLeft];
    cell.detailTextLabel.text = @"2015-08-01 07:30";
    [cell.detailTextLabel SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:12 bold:NO textAlignment:NSTextAlignmentLeft];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 34;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 34)];
    UIView *leftLine = [[UIView alloc]initWithFrame:CGRectZero];
    UIView *rightLine = [[UIView alloc]initWithFrame:CGRectZero];
    [view SUN_AddSubViewsWithArray:@[leftLine,rightLine,self.headerLabel]];
    view.backgroundColor = SUN_GlobalWhiteColor;
    leftLine.backgroundColor = SUN_GlobalTextGreyColor;
    rightLine.backgroundColor = SUN_GlobalTextGreyColor;
    [self.headerLabel SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:14 bold:NO textAlignment:NSTextAlignmentCenter];
    [self.headerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(80);
        make.top.mas_equalTo(13);
        make.height.mas_equalTo(21);
        make.centerX.mas_equalTo(view);
    }];
    [leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view).offset(7);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(self.headerLabel.mas_left);
        make.height.mas_equalTo(.5);
    }];
    [rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view).offset(7);
        make.left.mas_equalTo(self.headerLabel.mas_right);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(.5);
    }];
    return view;


}
-(UILabel *)headerLabel{
    if (!_headerLabel) {
        _headerLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    }
    return _headerLabel;
}
-(void)setTag:(NSInteger)tag{
    if (tag) {
        self.headerLabel.text = @"金积分明细";
    }
    else{
        self.headerLabel.text = @"银积分明细";
    }
    [self reloadData];
}
@end
