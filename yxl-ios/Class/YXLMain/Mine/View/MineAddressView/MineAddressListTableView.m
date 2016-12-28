//
//  MineAddressListTableView.m
//  yxl-ios
//
//  Created by mac on 16/12/27.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineAddressListTableView.h"
#import "MineAddressItemCell.h"
#define MINEADDRESS_ITEMCELL @"MineAddressItemCell"
@implementation MineAddressListTableView

-(void)buildUI{
    [super buildUI];
    self.delegate = self;
    self.dataSource = self;
    SUN_TableRegisterCell(self, @"MineAddressItemCell", MINEADDRESS_ITEMCELL);
    self.allowsSelection = NO;
    self.backgroundColor = [UIColor clearColor];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MineAddressItemCell *cell = [tableView dequeueReusableCellWithIdentifier:MINEADDRESS_ITEMCELL forIndexPath:indexPath];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

@end
