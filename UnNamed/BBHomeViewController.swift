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
let BaseURLString = "http://www.raywenderlich.com/demos/weather_sample/"
let HASSAVECONTACTTODATABASE = "HASSAVECONTACTTODATABASE"
class BBHomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MTStatusBarOverlayDelegate {

    var coverBtn:UIButton!
    var tabView: UITableView?
    
    lazy var data = Array<AnyObject>()
//    lazy var data: [AnyObject] = [AnyObject]()
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
        
        
        
//        loadWeatherData()
        
//        self.tabView?.addHeaderWithCallback({ () -> Void in
//            self.loadNewData()
//        })
//        self.tabView?.headerBeginRefreshing()
//        
//        self.tabView?.addFooterWithCallback({ () -> Void in
//            self.loadMoreData()
//        })
//        
//        self.tabView?.headerPullToRefreshText = "下拉可以刷新了"
//        self.tabView?.headerReleaseToRefreshText = "松开马上刷新了"
//        self.tabView?.headerRefreshingText = "正在帮你刷新中"
//        
//        self.tabView?.footerPullToRefreshText = "上拉可以加载更多数据了"
//        self.tabView?.footerReleaseToRefreshText = "松开马上加载更多数据了"
//        self.tabView?.footerRefreshingText = "正在帮你加载中"
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let userDefault = NSUserDefaults.standardUserDefaults()
        var hasSave = userDefault.boolForKey(HASSAVECONTACTTODATABASE)
        if !hasSave {
            var contacts = self.addContactData()
            self.saveContactData(contacts)
            userDefault.setBool(true, forKey: HASSAVECONTACTTODATABASE)
            userDefault.synchronize()
        }
        var contacts = BBContact.searchWithWhere(nil, orderBy: nil, offset: 0, count: 0)
        data.removeAll(keepCapacity: true)
        for contact in contacts{
            data.append(contact)
        }
        self.tabView?.reloadData()
    }
    
    func saveContactData(contacts: Array<AnyObject>){
        for contact in contacts{
            contact.saveToDB()
        }
    }
    
    func addContactData() -> Array<AnyObject>{
            var contacts = Array<AnyObject>()
            for var i = 0; i < 10; i++ {
            let contact = BBContact()
            contact.displayName = "li" + "\(arc4random_uniform(1000))"
            contact.nickname = "l" + "\(arc4random_uniform(1000))"
            var tels = Array<AnyObject>()
            for var m = 0; m < 2; m++ {                
                let tel = BBTel()
                tel.value = "\(arc4random_uniform(183000))"
                if m == 0 {
                    tel.pref = true
                }
                tels.append(tel)
            }
            contact.phoneNumbers = tels
            contacts.append(contact)
        }
        return contacts
    }
    
    func loadWeatherData(){
//        let string = BaseURLString.stringByAppendingString("weather.php?format=json")
//        let url = NSURL(string: string)
//        var request = NSURLRequest(URL: url!)
//        
//        let operation = AFHTTPRequestOperation(request: request)
//        operation.responseSerializer = AFJSONResponseSerializer()
//        operation.setCompletionBlockWithSuccess({ (operation, responseObject) -> Void in            
//            println("success")
//            
//            }, failure: { (operation, error) -> Void in
//                println("failure")
//                let alertView = UIAlertView(title: "Error Weather", message: error.localizedDescription, delegate: nil, cancelButtonTitle: "Cancle")
//                alertView.show()
//        })
//        
//       operation.start()

    }
    
    func loadMoreData(){
        for var a = 0; a<5; a++ {
            self.data.append(String(arc4random_uniform(1000000)))
        }
        var time = dispatch_time(DISPATCH_TIME_NOW, (Int64)(2 * NSEC_PER_SEC))
        let globalQueue = dispatch_get_main_queue()
        dispatch_after(time, globalQueue) { () -> Void in
            self.tabView?.reloadData()
//            self.tabView?.footerEndRefreshing()
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
//            self.tabView?.headerEndRefreshing()
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
         let contact: AnyObject = data[indexPath.row]
         cell.textLabel?.text = contact.displayName
         var dic = NSMutableDictionary()
         dic["pref"] = true
         dic["contactId"] = contact.rowid
         var tel: AnyObject! = BBTel.searchSingleWithWhere(dic, orderBy: nil)
         cell.detailTextLabel?.text = tel.value
         return cell
    }
        
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        var nexVc = BBNextController()
        nexVc.contact = data[indexPath.row] as? BBContact
        self.navigationController?.pushViewController(nexVc, animated: true)
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            var contact = self.data[indexPath.row] as! BBContact
            contact.deleteToDB()
            self.data.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
            tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String! {
        return "删除"
    }
    
}
