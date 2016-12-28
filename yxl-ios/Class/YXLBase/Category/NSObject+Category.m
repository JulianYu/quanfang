//
//  NSObject+Category.m
//  yxl-ios
//
//  Created by mac on 16/12/28.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "NSObject+Category.h"

@implementation NSObject (Category)
-(void)SUN_SetAttributeFontSize:(CGFloat)fontSize
                          Color:(UIColor*)color
               attributedString:(NSMutableAttributedString*)attributedString
                         string:(NSString *)string
                  rangeOfString:(NSString *)str{
    
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:[string rangeOfString:str]];
    [attributedString addAttribute:NSForegroundColorAttributeName value:color range:[string rangeOfString:str]];
}


-(void)SUN_SetAttributeLineHeight:(CGFloat)lineHeight
                 attributedString:(NSMutableAttributedString *)attributedString
                           string:(NSString *)string
                    rangeOfString:(NSString *)str{

}
-(void)SUN_SetAttributeParagraphSpacing:(CGFloat)paragraphSpacing
                       attributedString:(NSMutableAttributedString *)attributedString
                                 string:(NSString *)string
                          rangeOfString:(NSString *)str{

}
@end
