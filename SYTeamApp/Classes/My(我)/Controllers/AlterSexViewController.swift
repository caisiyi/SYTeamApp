//
//  AlterSexViewController.swift
//  PersonInformation
//
//  Created by MAC on 16/4/13.
//  Copyright © 2016年 MAC. All rights reserved.
//

import UIKit


class AlterSexViewController: UIViewController {
    var sex : String?
    var delegete : AlterSexViewControllerDelegate?
    lazy var SexChioce : ZJControl = {
            let control = ZJControl()
        
        return control
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        self.title = "性别"
        let leftItem = UIBarButtonItem(title: "取消", style: .Plain, target: self, action: "cancel")
        self.navigationItem.leftBarButtonItem = leftItem
        let rightItem = UIBarButtonItem(title: "完成", style: .Plain, target: self, action: "sure")
        self.navigationItem.rightBarButtonItem = rightItem
        view.addSubview(SexChioce)
        SexChioce.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(74)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(40)
        }
//        if UserAccount.shareUser.sex 
//        SexChioce.selectedIndex = 1
//        UserAccount.shareUser.sex
        // Do any additional setup after loading the view.
    }
    func cancel(){
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    func sure(){
        sex = SexChioce.items[SexChioce.selectedIndex]
        
        print("\(SexChioce.selectedIndex)")
        print(sex!)
        
        UserAccount.ChangeUserInfo(sex!, key: "userSex")
        self.delegete?.backUserSex(self, text: sex!)
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
