//
//  CartBodyItemCell.h
//  yxl-ios
//
//  Created by mac on 17/1/2.
//  Copyright © 2017年 孙若淮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CartBodyItemCell : UITableViewCell<UIScrollViewDelegate,UITextFieldDelegate>
@property( nonatomic, strong) UIScrollView       *scrollView;
@property( nonatomic, strong) UILabel                   * priceLabel;
@property( nonatomic, strong) UIButton                  * editBtn;
@property( nonatomic, strong) UIView                    * line;
@property( nonatomic, strong) UIImageView               * productImageView;
@property( nonatomic, strong) UILabel                   * productLabel;
@property( nonatomic, strong) UILabel                   * numberLabel;

@property( nonatomic, strong) UIButton                  * addBtn;
@property( nonatomic, strong) UITextField               * textField;
@property( nonatomic, strong) UIButton                  * subBtn;
@property( nonatomic, strong) UIButton                  * deleteBtn;

@end
