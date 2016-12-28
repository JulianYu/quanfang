//
//  UILabel+Category.m
//  yxl-ios
//
//  Created by mac on 16/12/13.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "UILabel+Category.h"

@implementation UILabel (Category)
-(void)SUN_SetTitleWithColor:(UIColor *)color FontSize:(CGFloat)fontSize bold:(BOOL)bold textAlignment:(NSTextAlignment)textAlignment{
    self.textColor = color;
    if (bold) {
        self.font = [UIFont boldSystemFontOfSize:fontSize];
    }
    else{
        self.font = [UIFont systemFontOfSize:fontSize];
    }
    self.textAlignment = textAlignment;

}

@end
