//
//  BusinessRightItemCell.m
//  yxl-ios
//
//  Created by mac on 16/12/15.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "BusinessRightItemCell.h"
#import "BusinessProductsDetailViewController.h"
@implementation BusinessRightItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.productHeaderBtn SUN_SetEnlargeEdgeWithTop:0 right:0 bottom:0 left:80];
    [self.productFooterBtn SUN_SetEnlargeEdgeWithTop:0 right:0 bottom:0 left:80];
}
-(void)setHeaderGoods:(Goods *)headerGoods{
    _headerGoods = headerGoods;
    NSString *headerUrl = [NSString stringWithFormat:@"%@/%@",[ServerConfig sharedServerConfig].url,headerGoods.img];
    self.productHeaderNameLabel.text = headerGoods.name;
    [self.productHeaderBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:headerUrl] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"yxl_placeholder_image"]];
    self.productHeaderPriceLabel.text = [NSString stringWithFormat:@"￥%@",headerGoods.sell_price];

}
-(void)setFooterGoods:(Goods *)footerGoods{
    _footerGoods = footerGoods;
    NSString *footerUrl = [NSString stringWithFormat:@"%@/%@",[ServerConfig sharedServerConfig].url,footerGoods.img];
    self.productFooterNameLabel.text = footerGoods.name;
    [self.productFooterBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:footerUrl] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"yxl_placeholder_image"]];
    self.productFooterPriceLabel.text = [NSString stringWithFormat:@"￥%@",footerGoods.sell_price];

}
- (IBAction)headerBtnClick:(id)sender {
//    NSLog(@"%@",self.headerGoods.id);
    BusinessProductsDetailViewController *vc = [BusinessProductsDetailViewController new];
    vc.data = self.headerGoods;
    [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];
    
}
- (IBAction)footerBtnClick:(id)sender {
//    NSLog(@"%@",self.footerGoods.id);
    BusinessProductsDetailViewController *vc = [BusinessProductsDetailViewController new];
    vc.data = self.footerGoods;
    [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];
}
@end
