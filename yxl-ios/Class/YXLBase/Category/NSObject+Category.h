//
//  NSObject+Category.h
//  yxl-ios
//
//  Created by mac on 16/12/28.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Category)
/** 1.设置富文本字体颜色 */
-(void)SUN_SetAttributeFontSize:(CGFloat)fontSize
                          Color:(UIColor*)color
               attributedString:(NSMutableAttributedString*)attributedString
                         string:(NSString *)string
                  rangeOfString:(NSString *)str;

/** 2.设置富文本字体行距 */
-(void)SUN_SetAttributeLineHeight:(CGFloat)lineHeight
                 attributedString:(NSMutableAttributedString*)attributedString
                           string:(NSString *)string
                    rangeOfString:(NSString *)str;


/** 3.设置富文本字体段距 */
-(void)SUN_SetAttributeParagraphSpacing:(CGFloat)paragraphSpacing
                       attributedString:(NSMutableAttributedString*)attributedString
                                 string:(NSString *)string
                          rangeOfString:(NSString *)str;

@end
