//
//  UIView+Ext.swift
//  swiftPro
//
//  Created by diyidan on 2019/5/30.
//  Copyright © 2019 fei. All rights reserved.
//

import UIKit

protocol RegisterCellOrNib {}

extension RegisterCellOrNib{
    
    static var identifier: String{
        return "\(self)"
    }
    static var nib:UINib?{
        return UINib(nibName: "\(self)", bundle: nil)
    }
    
}
