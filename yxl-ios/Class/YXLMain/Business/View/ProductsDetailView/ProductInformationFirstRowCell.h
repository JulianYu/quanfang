//
//  ProductInformationFirstRowCell.h
//  yxl-ios
//
//  Created by mac on 16/12/20.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessProductDetailModel.h"
@interface ProductInformationFirstRowCell : UITableViewCell
@property( nonatomic, strong) Data        * data;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property( nonatomic, copy) NSString *sellPrice;
@property( nonatomic, copy) NSString *marketPrice;

@end
