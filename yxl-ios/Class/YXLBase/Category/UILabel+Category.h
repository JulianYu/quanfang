//
//  UILabel+Category.h
//  yxl-ios
//
//  Created by mac on 16/12/13.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Category)
/** 1.设置颜色字体对齐方式 */

-(void)SUN_SetTitleWithColor:(UIColor*)color
                    FontSize:(CGFloat)fontSize
                        bold:(BOOL)bold
               textAlignment:(NSTextAlignment)textAlignment;
@end
