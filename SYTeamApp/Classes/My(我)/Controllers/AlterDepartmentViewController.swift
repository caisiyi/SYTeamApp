//
//  AlterDepartmentViewController.swift
//  PersonInformation
//
//  Created by MAC on 16/4/13.
//  Copyright © 2016年 MAC. All rights reserved.
//

import UIKit


class AlterDepartmentViewController: UIViewController,UITextFieldDelegate {
    var department:String?
    var delegete:AlterDepartmentViewControllerDelegate?
    lazy var departmentTF:PersonalTextField = {
        let textfield = PersonalTextField()
        textfield.text = UserAccount.shareUser.department
        textfield.clearButtonMode = UITextFieldViewMode.Always
        textfield.backgroundColor = UIColor.whiteColor()
        return textfield
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        self.title = "我的部门"
        let leftItem = UIBarButtonItem(title: "取消", style: .Plain, target: self, action: "cancel")
        self.navigationItem.leftBarButtonItem = leftItem
        let rightItem = UIBarButtonItem(title: "完成", style: .Plain, target: self, action: "sure")
        self.navigationItem.rightBarButtonItem = rightItem
        view.addSubview(departmentTF)
        departmentTF.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(74)
            make.left.right.equalTo(0)
            make.height.equalTo(40)
        }
        


        // Do any additional setup after loading the view.
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func cancel(){
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    func sure(){
        department = departmentTF.text
        self.delegete?.backUserDepartment(self, text: department!)
        
        UserAccount.ChangeUserInfo(department!, key: "userDepartment")
        self.navigationController?.popViewControllerAnimated(true)
        
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
