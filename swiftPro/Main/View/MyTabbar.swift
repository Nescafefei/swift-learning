//
//  MyTabbar.swift
//  swiftPro
//
//  Created by diyidan on 2019/5/23.
//  Copyright © 2019 fei. All rights reserved.
//

import UIKit

class MyTabbar: UITabBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(publishButton)
    }
    
    
    
    
    private lazy var publishButton :UIButton = {
        let publishButton = UIButton(type: .custom)
        publishButton.setBackgroundImage(UIImage(named: "feed_publish_44x44_"), for: .normal)
        publishButton.setBackgroundImage(UIImage(named: "feed_publish_press_44x44_"), for: .selected)
        publishButton.sizeToFit()
        return publishButton
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let width = frame.width
        let height:CGFloat = 49
        
        publishButton.center = CGPoint(x: width*0.5, y: height*0.5-10)
        
        // 设置其他按钮 frame
        let buttonW:CGFloat = width/5.0
        let buttonH:CGFloat = height
        let buttonY:CGFloat = 0
        
        var index = 0
        
        for button in subviews {
            if !button.isKind(of: NSClassFromString("UITabBarButton")!){
                continue
            }
            let buttonX = buttonW * (index > 1 ? CGFloat(index+1):CGFloat(index))
            button.frame = CGRect(x: buttonX, y: buttonY, width: buttonW, height: buttonH)
            index += 1
            
        }
        
        
        
        
    }
    
    
    
}
