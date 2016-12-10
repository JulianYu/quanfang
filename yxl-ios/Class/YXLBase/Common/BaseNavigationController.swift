//
//  BaseNavigationController.swift
//  yxl-ios
//
//  Created by mac on 16/12/10.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

import UIKit
class BaseNavigationController: UINavigationController {

    var isAnimation = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer!.delegate = nil
    }

    lazy var backBtn: UIButton = {
        let backBtn = UIButton(type: UIButtonType.custom)
        backBtn.setImage(UIImage(named: "yxl_nav_back"), for: .normal)
        backBtn.titleLabel?.isHidden = true
        backBtn.addTarget(self, action: #selector(BaseNavigationController.backBtnClick), for: .touchUpInside)
        backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
        let btnW: CGFloat = ScreenWidth > 375.0 ? 50 : 44
        backBtn.frame = CGRect(x:0, y:0, width:btnW, height:40)
        
        return backBtn
    }()
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.hidesBackButton = true
        if childViewControllers.count > 0 {
            
            UINavigationBar.appearance().backItem?.hidesBackButton = false
            
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
            
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    func backBtnClick() {
        popViewController(animated: isAnimation)
    }

    
}
