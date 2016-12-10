//
//  UIView+Extension.swift
//  yxl-ios
//
//  Created by mac on 16/12/10.
//  Copyright © 2016年 孙若淮. All rights reserved.
//

import UIKit

extension UIView {

    var x: CGFloat {
        return self.frame.origin.x
    }

    var y: CGFloat {
        return self.frame.origin.y
    }

    var width: CGFloat {
        return self.frame.size.width
    }

    var height: CGFloat {
        return self.frame.size.height
    }
    var size: CGSize {
        return self.frame.size
    }
    var point: CGPoint {
        return self.frame.origin
    }
}
