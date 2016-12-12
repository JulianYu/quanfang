//
//  UIDevice+Category.m
//  yxl-ios
//
//  Created by mac on 16/12/12.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

#import "UIDevice+Category.h"
#include <sys/types.h>
#include <sys/sysctl.h>
#include <sys/socket.h>
#include <net/if.h>
#include <net/if_dl.h>

@implementation UIDevice (Category)

/* 返回系统信息 */
+ (NSUInteger)getSysInfo:(uint)typeSpecifier
{
    size_t size = sizeof(int);
    int results;
    int mib[2] = {CTL_HW, typeSpecifier};
    sysctl(mib, 2, &results, &size, NULL, 0);
    return (NSUInteger) results;
}

/* 返回CPU频率 */
+ (NSUInteger)cpuFrequency
    {
        return [self getSysInfo:HW_CPU_FREQ];
    }
    
    /* 返回总线频率 */
+ (NSUInteger)busFrequency
    {
        return [self getSysInfo:HW_BUS_FREQ];
    }
    
    /* 返回物理内存大小 */
+ (NSUInteger)ramSize
    {
        return [self getSysInfo:HW_MEMSIZE];
    }
    
    /* 返回CPU数 */
+ (NSUInteger)cpuNumber
    {
        return [self getSysInfo:HW_NCPU];
    }
    
    /* 返回总内存 */
+ (NSUInteger)totalMemory
    {
        return [self getSysInfo:HW_PHYSMEM];
    }
    
    /* 返回非内核内存 */
+ (NSUInteger)userMemory
    {
        return [self getSysInfo:HW_USERMEM];
    }
    
    /* 返回文件系统空间 */
+ (NSNumber *)totalDiskSpace
    {
        NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory()
                                                                                            error:nil];
        return [fattributes objectForKey:NSFileSystemSize];
    }
    
    /* 返回文件系统剩余空间 */
+ (NSNumber *)freeDiskSpace
    {
        NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory()
                                                                                            error:nil];
        return [fattributes objectForKey:NSFileSystemFreeSize];
    }

    
+ (void)SUN_ChangeOrientation:(UIInterfaceOrientation)orientation {
    SEL selector = NSSelectorFromString(@"setOrientation:");
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[self instanceMethodSignatureForSelector:selector]];
    [invocation setSelector:selector];
    [invocation setTarget:[self currentDevice]];
    int val = orientation;
    [invocation setArgument:&val atIndex:2];
    [invocation invoke];
}

@end
