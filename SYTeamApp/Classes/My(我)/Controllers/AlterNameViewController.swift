//
//  AlterNameViewController.swift
//  PersonInformation
//
//  Created by MAC on 16/4/13.
//  Copyright © 2016年 MAC. All rights reserved.
//

import UIKit

class AlterNameViewController: UIViewController ,UITextFieldDelegate{
    var delegete:AlterNameViewControllerDelegate?
    var name:String?
    lazy var nameTF:PersonalTextField = {
            let textfield = PersonalTextField()
        textfield.text = UserAccount.shareUser.nickname
        textfield.clearButtonMode = UITextFieldViewMode.Always
        textfield.backgroundColor = UIColor.whiteColor()
            return textfield
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "姓名"
        let leftItem = UIBarButtonItem(title: "取消", style: .Plain, target: self, action: "cancel")
        self.navigationItem.leftBarButtonItem = leftItem
        let rightItem = UIBarButtonItem(title: "完成", style: .Plain, target: self, action: "sure")
        self.navigationItem.rightBarButtonItem = rightItem
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        nameTF.delegate = self
        view.addSubview(nameTF)
        nameTF.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(74)
            make.left.right.equalTo(0)
            make.height.equalTo(40)
        }
        

        // Do any additional setup after loading the view.
    }
    func cancel(){
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    func sure(){
        name = nameTF.text
        self.delegete?.backUserName(name!)
        print(name!)
        
        UserAccount.ChangeUserInfo(name!, key: "userNickName")
        self.navigationController?.popViewControllerAnimated(true)
      
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
