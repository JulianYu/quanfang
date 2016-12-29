//
//  HomeVIPRankLisTableView.m
//  yxl-ios
//
//  Created by mac on 16/12/29.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "HomeVIPRankLisTableView.h"
#import "HomeVIPApplicationViewController.h"
@interface HomeVIPRankLisTableView ()
@property( nonatomic, strong) NSArray<VIPRankList*>        * rankArr;
@end
@implementation HomeVIPRankLisTableView

-(void)buildUI{
    [super buildUI];
    self.delegate = self;
    self.dataSource = self;
}
-(void)setModel:(HomeVIPRankListModel *)model{
    self.rankArr = [NSArray arrayWithArray:model.data];
    [self reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.rankArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rankCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"rankCell"];
    }
    [cell.textLabel SUN_SetTitleWithColor:SUN_GlobalTextBlackColor FontSize:14 bold:NO textAlignment:NSTextAlignmentLeft];
    cell.textLabel.text = [self.rankArr objectAtIndex:indexPath.row].group_name;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
//    HomeVIPApplicationViewController *vc = [HomeVIPApplicationViewController sharedHomeVIPApplicationViewController];
//    vc.viewModel.applicationTableView.rankStr = [self.rankArr objectAtIndex:indexPath.row].group_name;
}
@end
