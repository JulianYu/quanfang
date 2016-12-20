//
//  ProductsDetailFooterView.m
//  yxl-ios
//
//  Created by mac on 16/12/20.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "ProductsDetailFooterView.h"
@interface ProductsDetailFooterView()
@end
@implementation ProductsDetailFooterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildUI];
    }
    return self;
}
-(void)buildUI{
    CGFloat leftBtnWidth = SCREEN_WIDTH/7.0;
    CGFloat rightBtnWidth = SCREEN_WIDTH*2/7.0;
    
    
    for (int i = 0; i<5; i++) {
        UIButton *btn = [UIButton new];
        if (i < 3) {
            btn.frame = CGRectMake(i * leftBtnWidth, 0, leftBtnWidth, 34);
            [btn SUN_SetEnlargeEdgeWithTop:0 right:0 bottom:15 left:0];
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(i * leftBtnWidth, 34, leftBtnWidth, 15)];
            [label SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:10 bold:NO textAlignment:NSTextAlignmentCenter];
            
            switch (i) {
                case 0:
                    label.text = @"消息";
                    [btn setImage:[UIImage imageNamed:@"yxl_shop_footer_chat"] forState:UIControlStateNormal];
                    break;
                case 1:
                    label.text = @"收藏";
                    [btn setImage:[UIImage imageNamed:@"yxl_shop_footer_collection"] forState:UIControlStateNormal];
                    [btn setImage:[UIImage imageNamed:@"yxl_shop_footer_collection_s"] forState:UIControlStateSelected];
                    break;
                default:
                    label.text = @"购物车";
                    [btn setImage:[UIImage imageNamed:@"yxl_shop_footer_cart"] forState:UIControlStateNormal];

                    break;
            }
            
            [self addSubview:label];
            
            
            
        }
        else{
            btn.frame = CGRectMake(3 * leftBtnWidth + (i-3)*rightBtnWidth, 0, rightBtnWidth, 49);
            [btn.titleLabel SUN_SetTitleWithColor:SUN_GlobalWhiteColor FontSize:14 bold:NO textAlignment:NSTextAlignmentCenter];
            switch (i) {
                case 3:
                    [btn setBackgroundColor:[UIColor SUN_ColorWithHexString:@"#F9C716" alpha:1]];
                    [btn setTitle:@"加入购物车" forState:UIControlStateNormal];
                    break;
                    
                default:
                    [btn setBackgroundColor: [UIColor SUN_ColorWithHexString:@"#DC121E" alpha:1]];
                    [btn setTitle:@"立即购买" forState:UIControlStateNormal];
                    break;
            }
        }
        
        
        
        
        
        [self addSubview:btn];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
