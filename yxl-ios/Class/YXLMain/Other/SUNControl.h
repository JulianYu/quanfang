//
//  SUNControl.h
//  yxl-ios
//
//  Created by mac on 16/12/20.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SUNNumberChooseControl.h"

@protocol SUNControlDelegate;


@interface SUNControl : UIControl{
    CGSize  _contentSize;
    CGFloat _padding;
    CGFloat _fontSize;
    CGFloat _imageViewSize;

}

@property (nonatomic, strong, readonly) UIImageView *imageView;         //SKU图片
@property (nonatomic, strong, readonly) UIButton    *closeButton;       //关闭按钮
@property (nonatomic, strong, readonly) UILabel     *priceLabel;        //价格标签
@property (nonatomic, strong, readonly) UILabel     *storeLabel;        //库存标签
@property (nonatomic, strong, readonly) UILabel     *chooseLabel;       //当前选中提示
@property (nonatomic, strong, readonly) SUNNumberChooseControl *numberControl;//购买数量标签
@property (nonatomic, assign) id<SUNControlDelegate> delegate;

- (void) reloadData;

@end

@protocol SUNControlDelegate <NSObject>

@optional

/**
 *  配置滚动视图区域内的元素，在reloadData的时候会调用此方法
 *
 *  @parames
 *  @param  scrollView  滚动视图
 *  @param
 *
 */
- (void) configScrollViewData:(UIScrollView *) scrollView;

/**
 *  配置图片、价格、库存、已选择项、最大库存
 *
 *  @parames
 *  @param  imageView       图片视图
 *  @param  priceLabel      价格视图
 *  @param  storeLabel      库存视图
 *  @param  chooseLabel     已选择视图
 *  @param  numberControl   数量选择视图，配置最大值
 *  @param
 *
 */
- (void) configImageView:(UIImageView *) imageView
                   price:(UILabel *) priceLabel
                   store:(UILabel *) storeLabel
                  choose:(UILabel *) chooseLabel
                  number:(SUNNumberChooseControl *) numberControl;

/**
 *  关闭当前SKU选项，内部控件，但外部进行控制；
 *
 *  @parames
 *  @param
 *
 */
- (void) closeSUNAction;
@end
