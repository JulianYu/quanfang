//
//  Macros.swift
//  yxl-ios
//
//  Created by mac on 16/12/10.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

import UIKit


func YXL_UserDefaultsSet(_ key:String, obj:Any) -> Void {
    return UserDefaults.standard.set(obj, forKey: key)
}
func YXL_UserDefaultsGet(_ key:String) -> Any {
    return UserDefaults.standard.value(forKey: key) ?? ""
}
func YXL_UserDefaultsRemo(_ key:String) -> Void {
    UserDefaults.standard.removeObject(forKey: key)
}
func YXL_UserDefaultsSetBool(_ key:String, value:Bool) -> Void {
    
    return UserDefaults.standard.set(value, forKey: key)
}
func YXL_UserDefaultsSyn() {
    UserDefaults.standard.synchronize()
}
