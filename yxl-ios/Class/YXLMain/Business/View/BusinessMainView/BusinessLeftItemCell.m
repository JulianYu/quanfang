//
//  BusinessLeftItemCell.m
//  yxl-ios
//
//  Created by mac on 16/12/15.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "BusinessLeftItemCell.h"
#import "BusinessViewController.h"
#import "BusinessProductsListViewController.h"
@implementation BusinessLeftItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = SUN_GlobalWhiteColor;
    [self.productButton SUN_SetEnlargeEdgeWithTop:30 right:0 bottom:0 left:0];
}
-(void)setData:(ProductsData *)data{
    _data = data;
    self.productNameLabel.text = data.name;
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",[ServerConfig sharedServerConfig].url,[data.goods firstObject].img];
    [self.productButton sd_setBackgroundImageWithURL:[NSURL URLWithString:url] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"yxl_placeholder_image"]];

}
- (IBAction)btnClick:(id)sender {
    BusinessProductsListViewController *vc = [BusinessProductsListViewController new];
    vc.data = self.data;
    [[self SUN_GetCurrentNavigationController] pushViewController:vc animated:YES];
    
}

@end
