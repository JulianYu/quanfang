//
//  ProductChooseView.h
//  yxl-ios
//
//  Created by mac on 16/12/26.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "YXLBaseView.h"
#import "ProductBuyCountView.h"
#import "ProductTypeView.h"

@interface ProductChooseView : YXLBaseView<UITextFieldDelegate,TypeSelectDelegate>

@property( nonatomic, strong) UIView        * alphaView;
@property( nonatomic, strong) UIView        * whiteView;

@property( nonatomic, strong) UIImageView                   * imageView;

@property( nonatomic, strong) UILabel                       * priceLabel;
@property( nonatomic, strong) UILabel                       * stockLabel;
@property( nonatomic, strong) UILabel                       * detailLabel;
@property( nonatomic, strong) UILabel                       * lineLabel;

@property( nonatomic, strong) UIScrollView                  * mainScrollView;
@property( nonatomic, strong) ProductBuyCountView           * countView;
@property( nonatomic, strong) UIButton                      * checkBtn;
@property( nonatomic, strong) UIButton                      * cancelBtn;

@property( nonatomic, assign) int                           stock;



@end
