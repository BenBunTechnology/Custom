//
//  BBLeftViewController.swift
//  UnNamed
//
//  Created by T on 15/7/10.
//  Copyright (c) 2015年 benbun. All rights reserved.
//

import UIKit

class BBLeftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        self.view.backgroundColor = UIColor.orangeColor()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.Done, target: self, action: "back")
    }
    
    func back(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    

}
