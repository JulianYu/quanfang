//
//  Theme.swift
//  yxl-ios
//
//  Created by mac on 16/12/10.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

import UIKit

public let NavigationH: CGFloat = 64
public let ScreenWidth: CGFloat = UIScreen.main.bounds.size.width
public let ScreenHeight: CGFloat = UIScreen.main.bounds.size.height
public let ScreenBounds: CGRect = UIScreen.main.bounds

public let YXLCachePath: String = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!


public let YXLGlobalBackgroundColor = UIColor.colorWithCustom(r: 239, g: 239, b: 239)
public let YXLNavigationBarWhiteBackgroundColor = UIColor.colorWithCustom(r: 249, g: 250, b: 253)
public let YXLNavigationYellowColor = UIColor.colorWithCustom(r: 238, g: 0, b: 82)
public let YXLTextGreyColor = UIColor.colorWithCustom(r: 130, g: 130, b: 130)
public let YXLTextBlackColor = UIColor.colorWithCustom(r: 50, g: 50, b: 50)


public let GuideViewControllerDidFinish = "GuideViewControllerDidFinish"

public let ADImageLoadSecussed = "ADImageLoadSecussed"
public let ADImageLoadFail = "ADImageLoadFail"
