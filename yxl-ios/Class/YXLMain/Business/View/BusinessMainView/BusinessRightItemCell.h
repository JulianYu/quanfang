//
//  BusinessRightItemCell.h
//  yxl-ios
//
//  Created by mac on 16/12/15.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BusinessRightItemCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *productHeaderNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *productHeaderPriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *productHeaderBtn;

@property (weak, nonatomic) IBOutlet UILabel *productFooterNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *productFooterPriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *productFooterBtn;


@end
