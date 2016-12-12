//
//  UIDevice+Category.h
//  yxl-ios
//
//  Created by mac on 16/12/12.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Category)

/**
 *  获取iOS版本
 */
#define IOS_VERSION [UIDevice currentDevice].systemVersion

/**
 *  获取屏幕宽度和高度
 */
#define SCREEN_WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)
#define SCREEN_HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

    
/**
 *  返回CPU频率
 */
+ (NSUInteger)cpuFrequency;

/**
 *  返回总线频率
 */
+ (NSUInteger)busFrequency;

/**
 *  返回物理内存大小
 */
+ (NSUInteger)ramSize;

/**
 *  返回CPU数
 */
+ (NSUInteger)cpuNumber;

/**
 *  返回总内存
 */
+ (NSUInteger)totalMemory;

/**
 *  返回非内核内存
 */
+ (NSUInteger)userMemory;

/**
 *  返回文件系统空间
 */
+ (NSNumber *)totalDiskSpace;

/**
 *  返回文件系统剩余空间
 */
+ (NSNumber *)freeDiskSpace;
    
/** 强制屏幕旋转 */
+ (void)SUN_ChangeOrientation:(UIInterfaceOrientation)orientation;

    
@end
