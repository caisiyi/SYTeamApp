//
//  zhuceView.swift
//  Login_Demo
//
//  Created by MAC on 16/4/8.
//  Copyright © 2016年 MAC. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController ,UITextFieldDelegate{
    lazy var phoneTF:HoshiTextField={
        let a=HoshiTextField()
        a.placeholder="请输入帐号"
        //a.keyboardType = UIKeyboardType.NumberPad
        a.borderInactiveColor = UIColor.whiteColor()
        a.clearButtonMode=UITextFieldViewMode.Always
        a.delegate = self
        return a
        }()
    lazy var passwordTF:HoshiTextField={
        let a=HoshiTextField()
        a.placeholder="请输入密码"
        a.secureTextEntry=true
         a.borderInactiveColor = UIColor.whiteColor()
        a.clearButtonMode=UITextFieldViewMode.Always
        a.delegate = self
        return a
        }()
    lazy var repasswordTF:HoshiTextField={
        let a=HoshiTextField()
        a.placeholder="再输入一次密码"
         a.borderInactiveColor = UIColor.whiteColor()
        a.clearButtonMode=UITextFieldViewMode.Always
        a.secureTextEntry=true
        a.delegate = self
        return a
        }()
    lazy var nextBtn:ZJButton={
        let a=ZJButton()
        a.layer.cornerRadius=30
        a.setTitle("注册", forState: UIControlState.Normal)
        a.rippleColor = UIColor(red: 103/255, green: 191/255, blue: 237/255, alpha: 1)
        a.backgroundColor = UIColor(red: 103/255, green: 191/255, blue: 237/255, alpha: 1)
        a.addTarget(self, action: "click", forControlEvents: UIControlEvents.TouchUpInside)
        return a
        }()
    lazy var closeBtn:UIButton={
        let a=UIButton()
        a.titleLabel?.font = UIFont.boldSystemFontOfSize(20)
        a.setTitle("X", forState: UIControlState.Normal)
        a.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        return a
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor=UIColor(red: 18/255, green: 171/255, blue: 233/255, alpha: 1)
        phoneTF.delegate = self
        view.addSubview(phoneTF)
        phoneTF.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(70)
            make.left.equalTo(40)
            make.height.equalTo(60)
            make.right.equalTo(-40)
        }
        passwordTF.delegate = self
        view.addSubview(passwordTF)
        passwordTF.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(phoneTF.snp_bottom).offset(10)
            make.left.equalTo(phoneTF)
            make.height.equalTo(phoneTF)
            make.right.equalTo(phoneTF)
        }
        repasswordTF.delegate = self
        view.addSubview(repasswordTF)
        repasswordTF.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(passwordTF.snp_bottom).offset(10)
            make.left.equalTo(passwordTF)
            make.height.equalTo(passwordTF)
            make.right.equalTo(passwordTF)
        }
        view.addSubview(nextBtn)
        nextBtn.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(repasswordTF.snp_bottom).offset(20)
            make.left.equalTo(40)
            make.height.equalTo(60)
            make.right.equalTo(-40)
        }
        
        closeBtn.addTarget(self, action: "Close", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(closeBtn)
        closeBtn.snp_makeConstraints { (make) in
            make.top.equalTo(20)
            make.right.equalTo(-20)
            make.height.width.equalTo(40)
        }
        // Do any additional setup after loading the view.
    }
    func Close(){
        dismissVC(completion: nil)
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        phoneTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
        repasswordTF.resignFirstResponder()
    }

    func click(){
        if(passwordTF.text != repasswordTF.text){
            SYProgressHUD.ShowFailed("密码不一致")
        }
        else if(phoneTF.text == nil || phoneTF.text == ""){
            SYProgressHUD.ShowFailed("账号不能为空")
        }
        else if(passwordTF.text == nil || passwordTF.text == ""){
            SYProgressHUD.ShowFailed("密码不能为空")
        }
        
        else if(phoneTF.text == nil || phoneTF.text == ""){
            SYProgressHUD.ShowFailed("账号不能为空")
        }
//        else if(phoneTF.text?.characters.count != 11){
//            SYProgressHUD.ShowFailed("账号必须为11位")
//        }
        else{
            let object = AVObject(className: "UserList")
            object.setObject(self.phoneTF.text!.lowercaseString, forKey: "userName")
            object.setObject(self.passwordTF.text, forKey: "userPassWord")
            object.saveInBackgroundWithBlock({ (bool, error) in
                if error == nil {
                if  EMClient.sharedClient().registerWithUsername(self.phoneTF.text, password: self.passwordTF.text) == nil {
                    SYProgressHUD.ShowSuccess("注册成功")
                    self.dismissVC(completion: nil)
                }else{
                    SYProgressHUD.ShowFailed("注册失败")
                }
                }else{
                    SYProgressHUD.ShowFailed("注册失败")
                }
            })
            
          //  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            
            
           // }
        //SYProgressHUD.Clear()
        //self.navigationController?.pushViewController(RegisterMoreViewController(), animated: true)
        }
    }
        func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
//        if (textField == phoneTF ){
//            if(range.length == 1){
//                return true
//            }
//            switch string {
//            case "0","1","2","3","4","5","6","7","8","9":
//                
//                if (range.location >= 11) {
//                    return false
//                }
//                return true
//            default:
//                return false
//            }
//        }
        return true
    }
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        let offset = self.view.frame.size.height - (textField.frame.origin.y + textField.frame.size.height + 216 + 50)
        if(offset <= 0){
            UIView .animateWithDuration(0.3, animations: { () -> Void in
                var frame = self.view.frame
                frame.origin.y = offset
                self.view.frame = frame
            })
            
        }
        return true
        
    }
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        UIView.animateWithDuration(0.3) { () -> Void in
            var frame = self.view.frame
            frame.origin.y = 0.0
            self.view.frame = frame
        }
        return true
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
