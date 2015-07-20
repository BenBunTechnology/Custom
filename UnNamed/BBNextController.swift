//
//  BBNextController.swift
//  UnNamed
//
//  Created by T on 15/7/13.
//  Copyright (c) 2015年 benbun. All rights reserved.
//

import UIKit

class BBNextController: UIViewController {
    var contact: BBContact?
    var nameField: UITextField!
    var phoneField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addContact")
        
        nameField = UITextField()
        self.view.addSubview(nameField)
        nameField.borderStyle = UITextBorderStyle.RoundedRect
        nameField.clearButtonMode = UITextFieldViewMode.WhileEditing
        nameField.text = contact?.displayName
        nameField.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view).offset(40)
            make.left.equalTo(self.view).offset((SCREEN_WIDTH - (SCREEN_WIDTH * 0.8)) * 0.5)
            make.width.equalTo(SCREEN_WIDTH * 0.8)
            make.height.equalTo(30)
        }


        phoneField = UITextField()
        phoneField.borderStyle = UITextBorderStyle.RoundedRect
        phoneField.clearButtonMode = UITextFieldViewMode.WhileEditing

        self.view.addSubview(phoneField)
        phoneField.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(nameField).offset(50)
            make.size.equalTo(nameField)
            make.centerX.equalTo(nameField)
        }
        var dic = NSMutableDictionary()
        dic["pref"] = true
        dic["contactId"] = contact?.rowid
        let tel: AnyObject! = BBTel.searchSingleWithWhere(dic, orderBy: nil)
        phoneField.text = tel.value
        
        let modifyBtn = UIButton()
        self.view.addSubview(modifyBtn)
        modifyBtn.backgroundColor = UIColor.orangeColor()
        modifyBtn.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(phoneField).offset(30 + 20)
            make.centerX.equalTo(nameField)
            make.size.equalTo(nameField)
        }
        
        modifyBtn.setTitle("modify", forState: UIControlState.Normal)
        modifyBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        modifyBtn.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Highlighted)
        modifyBtn.addTarget(self, action: "modify", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    func modify(){
        contact?.displayName = self.nameField.text
        var dic = NSMutableDictionary()
        dic["pref"] = true
        dic["contactId"] = contact?.rowid
        var tel = BBTel.searchSingleWithWhere(dic, orderBy: nil) as! BBTel
        var tels = Array<AnyObject>()
        tel.value  = phoneField.text
        tels.append(tel)
        contact?.phoneNumbers = tels        
        contact?.updateToDB()
        navigationController?.popViewControllerAnimated(true)
    }
    
    func addContact(){
        
    }
}
