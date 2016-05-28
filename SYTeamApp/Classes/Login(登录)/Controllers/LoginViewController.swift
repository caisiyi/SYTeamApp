//
//  ViewController.swift
//  Login_Demo
//
//  Created by MAC on 16/4/7.
//  Copyright © 2016年 MAC. All rights reserved.
//

import UIKit
let screenWidth = UIScreen.mainScreen().bounds.maxX
let screenHeight = UIScreen.mainScreen().bounds.maxY

class LoginViewController: UIViewController ,UITextFieldDelegate{
    lazy var phoneTF:HoshiTextField={
        let zhTF=HoshiTextField()
        zhTF.placeholder="请输入账号"
        zhTF.borderActiveColor = UIColor.whiteColor()
        zhTF.borderInactiveColor = UIColor.whiteColor()
        zhTF.clearButtonMode=UITextFieldViewMode.WhileEditing
        //zhTF.keyboardType = UIKeyboardType.NamePhonePad
                       return zhTF
        }()
    lazy var logo:UILabel = {
        var label = UILabel()
        label.text = "咚咚"
        label.textColor = UIColor.whiteColor()
        label.font = UIFont.boldSystemFontOfSize(50)
        return label
    }()
    lazy var passwordTF:HoshiTextField={
        let pwTF=HoshiTextField()
        pwTF.placeholder="请输入密码"
        pwTF.secureTextEntry=true
        pwTF.borderActiveColor = UIColor.whiteColor()
        pwTF.borderInactiveColor = UIColor.whiteColor()
        pwTF.clearButtonMode=UITextFieldViewMode.WhileEditing
        //pwTF.keyboardType = UIKeyboardType.Default
        
        return pwTF
        }()
    lazy var loginBtn:ZJButton={
        let btn=ZJButton()
        btn.rippleColor = UIColor(red: 103/255, green: 191/255, blue: 237/255, alpha: 1)
        btn.setTitle("登录", forState: UIControlState.Normal)
        btn.backgroundColor=UIColor(red: 103/255, green: 191/255, blue: 237/255, alpha: 1)
        btn.addTarget(self, action: "denglu", forControlEvents: UIControlEvents.TouchUpInside)
        return btn
        
        }()
    lazy var registerBtn:ZJButton={
        let btn=ZJButton()
        btn.rippleColor = UIColor(red: 103/255, green: 191/255, blue: 237/255, alpha: 1)
        btn.setTitle("注册", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor(red: 103/255, green: 191/255, blue: 237/255, alpha: 1), forState: UIControlState.Normal)
        btn.backgroundColor=UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        btn.addTarget(self, action: "click", forControlEvents: UIControlEvents.TouchUpInside)
        return btn
        
    }()
  
    lazy var centerView:UIView={
        let a=UIView()
        return a
        
        }()
    lazy var QQBtn:UIButton={
        let a=UIButton()
        a.setTitle("企业QQ登录", forState: .Normal)
        return a
        
        }()
    lazy var memorizepassword:UILabel={
        let a=UILabel()
        a.text="记住密码"
        a.textColor=UIColor.init(white:0.9,alpha:0.8)
        return a
        }()
    lazy var findpassword:UILabel={
        let a=UILabel()
        a.text="找回密码"
        a.textColor=UIColor.init(white:0.9,alpha:0.8)
        return a
        }()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = AppColor
        view.addSubview(centerView)
  
        phoneTF.delegate = self
        
        centerView.addSubview(phoneTF)
        phoneTF.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(90)
            make.right.equalTo(-90+24+8)
            make.height.equalTo(50)
        }
        
        let phoneTFleftView:UIImageView=UIImageView(image: UIImage(named: "phone"))
        phoneTFleftView.contentMode=UIViewContentMode.ScaleAspectFit
        centerView.addSubview(phoneTFleftView)
        phoneTFleftView.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(phoneTF).offset(-3)
            make.right.equalTo(phoneTF.snp_left).offset(-8)
            make.width.equalTo(24)
            make.height.equalTo(24)
            
        }
        
        
        passwordTF.delegate = self
        centerView.addSubview(passwordTF)
        passwordTF.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(phoneTF.snp_bottom).offset(8)
            make.left.height.right.equalTo(phoneTF)
        }
        
        let passwordleftView:UIImageView=UIImageView(image: UIImage(named: "password"))
        passwordleftView.contentMode=UIViewContentMode.ScaleAspectFit
        centerView.addSubview(passwordleftView)
        passwordleftView.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(passwordTF).offset(-3)
            make.right.equalTo(passwordTF.snp_left).offset(-8)
            make.width.equalTo(24)
            make.height.equalTo(24)
            
        }
//        let eyeView:UIImageView=UIImageView(image: UIImage(named: "eye"))
//  
//        centerView.addSubview(eyeView)
//        eyeView.snp_makeConstraints { (make) -> Void in
//            make.centerY.equalTo(passwordleftView)
//            make.left.equalTo(passwordTF.snp_right).offset(8)
//            make.width.equalTo(24)
//            make.height.equalTo(16)
//        }

     
        
        
        
        centerView.addSubview(loginBtn)
        loginBtn.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(passwordTF.snp_right)
            make.top.equalTo(passwordTF.snp_bottom).offset(20)
            make.left.equalTo(passwordleftView.snp_left)
            make.height.equalTo(36)
        }
        
        centerView.addSubview(registerBtn)
        registerBtn.snp_makeConstraints { (make) -> Void in
            make.right.left.equalTo(loginBtn)
            make.top.equalTo(loginBtn.snp_bottom).offset(12)
            make.height.equalTo(36)
        }
        
 
//        let contentView = UIView()
//        view.addSubview(contentView)
//        contentView.snp_makeConstraints { (make) -> Void in
//            make.top.equalTo(centerView.snp_bottom).offset(80)
//            make.width.equalTo(1)
//            make.height.equalTo(20)
//            make.left.equalTo(view.frame.width/2)
//        }
//        view.addSubview(QQBtn)
//        QQBtn.snp_makeConstraints { (make) -> Void in
//            make.top.equalTo(contentView.snp_top).offset(-10)
//            make.width.equalTo(120)
//            make.height.equalTo(40)
//            make.right.equalTo(contentView.snp_left).offset(-10)
//        }
//        view.addSubview(registerBtn)
//        registerBtn.snp_makeConstraints { (make) -> Void in
//            make.left.equalTo(contentView.snp_right).offset(10)
//            make.top.equalTo(QQBtn.snp_top)
//            make.width.equalTo(80)
//            make.height.equalTo(40)
//        }
//        let btn = UIButton()
//       
//        btn.setImage(UIImage(named: "RadioButton-Unselected"), forState: UIControlState.Normal)
//        
//        btn.setImage(UIImage(named: "RadioButton-Selected"), forState: UIControlState.Selected)
//        btn.addTarget(self, action: "Click:", forControlEvents: UIControlEvents.TouchUpInside)
//        
//        view.addSubview(memorizepassword)
//        memorizepassword.snp_makeConstraints { (make) -> Void in
//            make.top.equalTo(centerView.snp_bottom).offset(10)
//            make.right.equalTo(-view.frame.width/2-30)
//            make.width.equalTo(80)
//            make.height.equalTo(40)
//        }
//        view.addSubview(btn)
//        btn.snp_makeConstraints { (make) -> Void in
//            make.top.equalTo(memorizepassword.snp_top)
//            make.right.equalTo(memorizepassword.snp_left)
//            make.width.equalTo(50)
//            make.height.equalTo(40)
//        }
//
//        view.addSubview(findpassword)
//        findpassword.snp_makeConstraints { (make) -> Void in
//            make.top.equalTo(btn.snp_top)
//            make.left.equalTo(view.frame.width/2+30)
//            make.width.equalTo(80)
//            make.height.equalTo(40)
//        }
//
        centerView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(140)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(registerBtn.snp_bottom)
            
        }
        
        view.addSubview(logo)
        logo.textAlignment = NSTextAlignment.Center
        logo.snp_makeConstraints { (make) in
            make.top.equalTo(20)
            make.width.height.equalTo(100)
            make.centerX.equalTo(view)
        }
        
        navigationController?.navigationBar.hidden = true
        
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        phoneTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
    }
    
    func Click(sender:UIButton){
        sender.selected = !sender.selected
    }


    func denglu(){
        let str = phoneTF.text
        let password = passwordTF.text
        if(str == nil || str=="")
        {
            SYProgressHUD.ShowFailed("账号不能为空")
        }
//        else if(str?.characters.count != 11)
//        {
//            SYProgressHUD.ShowFailed("账号必须为11位")
//            }
        else {
            
            
            
            MainManager.instance.Login(str!, password: password!) { (successed) -> () in
                if successed {
                    
                    SYProgressHUD.ShowSuccess("登录成功")
                    self.Delay(1.0, block: { 
                        
                        UIApplication.sharedApplication().keyWindow!.rootViewController = SYTabBarViewController()
                    })
                }else{
                    SYProgressHUD.ShowFailed("登录失败")
                }
            }
        }
    }
    func click(){
        presentViewController(RegisterViewController(), animated: true, completion: nil)
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
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        let offset = self.view.frame.size.height - (centerView.frame.origin.y + centerView.frame.size.height + 216 + 50)
        if(offset <= 0){
            UIView .animateWithDuration(0.25, animations: { () -> Void in
                var frame = self.view.frame
                frame.origin.y = offset
                self.view.frame = frame
            })
            
        }
        return true

    }
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        UIView.animateWithDuration(0.25) { () -> Void in
            var frame = self.view.frame
            frame.origin.y = 0.0
            self.view.frame = frame
        }
        return true
    }
    func ONClick(){
//        passwordTF.secureTextEntry=false
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

