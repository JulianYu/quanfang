//
//  UIColor+Category.h
//  yxl-ios
//
//  Created by mac on 16/12/12.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Category)

/**  hex颜色转换 */
+ (UIColor *)SUN_ColorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
    
/** UIColor 转UIImage */
+ (UIImage *)SUN_ImageWithColor:(UIColor *)color;

/**  创建一个随机UIColor对象 */
+ (UIColor *)randomColor;


    
@end
