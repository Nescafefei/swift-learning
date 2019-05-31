//
//  MyTabBarController.swift
//  swiftPro
//
//  Created by diyidan on 2019/5/23.
//  Copyright © 2019 fei. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(tabBar.subviews)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        let tabbar = UITabBar.appearance()
        tabbar.tintColor =  UIColor(red: 245 / 255.0, green: 90 / 255.0, blue: 93 / 255.0, alpha: 1.0)
        
        
        
        addChildViewController()
        
    }
    
    func addChildViewController() {
        setChildViewController(HomeViewController(), titlie: "首页", imageName: "home_tabbar_32x32_", selectImageName: "home_tabbar_press_32x32_")
        
        setChildViewController(VideoViewController(), titlie: "视频", imageName: "video_tabbar_32x32_", selectImageName: "video_tabbar_press_32x32_")
        
        setChildViewController(HuoshanViewController(), titlie: "小视频", imageName: "huoshan_tabbar_32x32_", selectImageName: "huoshan_tabbar_press_32x32_")
        
        setChildViewController(MyViewController(), titlie: "我的", imageName: "mine_tabbar_32x32_", selectImageName: "mine_tabbar_press_32x32_")
        
        // tabBar 是 readonly 属性，不能直接修改，利用 KVC 把 readonly 属性的权限改过来
        setValue(MyTabbar(), forKey: "tabBar")
        
        
    }
    
    func setChildViewController(_ childController:UIViewController,titlie:String,imageName:String,selectImageName:String){
        // 设置tabbar 文字和图片
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: selectImageName)
        childController.tabBarItem.title = titlie
        childController.navigationItem.title = titlie
        childController.view.backgroundColor = UIColor.white
        let navVC = MyNavigationController(rootViewController: childController)
        addChild(navVC)
        
        
    }

    
}
