//
//  zhuceFinishView.swift
//  Login_Demo
//
//  Created by MAC on 16/4/9.
//  Copyright © 2016年 MAC. All rights reserved.
//

import UIKit

class RegisterFinishViewcontroller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor(red: 18/255, green: 171/255, blue: 233/255, alpha: 1)
        
        let ExitBtn=ZJButton()
        ExitBtn.setTitle("返回首页进行登录", forState: .Normal)
        ExitBtn.layer.cornerRadius = 30
        ExitBtn.backgroundColor = UIColor(red: 103/255, green: 191/255, blue: 237/255, alpha: 1)
        ExitBtn.rippleColor = UIColor(red: 103/255, green: 191/255, blue: 237/255, alpha: 1)
        ExitBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        ExitBtn.addTarget(self, action: "exit", forControlEvents: .TouchUpInside)
        view.addSubview(ExitBtn)
        ExitBtn.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(view.bounds.height/2)
            make.left.equalTo(40)
            make.right.equalTo(-40)
            make.height.equalTo(60)
           
        }

        // Do any additional setup after loading the view.
    }
    func exit(){
        self.navigationController?.popToRootViewControllerAnimated(true)
//        self .NavigationController.popToRootViewControllerAnimated(true)
    
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
