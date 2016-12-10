//
//  AnimationTabBarController.swift
//  yxl-ios
//
//  Created by mac on 16/12/10.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

import UIKit


class RAMBounceAnimation : RAMItemAnimation {
    
    override func playAnimation(icon : UIImageView, textLabel : UILabel) {
        playBounceAnimation(icon: icon)
        textLabel.textColor = textSelectedColor
    }
    
    override func deselectAnimation(icon : UIImageView, textLabel : UILabel, defaultTextColor : UIColor) {
        textLabel.textColor = defaultTextColor
        
        if let iconImage = icon.image {
            let renderImage = iconImage.withRenderingMode(.alwaysOriginal)
            icon.image = renderImage
            icon.tintColor = defaultTextColor
            
        }
    }
    
    override func selectedState(icon : UIImageView, textLabel : UILabel) {
        textLabel.textColor = textSelectedColor
        
        if let iconImage = icon.image {
            let renderImage = iconImage.withRenderingMode(.alwaysOriginal)
            icon.image = renderImage
            icon.tintColor = textSelectedColor
        }
    }
    
    func playBounceAnimation(icon : UIImageView) {
        
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        bounceAnimation.duration = TimeInterval(duration)
        bounceAnimation.calculationMode = kCAAnimationCubic
        
        icon.layer.add(bounceAnimation, forKey: "bounceAnimation")
        
        if let iconImage = icon.image {
            let renderImage = iconImage.withRenderingMode(.alwaysOriginal)
            icon.image = renderImage
            icon.tintColor = iconSelectedColor
        }
    }
    
}


protocol RAMItemAnimationProtocol {
    func playAnimation(icon : UIImageView, textLabel : UILabel)
    func deselectAnimation(icon : UIImageView, textLabel : UILabel, defaultTextColor : UIColor)
    func selectedState(icon : UIImageView, textLabel : UILabel)
}

class RAMItemAnimation:NSObject, RAMItemAnimationProtocol{

    var duration : CGFloat = 0.6
    var textSelectedColor : UIColor = UIColor.gray
    var iconSelectedColor : UIColor?
    
    func playAnimation(icon : UIImageView, textLabel : UILabel) {
        
    }
    func deselectAnimation(icon: UIImageView, textLabel: UILabel, defaultTextColor: UIColor) {
        
    }
    
    func selectedState(icon: UIImageView, textLabel : UILabel) {
    
    }
}

class RAMAnimatedTabBarItem: UITabBarItem {
    var animation : RAMItemAnimation?
    
    var textColor = UIColor.gray
    
    func playAnimation(icon: UIImageView, textLabel: UILabel){
        guard let animation = animation else {
            print("add animation in UITabBarItem")
            return
        }
        animation.playAnimation(icon: icon, textLabel: textLabel)
    }
    func deselectAnimation(icon: UIImageView, textLabel: UILabel) {
        animation?.deselectAnimation(icon: icon, textLabel: textLabel, defaultTextColor: textColor)
    }
    
    func selectedState(icon: UIImageView, textLabel: UILabel) {
        animation?.selectedState(icon: icon, textLabel: textLabel)
    }

    
}

class AnimationTabBarController: UITabBarController{
    var iconsView:[(icon: UIImageView, textLabel: UILabel)] = []
    var iconsImageName:[String] = ["yxl_home","yxl_shop","yxl_message","yxl_mine"]
    var iconsSelectedImageName:[String] = ["yxl_home_s","yxl_shop_s","yxl_message_s","yxl_mine_s"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func createViewContainers() -> [String:UIView] {
        var containersDict = [String: UIView]()
        
        guard let customItems = tabBar.items as? [RAMAnimatedTabBarItem] else {
            return containersDict
        }
        
        for index in 0..<customItems.count {
            let viewContainer = createViewContainer(index: index)
            containersDict["container\(index)"] = viewContainer
        }
        return containersDict
    }
    
    func createViewContainer(index : Int) -> UIView{
        let viewWidth : CGFloat = ScreenWidth / CGFloat(tabBar.items!.count)
        let viewHeight : CGFloat = tabBar.height

        let viewContainer = UIView.init(frame: CGRect(x:viewWidth * CGFloat(index), y:0, width:viewWidth, height:viewHeight))
        
        viewContainer.backgroundColor = UIColor.clear
        viewContainer.isUserInteractionEnabled = true
        
        tabBar.addSubview(viewContainer)
        viewContainer.tag = index
        
        return viewContainer
    }
    
    func createCustomIcons(containers : [String: UIView]){
        if let items = tabBar.items {
            for (index, item) in items.enumerated() {
                assert(item.image != nil, "add image icon in UITabBarItem")
                
                guard let container = containers["container\(index)"] else { return print("No container given")
                    continue
                }
                
                container.tag = index
                
                let imageW:CGFloat = 21
                let imageX:CGFloat = (ScreenWidth / CGFloat(items.count) - imageW) * 0.5
                let imageY:CGFloat = 8
                let imageH:CGFloat = 21
                let icon = UIImageView(frame: CGRect(x: imageX, y: imageY, width: imageW, height: imageH))
                icon.image = item.image
                icon.tintColor = UIColor.clear

                let textLabel = UILabel()
                textLabel.frame = CGRect(x:0, y:32, width:ScreenWidth / CGFloat(items.count), height:49 - 32)
                textLabel.text = item.title
                textLabel.backgroundColor = UIColor.clear
                textLabel.font = UIFont.systemFont(ofSize: 10)
                textLabel.textAlignment = NSTextAlignment.center
                textLabel.textColor = UIColor.gray
                textLabel.translatesAutoresizingMaskIntoConstraints = false
                container.addSubview(icon)
                container.addSubview(textLabel)
                
                
                if let tabBarItem = tabBar.items {
                    let textLabelWidth = tabBar.frame.size.width / CGFloat(tabBarItem.count)
                    textLabel.bounds.size.width = textLabelWidth
                }
                
                
                
                let iconsAndLabels = (icon:icon, textLabel:textLabel)
                iconsView.append(iconsAndLabels)
                
                
                item.image = nil
                item.title = ""
                
                if index == 0 {
                    selectedIndex = 0
                    selectItem(Index:0)
                }

            }
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
    
    func selectItem(Index: Int){
        let items = tabBar.items as! [RAMAnimatedTabBarItem]
        let selectIcon = iconsView[Index].icon
        selectIcon.image = UIImage(named:iconsSelectedImageName[Index])!
        items[Index].selectedState(icon: selectIcon, textLabel: iconsView[Index].textLabel)
    }
    
    func setSelectIndex(from: Int,to: Int){

        selectedIndex = to
        let items = tabBar.items as! [RAMAnimatedTabBarItem]
        
        let fromIV = iconsView[from].icon
        fromIV.image = UIImage(named:iconsImageName[from])
        items[from].deselectAnimation(icon: fromIV, textLabel: iconsView[from].textLabel)
        
        let toIV = iconsView[to].icon
        toIV.image = UIImage(named:iconsSelectedImageName[to])
        items[to].playAnimation(icon: toIV, textLabel: iconsView[to].textLabel)
    
    }
    
    
    
}
