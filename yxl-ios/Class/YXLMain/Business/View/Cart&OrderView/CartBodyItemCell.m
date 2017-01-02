//
//  CartBodyItemCell.m
//  yxl-ios
//
//  Created by mac on 17/1/2.
//  Copyright © 2017年 孙若淮. All rights reserved.
//

#import "CartBodyItemCell.h"

@implementation CartBodyItemCell{
    CGFloat startContentOffsetX;
    CGFloat willEndContentOffsetX;
    CGFloat endContentOffsetX;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    
    UIImageView *bodyImageView = [[UIImageView alloc]initWithFrame:CGRectMake(-10, 0, SCREEN_WIDTH, 140)];
    bodyImageView.image = [UIImage imageNamed:@"yxl_cart_body"];
    bodyImageView.contentMode = UIViewContentModeScaleToFill;
    
    UIView *editVI = [[UIView alloc]initWithFrame:CGRectMake(bodyImageView.width, 0, SCREEN_WIDTH/3, 140)];
    
    [self.scrollView addSubview:editVI];
    [self.scrollView addSubview:bodyImageView];
    
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH+1+SCREEN_WIDTH/3, 0);
    self.scrollView.delegate = self;
    self.scrollView.bounces = NO;
    
    self.priceLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.editBtn = [[UIButton alloc]initWithFrame:CGRectZero];
    self.line = [[UIView alloc]initWithFrame:CGRectZero];
    self.productImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    self.productLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.numberLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    
    [self.scrollView SUN_AddSubViewsWithArray:@[self.priceLabel,self.editBtn,self.line,self.productImageView,self.productLabel,self.numberLabel]];
    
    [self.priceLabel SUN_SetTitleWithColor:[UIColor redColor] FontSize:16 bold:NO textAlignment:NSTextAlignmentLeft];
    self.priceLabel.text = @"￥200.00";
    
    [self.editBtn setTitle:@"修改" forState:UIControlStateNormal];
    [self.editBtn setTitle:@"完成" forState:UIControlStateSelected];
    [self.editBtn setTitleColor:SUN_GlobalTextGreyColor forState:UIControlStateNormal];
    [self.editBtn setTitleColor:SUN_GlobalTextGreyColor forState:UIControlStateSelected];
    self.editBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.editBtn setBackgroundColor:SUN_GlobalBackgroundColor];
    [self.editBtn SUN_SetBordersWithColor:SUN_GlobalTextGreyColor andCornerRadius:2 andWidth:.5];
    
    self.editBtn.frame = CGRectMake(SCREEN_WIDTH-9-20-50, 10, 50, 21);

    self.priceLabel.frame = CGRectMake(20, 10, SCREEN_WIDTH-9-20-50-20-10, 21);
    
    self.line.backgroundColor = SUN_GlobalBackgroundColor;
    self.line.frame = CGRectMake(10, self.priceLabel.bottom+10, SCREEN_WIDTH-18-20, 0.5);
    
    
    self.productImageView.image = [UIColor SUN_ImageWithColor:[UIColor randomColor]];
    self.productImageView.frame = CGRectMake(30, self.line.bottom+18, 60, 60);
    
    self.productLabel.text = @"2016时尚风衣T恤搭配";
    [self.productLabel SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:14 bold:NO textAlignment:NSTextAlignmentLeft];
    self.numberLabel.text = @"数量:1";
    [self.numberLabel SUN_SetTitleWithColor:SUN_GlobalTextGreyColor FontSize:12 bold:NO textAlignment:NSTextAlignmentLeft];
    
    
    self.productLabel.frame = CGRectMake(self.productImageView.right+10, self.productImageView.top+5, SCREEN_WIDTH-18-30-60, 21);
    self.productLabel.numberOfLines = 2;
    
    self.numberLabel.frame = CGRectMake(self.productImageView.right+10, self.productLabel.bottom+5, SCREEN_WIDTH-18-30-60, 21);
    
    
    self.addBtn = [[UIButton alloc]initWithFrame:CGRectZero];
    self.subBtn = [[UIButton alloc]initWithFrame:CGRectZero];
    self.textField = [[UITextField alloc]initWithFrame:CGRectZero];
    self.deleteBtn = [[UIButton alloc]initWithFrame:CGRectZero];
    
    [editVI SUN_AddSubViewsWithArray:@[self.addBtn,self.subBtn,self.textField,self.deleteBtn]];
    
    [self.addBtn setBackgroundImage:[UIImage imageNamed:@"yxl_cart_edit_choose_addBtn"] forState:UIControlStateNormal];
    [self.subBtn setBackgroundImage:[UIImage imageNamed:@"yxl_cart_edit_choose_subBtn"] forState:UIControlStateNormal];
    
    [self.textField setBackground:[UIImage imageNamed:@"yxl_cart_edit_choose_number"]];
    self.textField.borderStyle = UITextBorderStyleNone;
    self.subBtn.frame = CGRectMake(5, 10, (editVI.width-10)/3, 30);
    self.textField.frame = CGRectMake(self.subBtn.right, 10, self.subBtn.width, 30);
    self.addBtn.frame = CGRectMake(self.textField.right, 10, self.subBtn.width, 30);
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    startContentOffsetX = scrollView.contentOffset.x;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
        willEndContentOffsetX = scrollView.contentOffset.x;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    endContentOffsetX = scrollView.contentOffset.x;
    if (endContentOffsetX < willEndContentOffsetX && willEndContentOffsetX < startContentOffsetX) {
//        self.editBtn.selected = NO;
    } else if (endContentOffsetX > willEndContentOffsetX && willEndContentOffsetX > startContentOffsetX) {
//        self.editBtn.selected = YES;

    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
