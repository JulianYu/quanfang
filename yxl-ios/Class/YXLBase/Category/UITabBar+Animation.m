//
//  UITabBar+Animation.m
//  yxl-ios
//
//  Created by mac on 16/12/15.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "UITabBar+Animation.h"
#import <objc/runtime.h>
@implementation UITabBar (Animation)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(layoutSubviewsNew) originalSelector:@selector(layoutSubviews)];
    });
}

+ (void)swizzleMethod:(SEL)swizzledSelector originalSelector:(SEL)originalSelector
{
    Class swizzledClass = [self class];
    
    Method swizzledMethod = class_getInstanceMethod(swizzledClass, swizzledSelector);
    IMP swizzledIMP = method_getImplementation(swizzledMethod);
    const char *swizzledType = method_getTypeEncoding(swizzledMethod);
    
    Method originalMethod = class_getInstanceMethod(swizzledClass, originalSelector);
    IMP originalIMP = method_getImplementation(originalMethod);
    const char *originalType = method_getTypeEncoding(originalMethod);
    
    class_replaceMethod(swizzledClass, swizzledSelector, originalIMP, originalType);
    class_replaceMethod(swizzledClass, originalSelector, swizzledIMP, swizzledType);
}

-(void)layoutSubviewsNew
{
    [self layoutSubviewsNew];
    

    for (UIControl *tabBarBtn in self.subviews)
    {

        if ([tabBarBtn isKindOfClass:NSClassFromString(@"UITabBarButton")])
        {
            [tabBarBtn addTarget:self action:@selector(tabBarBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

-(void)tabBarBtnDidClick:(UIControl *)tabBarButton
{
    for (UIView *imageView in tabBarButton.subviews)
    {
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")])
        {
            imageView.transform = CGAffineTransformMakeScale(0.5, 0.5);
            
            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:9 options:0 animations:^{
                
                imageView.transform = CGAffineTransformMakeScale(1.0, 1.0);
                
            } completion:^(BOOL finished) {
                
            }];
        }
    }
}
@end
