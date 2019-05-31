//
//  UITabView+Ext.swift
//  swiftPro
//
//  Created by diyidan on 2019/5/30.
//  Copyright © 2019 fei. All rights reserved.
//

import UIKit

extension UITableView{
    /// 注册 cell 的方法  where 遵循协议
    func ym_registerCell<T:UITableViewCell>(cell:T.Type) where T: RegisterCellOrNib {
        if let nib = T.nib{
            register(nib, forCellReuseIdentifier: T.identifier)
        }else{
            register(cell, forCellReuseIdentifier: T.identifier)
        }
    }
    /// 从缓存池池出已经存在的 cell
    func ym_dequeueReusableCell<T:UITableViewCell>(indexPath:IndexPath) -> T where T:RegisterCellOrNib {
        return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as!T
    }
    
}
