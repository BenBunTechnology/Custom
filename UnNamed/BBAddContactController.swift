//
//  BBAddContactController.swift
//  UnNamed
//
//  Created by T on 15/7/20.
//  Copyright (c) 2015年 benbun. All rights reserved.
//

import UIKit

class BBAddContactController: UIViewController {
    var nameField: UITextField!
    var phoneField: UITextField!
    var modifyBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        nameField = UITextField()
        nameField.placeholder = "请输入名字"
        self.view.addSubview(nameField)
        nameField.borderStyle = UITextBorderStyle.RoundedRect
        nameField.clearButtonMode = UITextFieldViewMode.WhileEditing
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
        phoneField.placeholder = "请输入电话"
        modifyBtn = UIButton()
        self.view.addSubview(modifyBtn)
        modifyBtn.backgroundColor = UIColor.orangeColor()
        modifyBtn.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(phoneField).offset(30 + 20)
            make.centerX.equalTo(nameField)
            make.size.equalTo(nameField)
        }
        modifyBtn.enabled = false
        modifyBtn.setTitle("添加", forState: UIControlState.Normal)
        modifyBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        modifyBtn.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Highlighted)
        modifyBtn.addTarget(self, action: "add", forControlEvents: UIControlEvents.TouchUpInside)
        
        NSNotificationCenter.defaultCenter() .addObserver(self, selector: "textChange", name: UITextFieldTextDidChangeNotification, object: nameField)
        NSNotificationCenter.defaultCenter() .addObserver(self, selector: "textChange", name: UITextFieldTextDidChangeNotification, object: phoneField)
    }
    
    func textChange(){
        
        modifyBtn.enabled = count(nameField.text) > 0 && count(phoneField.text) > 0
    }
    
    func add(){
        var contact = BBContact()
        contact.displayName = nameField.text
        var tels = Array<AnyObject>()
        var tel = BBTel()
        tel.value = phoneField.text
        tel.pref = true
        tels.append(tel)
        contact.phoneNumbers = tels
        contact.saveToDB()
        navigationController?.popToRootViewControllerAnimated(true)
    }

}
