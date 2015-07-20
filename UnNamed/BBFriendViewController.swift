//
//  BBFriendViewController.swift
//  UnNamed
//
//  Created by T on 15/7/10.CorePagesView-master
//  Copyright (c) 2015年 benbun. All rights reserved.
//

import UIKit

class BBFriendViewController: UIViewController {

    lazy var pagesView: CorePagesView = {
        var tvc1 = BBNewsListTVC()
        var tvc2 = BBNewsListTVC()
        var tvc3 = BBNewsListTVC()
        var tvc4 = BBNewsListTVC()
        
        var model1 = CorePageModel(tvc1, pageBarName: "移动互联")
        var model2 = CorePageModel(tvc2, pageBarName: "科技")
        var model3 = CorePageModel(tvc3, pageBarName: "新闻")
        var model4 = CorePageModel(tvc4, pageBarName: "直播")
        
        var pageModels = [model1, model2, model3, model4]
        
        var config = CorePagesViewConfig()
        config.isBarBtnUseCustomWidth = true
        config.barBtnFontPoint = 15
        config.barViewH = 30
        config.barBtnWidth = 60
        
        return CorePagesView(ownerVC: self, pageModels: pageModels, config: config)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = pagesView
    }

}
