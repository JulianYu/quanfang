//
//  BusinessLeftItemCell.h
//  yxl-ios
//
//  Created by mac on 16/12/15.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessHomeProductsModel.h"
@interface BusinessLeftItemCell : UICollectionViewCell
@property( nonatomic, strong) ProductsData        * data;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *productButton;

@end
