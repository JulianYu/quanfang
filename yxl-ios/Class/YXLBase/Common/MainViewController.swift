//
//  MainViewController.swift
//  yxl-ios
//
//  Created by mac on 16/12/10.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

import UIKit

class MainTabBarController: AnimationTabBarController, UITabBarControllerDelegate {
    private var fristLoadMainTabBarController: Bool = true
    private var adImageView: UIImageView?
    var adImage: UIImage? {
        didSet {
            weak var tmpSelf = self
            adImageView = UIImageView(frame: ScreenBounds)
            adImageView!.image = adImage!
            self.view.addSubview(adImageView!)
            
            UIImageView.animate(withDuration: 2.0, animations: { () -> Void in
                tmpSelf!.adImageView!.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                tmpSelf!.adImageView!.alpha = 0
            }) { (finsch) -> Void in
                tmpSelf!.adImageView!.removeFromSuperview()
                tmpSelf!.adImageView = nil
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        buildMainTabBarChildViewController()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if fristLoadMainTabBarController {
            let containers = createViewContainers()
            
            createCustomIcons(containers: containers)
            fristLoadMainTabBarController = false
        }
    }

    private func buildMainTabBarChildViewController() {
        tabBarControllerAddChildViewController(childView: HomeViewController(), title: "首页", imageName: "yxl_home", selectedImageName: "yxl_home_s", tag: 0)
        tabBarControllerAddChildViewController(childView: BusinessViewController(), title: "生意", imageName: "yxl_shop", selectedImageName: "yxl_shop_s", tag: 1)
        tabBarControllerAddChildViewController(childView: MessageViewController(), title: "消息", imageName: "yxl_message", selectedImageName: "yxl_message_s", tag: 2)
        tabBarControllerAddChildViewController(childView: MineViewController(), title: "我的", imageName: "yxl_mine", selectedImageName: "yxl_mine_s", tag: 3)
    }

    private func tabBarControllerAddChildViewController(childView: UIViewController, title: String, imageName: String, selectedImageName: String, tag: Int) {
        let vcItem = RAMAnimatedTabBarItem(title: title, image: UIImage(named: imageName), selectedImage: UIImage(named: selectedImageName))
        vcItem.tag = tag
        vcItem.animation = RAMBounceAnimation()
        childView.tabBarItem = vcItem
        
        let navigationVC = BaseNavigationController(rootViewController:childView)
        addChildViewController(navigationVC)
    }

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        let childArr = tabBarController.childViewControllers as NSArray
//        let index = childArr.index(of: viewController)
//        
//        if index == 2 {
//            return false
//        }
        
        return true
    }


}
