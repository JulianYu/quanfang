//
//  AppDelegate+Extension.swift
//  yxl-ios
//
//  Created by mac on 16/12/10.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

import UIKit

extension AppDelegate {
    func setupGlobalStyle() {
        UIApplication.shared.isStatusBarHidden = false
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
    }
    
    func setupRootViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if isNewVersion() {
        
        
        }
    }

    
    
    private func isNewVersion() -> Bool {
        // 获取当前的版本号
        let versionString = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        print(versionString)
        let nowVersion = versionString
        // 获取到之前的版本号
        let oldVersion: String = YXL_UserDefaultsGet("oldVersionKey") as! String
        // 对比
        return nowVersion > oldVersion
    }


    private func saveVersion() {
        // 获取当前的版本号
        let nowVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        // 保存当前版本号
        YXL_UserDefaultsSet("oldVersionKey", obj:nowVersion as AnyObject)
        YXL_UserDefaultsSyn()
    }

    
}
