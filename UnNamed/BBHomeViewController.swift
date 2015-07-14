//
//  BBHomeViewController.swift
//  UnNamed
//
//  Created by T on 15/7/10.
//  Copyright (c) 2015年 benbun. All rights reserved.
//

import UIKit
let KSCARE = 0.8
let TIMEANIMATION = 0.5
let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
let SCREEN_HEIGTH = UIScreen.mainScreen().bounds.size.height

class BBHomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MTStatusBarOverlayDelegate {

    var coverBtn:UIButton!
    var tabView: UITableView?
    
    lazy var data = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.grayColor()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "zrb_icon_menu"), style: UIBarButtonItemStyle.Done, target: self
            , action: "rightSlide")
        
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "rightSlide")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        view.addGestureRecognizer(swipeRight)
        
        self.tabView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        self.tabView?.delegate = self
        self.tabView?.dataSource = self
        self.view.addSubview(self.tabView!)
        self.tabView?.contentInset = UIEdgeInsetsMake(0, 0, 64, 0)
        self.tabView?.tableFooterView = UIView()
        
        self.tabView?.addHeaderWithCallback({ () -> Void in
            self.loadNewData()
        })
        self.tabView?.headerBeginRefreshing()
        
        self.tabView?.addFooterWithCallback({ () -> Void in
            self.loadMoreData()
        })
        
        self.tabView?.headerPullToRefreshText = "下拉可以刷新了"
        self.tabView?.headerReleaseToRefreshText = "松开马上刷新了"
        self.tabView?.headerRefreshingText = "正在帮你刷新中"
        
        self.tabView?.footerPullToRefreshText = "上拉可以加载更多数据了"
        self.tabView?.footerReleaseToRefreshText = "松开马上加载更多数据了"
        self.tabView?.footerRefreshingText = "正在帮你加载中"
        
    }
    
    func loadMoreData(){
        for var a = 0; a<5; a++ {
            self.data.append(String(arc4random_uniform(1000000)))
        }
        var time = dispatch_time(DISPATCH_TIME_NOW, (Int64)(2 * NSEC_PER_SEC))
        let globalQueue = dispatch_get_main_queue()
        dispatch_after(time, globalQueue) { () -> Void in
            self.tabView?.reloadData()
            self.tabView?.footerEndRefreshing()
        }
        
        var overlay = MTStatusBarOverlay.sharedInstance()
        overlay.animation = MTStatusBarOverlayAnimationFallDown
        overlay.detailViewMode = MTDetailViewModeCustom
        overlay.delegate = self
        overlay.progress = 0.0
        overlay.postImmediateMessage("更新5条数据", duration: 2.0, animated: true)
        overlay.progress = 1.0
    }
    
    func loadNewData(){
        for var a = 0; a<5; a++ {
            self.data.insert(String(arc4random_uniform(10000000)), atIndex: 0)
        }
        var time = dispatch_time(DISPATCH_TIME_NOW, (Int64)(2 * NSEC_PER_SEC))
        let globalQueue = dispatch_get_main_queue()
        dispatch_after(time, globalQueue) { () -> Void in
            self.tabView?.reloadData()
            self.tabView?.headerEndRefreshing()
        }
        
        var overlay = MTStatusBarOverlay.sharedInstance()
        overlay.animation = MTStatusBarOverlayAnimationFallDown
        overlay.detailViewMode = MTDetailViewModeCustom
        overlay.delegate = self
        overlay.progress = 0.0
        overlay.postImmediateMessage("更新5条数据", duration: 2.0, animated: true)
        overlay.progress = 1.0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func rightSlide(){
        let translationX = CGFloat(SCREEN_WIDTH) * CGFloat(KSCARE)
        UIView.animateWithDuration(TIMEANIMATION, animations: {
            self.tabBarController?.view.transform = CGAffineTransformMakeTranslation(translationX, 0)
            }, completion: { finished in
                self.coverBtn = UIButton()
                self.coverBtn.frame = self.tabBarController!.view.bounds
                self.tabBarController?.view.addSubview(self.coverBtn)
                self.coverBtn.addTarget(self, action: "coverBtnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        })
    }
    
    func coverBtnClick(coverBtn:UIButton){
        UIView.animateWithDuration(0.5, animations: {
            self.tabBarController?.view.transform = CGAffineTransformIdentity
            }, completion: { finished in
             coverBtn.removeFromSuperview()
        })
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
         var cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "cell")
         cell.textLabel?.text = self.data[indexPath.row]
         return cell
    }
        
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        var nexVc = BBNextController()
        nexVc.title = self.data[indexPath.row]
        self.navigationController?.pushViewController(nexVc, animated: true)
    }
    
}
