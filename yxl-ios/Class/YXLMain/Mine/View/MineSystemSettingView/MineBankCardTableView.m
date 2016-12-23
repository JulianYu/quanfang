//
//  MineBankCardTableView.m
//  yxl-ios
//
//  Created by mac on 16/12/21.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "MineBankCardTableView.h"
#import "MineBankCardItemCell.h"
#define MINEBANKCARD_ITEMCELL @"bankCardItemCell"
@implementation MineBankCardTableView

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
    self.backgroundColor = [UIColor clearColor];
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    SUN_TableRegisterCell(self, @"MineBankCardItemCell", MINEBANKCARD_ITEMCELL);
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MineBankCardItemCell *cell = [tableView dequeueReusableCellWithIdentifier:MINEBANKCARD_ITEMCELL forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellEditingStyleNone;
    
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160;
}

@end
