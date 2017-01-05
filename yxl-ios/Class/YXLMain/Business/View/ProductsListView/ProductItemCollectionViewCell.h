//
//  ProductItemCollectionViewCell.h
//  yxl-ios
//
//  Created by mac on 16/12/19.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductItemCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *productPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;

@end
