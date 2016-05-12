//
//  TestViewController.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/3/22.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit


class TestViewController: UIViewController {

    
    let text = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //PulicGroupManager.instance.get()
        view.backgroundColor = UIColor.whiteColor()
        view.addSubview(text)
        text.placeholder = "输入帐号"
        text.snp_makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(80)
            make.height.equalTo(40)
        }
        let btn = UIButton()
        btn.backgroundColor = UIColor.orangeColor()
        view.addSubview(btn)
        btn.snp_makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(text.snp_bottom).offset(20)
            make.height.equalTo(30)
        }
        btn.addTarget(self, action: #selector(TestViewController.Login), forControlEvents: .TouchUpInside)
    }
    func Login(){
        MainManager.instance.Login(text.text!, password: "caisiyi") { (successed) -> () in
            
        }
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
