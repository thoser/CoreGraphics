//
//  CustomTabbarController.swift
//  TodayNews
//
//  Created by LXN on 2019/3/21.
//  Copyright © 2019年 LXN. All rights reserved.
//

import UIKit

class CustomTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabbar = UITabBar.appearance()
        tabbar.tintColor = UIColor(red: 245/255.0, green: 90/255.0, blue: 93/255.0, alpha: 1.0)
        
        setValue(CustomTabbar(), forKey: "tabBar")
        addChildViewController()
    }
    func addChildViewController() {
        setChildViewController(childViewController: FirstViewController(), title: "首页", imageName: "home_tabbar_32x32_", selectImageName: "home_tabbar_press_32x32_")
        
        setChildViewController(childViewController: ThirdViewController(), title: "微头条", imageName: "weitoutiao_tabbar_32x32_", selectImageName: "weitoutiao_tabbar_press_32x32_")
        setChildViewController(childViewController: FourViewController(), title: "小视频", imageName: "huoshan_tabbar_32x32_", selectImageName: "huoshan_tabbar_press_32x32_")
        setChildViewController(childViewController: SecondViewController(), title: "我的", imageName: "mine_tabbar_32x32_", selectImageName: "mine_tabbar_press_32x32_")
        
    }
    func setChildViewController(childViewController:UIViewController,title:String,imageName:String,selectImageName:String){
        childViewController.tabBarItem.image = UIImage(named: imageName)
        childViewController.tabBarItem.selectedImage = UIImage(named: selectImageName)
        childViewController.title = title
        let nav = BaseNavViewController.init(rootViewController: childViewController)
        addChild(nav)
    }

}
