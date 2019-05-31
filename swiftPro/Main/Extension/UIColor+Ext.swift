//
//  UIColor+Ext.swift
//  swiftPro
//
//  Created by diyidan on 2019/5/24.
//  Copyright © 2019 fei. All rights reserved.
//

import UIKit

extension UIColor{
    convenience init(r:CGFloat,g:CGFloat,b:CGFloat,alpha:CGFloat = 1.0) {
        self.init(red:r/255.0,green:g/255.0,blue:b/255.0,alpha:alpha)
    }
    
    class func globaBackgroundColor() -> UIColor {
        
        return UIColor(r: 248, g: 249, b: 247)
    }
    
}
