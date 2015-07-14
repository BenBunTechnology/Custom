//
//  BBGoViewController.swift
//  UnNamed
//
//  Created by T on 15/7/10.
//  Copyright (c) 2015年 benbun. All rights reserved.
//

import UIKit

class BBGoViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var homeVc = BBHomeViewController()
        homeVc.title = "首页"
        homeVc.tabBarItem.image = UIImage(named: "tabbar_live_normal")
        homeVc.tabBarItem.selectedImage = UIImage(named: "tabbar_live_select")
        
        var friendVc = BBFriendViewController()
        friendVc.title = "朋友"
        friendVc.tabBarItem.image = UIImage(named: "tabbar_weather_normal")
        friendVc.tabBarItem.selectedImage = UIImage(named: "tabbar_weather_select")
        
        var meVc = BBMeViewController()
        meVc.title = "我"
        meVc.tabBarItem.image = UIImage(named: "tabbar_profile_normal")
        meVc.tabBarItem.selectedImage = UIImage(named: "tabbar_profile_select")
        
        var navHome = BBNavigationController(rootViewController: homeVc)
        var navFriend = BBNavigationController(rootViewController: friendVc)
        var navMe = BBNavigationController(rootViewController: meVc)
        
        self.viewControllers = [navHome, navFriend, navMe]
        
        }
}
