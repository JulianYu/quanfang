//
//  MineFeedBackTableView.m
//  yxl-ios
//
//  Created by mac on 16/12/29.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineFeedBackTableView.h"
#import "MineFeedBackCell.h"
#define MINEFEEDBACK_CELL @"feedbackCell"
@implementation MineFeedBackTableView

-(void)buildUI{
    [super buildUI];
    self.delegate = self;
    self.dataSource = self;
    SUN_TableRegisterCell(self, @"MineFeedBackCell", MINEFEEDBACK_CELL);
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MineFeedBackCell *cell = [tableView dequeueReusableCellWithIdentifier:MINEFEEDBACK_CELL forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}


@end
