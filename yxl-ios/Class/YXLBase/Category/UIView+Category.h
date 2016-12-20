//
//  UIView+Category.h
//  yxl-ios
//
//  Created by mac on 16/12/12.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
*  Direction of flip animation
*/
typedef NS_ENUM(NSInteger, UIViewAnimationFlipDirection)
{
/**
*  Flip animation from top
*/
    UIViewAnimationFlipDirectionFromTop = 0,
/**
*  Flip animation from left
*/
    UIViewAnimationFlipDirectionFromLeft,
/**
*  Flip animation from right
*/
    UIViewAnimationFlipDirectionFromRight,
/**
*  Flip animation from bottom
*/
    UIViewAnimationFlipDirectionFromBottom
};

/**
*  Direction of the translation
*/
typedef NS_ENUM(NSInteger, UIViewAnimationTranslationDirection)
{
/**
*  Translation from left to right
*/
    UIViewAnimationTranslationDirectionFromLeftToRight = 0,
/**
*  Translation from right to left
*/
    UIViewAnimationTranslationDirectionFromRightToLeft
};

/**
*  Direction of the linear gradient
*/
typedef NS_ENUM(NSInteger, UIViewLinearGradientDirection)
{
/**
*  Linear gradient vertical
*/
    UIViewLinearGradientDirectionVertical = 0,
/**
*  Linear gradient horizontal
*/
    UIViewLinearGradientDirectionHorizontal,
/**
*  Linear gradient from left to right and top to down
*/
    UIViewLinearGradientDirectionDiagonalFromLeftToRightAndTopToDown,
/**
*  Linear gradient from left to right and down to top
*/
    UIViewLinearGradientDirectionDiagonalFromLeftToRightAndDownToTop,
/**
*  Linear gradient from right to left and top to down
*/
    UIViewLinearGradientDirectionDiagonalFromRightToLeftAndTopToDown,
/**
*  Linear gradient from right to left and down to top
*/
    UIViewLinearGradientDirectionDiagonalFromRightToLeftAndDownToTop
};



@interface UIView (Category)

@property (nonatomic          ) CGPoint        viewOrigin;
@property (nonatomic          ) CGSize         viewSize;

@property (nonatomic          ) CGFloat        x;
@property (nonatomic          ) CGFloat        y;
@property (nonatomic          ) CGFloat        width;
@property (nonatomic          ) CGFloat        height;

@property (nonatomic          ) CGFloat        top;
@property (nonatomic          ) CGFloat        bottom;
@property (nonatomic          ) CGFloat        left;
@property (nonatomic          ) CGFloat        right;

@property (nonatomic          ) CGFloat        centerX;
@property (nonatomic          ) CGFloat        centerY;

/*----------------------
* Relative coordinate *
----------------------*/

@property (nonatomic, readonly) CGFloat        middleX;
@property (nonatomic, readonly) CGFloat        middleY;
@property (nonatomic, readonly) CGPoint        middlePoint;


/**
*  1.设置颜色
*/
- (UIView *(^)(UIColor *color)) setColor;

/**
*  2.设置框架
*/
- (UIView *(^)(CGRect frame)) setFrame;

/**
*  3.设置尺寸
*/
- (UIView *(^)(CGSize size)) setSize;

/**
*  4.设置中心点
*/
- (UIView *(^)(CGPoint point)) setCenter;

/**
*  5.设置标签值
*/
- (UIView *(^)(NSInteger tag)) setTag;

/** 1.给UIView添加点击事件 */
- (void)SUN_AddTarget:(id)target
           action:(SEL)action;

/** 2.UIView的类初始化 */
+ (UIView *)SUN_ViewWithFrame:(CGRect)frame
          backgroundColor:(UIColor *)backgroundColor;

/** 3.设置边框 */
- (void)SUN_SetBordersWithColor:(UIColor *)color
            andCornerRadius:(CGFloat)radius
                   andWidth:(CGFloat)width;

/** 4.删除边框 */
- (void)SUN_RemoveBorders;

/** 5.设置阴影 */
- (void)SUN_SetRectShadowWithOffset:(CGSize)offset
                        opacity:(CGFloat)opacity
                         radius:(CGFloat)radius;

/** 6.删除阴影 */
- (void)SUN_RemoveShadow;

/** 7.设置圆角半径阴影 */
- (void)SUN_SetCornerRadiusShadowWithCornerRadius:(CGFloat)cornerRadius
           offset:(CGSize)offset
          opacity:(CGFloat)opacity
           radius:(CGFloat)radius;

/** 8.设置圆角半径 */
- (void)SUN_SetCornerRadius:(CGFloat)radius;

/** 9.摇摆动画 */
- (void)SUN_ShakeView;

/** 10.脉冲动画 */
- (void)SUN_PulseViewWithTime:(CGFloat)seconds;

/** 11.渐变色 */
- (void)SUN_CreateGradientWithColors:(NSArray *)colors direction:(UIViewLinearGradientDirection)direction;

/** 12.添加子View */
- (void)SUN_AddSubViewsWithArray:(NSArray *)array;

/** 13.获取当前View的VC */
- (UIViewController *)SUN_GetCurrentViewController;
/** 14.获取当前view的NAVI */
- (UINavigationController *)SUN_GetCurrentNavigationController;
    
@end
