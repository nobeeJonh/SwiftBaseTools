//
//  CustomTabbarController.swift
//  SwiftBaseTools
//
//  Created by yons on 2019/7/12.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class CustomTabbarController: UITabBarController {

    private var playView = TabbarPalyView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().tintColor = .red
        // tip: 去除tabbar上方的线
        UITabBar.appearance().backgroundImage = UIImage.init()
        UITabBar.appearance().shadowImage = UIImage.init()
        
        setupChildControllers()
        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.bringSubviewToFront(playView)
        
    }
}

extension CustomTabbarController {
    
    private func setupChildControllers() {
        let viewCtrl1 = ViewController()
        viewCtrl1.tabBarItem.title = "首页"
        viewCtrl1.tabBarItem.image = UIImage(named: "tabbar_icon_find_normal")
        viewCtrl1.tabBarItem.selectedImage = UIImage(named: "tabbar_icon_find_normal")
        
        let viewCtrl2 = ViewController()
        viewCtrl2.tabBarItem.title = "首页"
        viewCtrl2.tabBarItem.image = UIImage(named: "tabbar_icon_find_normal")
        viewCtrl2.tabBarItem.selectedImage = UIImage(named: "tabbar_icon_find_normal")
        
        let viewCtrl3 = ViewController()
        viewCtrl3.tabBarItem.title = "首页"
        viewCtrl3.tabBarItem.image = UIImage(named: "tabbar_icon_find_normal")
        viewCtrl3.tabBarItem.selectedImage = UIImage(named: "tabbar_icon_find_normal")
        
        let viewCtrl4 = ViewController()
        viewCtrl4.tabBarItem.title = "首页"
        viewCtrl4.tabBarItem.image = UIImage(named: "tabbar_icon_find_normal")
        viewCtrl4.tabBarItem.selectedImage = UIImage(named: "tabbar_icon_find_normal")
        
        let ctrl = UIViewController()
        ctrl.view.backgroundColor = .white
        self.viewControllers = [viewCtrl1,viewCtrl2,ctrl,viewCtrl3,viewCtrl4]
    }
    
    private func setupUI() {
        view.addSubview(playView)
        view.bringSubviewToFront(playView)
        playView.snp.makeConstraints { (make) in
            make.width.height.equalTo(60)
            make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(-5 - 34)
        }
    }
}
