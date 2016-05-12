//
//  AlterSignViewController.swift
//  PersonInformation
//
//  Created by MAC on 16/4/13.
//  Copyright © 2016年 MAC. All rights reserved.
//

import UIKit
let KScreenW :CGFloat = UIScreen.mainScreen().bounds.width


class AlterSignViewController: UIViewController,UITextViewDelegate {
    var sign:String?
    var degelete:AlterSignViewControllerDelegate?
   lazy var SignTextView : UITextView = {
        let textview = UITextView()
        textview.text = UserAccount.shareUser.sign ?? ""
        textview.tintColor = AppColor
        textview.font = UIFont.systemFontOfSize(17)
        textview.backgroundColor = UIColor.whiteColor()
        textview.frame = CGRect(x: 0, y: 74, width: KScreenW, height: 80)
//        textview.text = UserAccount.shareUser.sign
        textview.selectedRange = NSMakeRange(80, 0)
        textview.delegate = self
        return textview
        
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        self.title = "个性签名"
        let leftItem = UIBarButtonItem(title: "取消", style: .Plain, target: self, action: "cancel")
        self.navigationItem.leftBarButtonItem = leftItem
        let rightItem = UIBarButtonItem(title: "完成", style: .Plain, target: self, action: "sure")
        self.navigationItem.rightBarButtonItem = rightItem
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.addSubview(SignTextView)
        let ImposeLabel = UILabel()
        ImposeLabel.text = "不多于30个字"
        ImposeLabel.textColor = UIColor(white: 0.5, alpha: 1)
        ImposeLabel.textAlignment = NSTextAlignment.Right
        view.addSubview(ImposeLabel)
        ImposeLabel.snp_makeConstraints { (make) in
            make.top.equalTo(SignTextView.snp_bottom)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(40)
            
        }
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        SignTextView.resignFirstResponder()
    }
    
    func cancel(){
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    func sure(){
        sign = self.SignTextView.text
        self.degelete?.backUserSign(self, text: sign!)
        
        UserAccount.ChangeUserInfo(sign!, key: "userSign")
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
       
            if(range.location >= 30){
                return false
            }
            else {
        return true
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
