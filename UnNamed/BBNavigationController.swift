//
//  BBNavigationController.swift
//  UnNamed
//
//  Created by T on 15/7/13.
//  Copyright (c) 2015年 benbun. All rights reserved.
//

import UIKit

class BBNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0{
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
    }
}
