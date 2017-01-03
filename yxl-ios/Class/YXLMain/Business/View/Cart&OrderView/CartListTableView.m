//
//  CartListTableView.m
//  yxl-ios
//
//  Created by mac on 16/12/26.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "CartListTableView.h"
#import "CartBodyItemCell.h"
#import "CartListFooterView.h"
#define CARTBODY_ITEMCELL @"CartBodyItemCell"
@interface CartListTableView ()
@property( nonatomic, strong) CartListFooterView        * footerView;
@property( nonatomic, strong) NSArray *indesPaths;
@property( nonatomic, assign) int DatNum;
@property( nonatomic, strong) NSTimer * timer;

@end
@implementation CartListTableView
-(void)buildUI{
    [super buildUI];
    self.delegate = self;
    self.dataSource = self;
    self.backgroundColor = [UIColor clearColor];
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.allowsSelection = NO;
    
    self.tableFooterView = self.footerView;
    
    self.DatNum = -1;
    
}
-(void)setModel:(NSString *)model{
    self.timer =  [NSTimer scheduledTimerWithTimeInterval:.25 target:self selector:@selector(charusell) userInfo:nil repeats:YES];

}
-(void)charusell{
    if (self.DatNum < 2) {
        [self beginUpdates];
        self.indesPaths = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:++self.DatNum inSection:0]];
        [self insertRowsAtIndexPaths:self.indesPaths withRowAnimation:UITableViewRowAnimationFade];
        [self endUpdates];
    }else{
        [self.timer invalidate];
        self.timer = nil;
    }
}



-(CartListFooterView *)footerView{
    if (!_footerView) {
        _footerView = [[CartListFooterView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
    }
    return _footerView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.DatNum+1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CartBodyItemCell *cell = [tableView dequeueReusableCellWithIdentifier:CARTBODY_ITEMCELL];
    if (!cell) {
        cell = [[CartBodyItemCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CARTBODY_ITEMCELL];
    }
    cell.tag = indexPath.row;
    cell.priceLabel.text = [NSString stringWithFormat:@"￥%ld",cell.tag*100];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
    imageView.image = [UIImage imageNamed:@"yxl_cart_header"];
    return imageView;
}

@end
