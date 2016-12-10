//
//  MainAD.swift
//  yxl-ios
//
//  Created by mac on 16/12/10.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

import UIKit

class MainAD: NSObject, DictModelProtocol {
    var code: Int = -1
    var msg: String?
    var data: AD?
    
    class func loadADData(completion:(_ data: MainAD?, _ error: NSError?) -> Void) {
        let path = Bundle.main.path(forResource: "AD", ofType: nil)
        let data = NSData(contentsOfFile: path!)
        if data != nil {
            let dict: NSDictionary = (try! JSONSerialization.jsonObject(with: data! as Data, options: .allowFragments)) as! NSDictionary
            let modelTool = DictModelManager.sharedManager
            let data = modelTool.objectWithDictionary(dict: dict, cls: MainAD.self) as? MainAD
            completion(data, nil)
        }
    }
    
    static func customClassMapping() -> [String : String]? {
        return ["data" : "\(AD.self)"]
    }
}

class AD: NSObject {
    var title: String?
    var img_name: String?
    var starttime: String?
    var endtime: String?
}
