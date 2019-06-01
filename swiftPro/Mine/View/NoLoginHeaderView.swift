
//
//  NoLoginHeaderView.swift
//  swiftPro
//
//  Created by diyidan on 2019/5/31.
//  Copyright © 2019 fei. All rights reserved.
//

import UIKit
import IBAnimatable

class NoLoginHeaderView: UIView {
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var mobileButton: UIButton!
    @IBOutlet weak var weichatButton: UIButton!
    @IBOutlet weak var qqButton: UIButton!
    @IBOutlet weak var sinaButton: UIButton!
    @IBOutlet weak var moreLoginWaysBtn: AnimatableButton!
    @IBOutlet weak var collectBtn: UIButton!
    @IBOutlet weak var historyBtn: UIButton!
    @IBOutlet weak var dayOrNightBtn: UIButton!
    
    class func headerView() -> NoLoginHeaderView {
        
        return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.last as! NoLoginHeaderView
    }
    
}
