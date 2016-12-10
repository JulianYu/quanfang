//
//  ADViewController.swift
//  yxl-ios
//
//  Created by mac on 16/12/10.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

import UIKit

class ADViewController: UIViewController {
    
    private lazy var backImageView: UIImageView = {
        let backImageView = UIImageView()
        backImageView.frame = ScreenBounds
        return backImageView
    }()
    
    var imageName: String? {
        didSet {
            var placeholderImageName: String?
            switch UIDevice.currentDeviceScreenMeasurement() {
            case 3.5:
                placeholderImageName = "iphone4"
            case 4.0:
                placeholderImageName = "iphone5"//iphoneSE
            case 4.7:
                placeholderImageName = "iphone6s"// iphone6 iphone7
            default:
                placeholderImageName = "iphone6s plus"// iphone6plus iphone7plus
            }
            


            
            
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: ADImageLoadFail), object: nil)
            

            

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backImageView)
        UIApplication.shared.setStatusBarHidden(true, with: UIStatusBarAnimation.none)
    }

}
