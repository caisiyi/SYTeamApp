//
//  MainManager.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/3/24.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

private var MainInstance = MainManager()
class MainManager: NSObject,EMClientDelegate,EMChatManagerDelegate{
    class var instance:MainManager{
        return MainInstance
    }
    var isLoginSuccess:Bool = false
    override init() {
        super.init()
        EMClient.sharedClient().chatManager.addDelegate(self, delegateQueue: nil)
        EMClient.sharedClient().addDelegate(self, delegateQueue: nil)
    }   
    func Register(username:String,password:String,completion:(successed:Bool)->()){
        EMClient.sharedClient().registerWithUsername(username, password: password)
    }
    func Login(username:String,password:String,completion:(successed:Bool)->()){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in

            let error = EMClient.sharedClient().loginWithUsername(username, password: password)
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                if error == nil {
                    EMClient.sharedClient().options.isAutoLogin = true
//                    let user =  UserAccount.mj_objectWithKeyValues(["nickname":username,"password":password,"name":username,"sex":"男"])
                    UserAccount.shareUser.password = password
                    UserAccount.shareUser.nickname = username
                    UserAccount.shareUser.name = username
                    UserAccount.shareUser.sex = "男"
                    UserAccount.shareUser.saveUserAccount()
                    UserAccount.LoadUserInfo()
                    completion(successed: true)
                    self.finishLogin()
                }else{
                    completion(successed: false)
                }
            }
        }

    }
    func AutoLogin(completion:(successed:Bool)->()){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            let error = EMClient.sharedClient().loginWithUsername(UserAccount.shareUser.name!, password: UserAccount.shareUser.password!)
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                if error == nil {
                    completion(successed: true)
                }else{
                    completion(successed: false)
                }
            }
        }
    }
    private func finishLogin(){
        
        NSNotificationCenter.defaultCenter().postNotificationName("LoginSucceed", object: nil)
        isLoginSuccess = true

    }
    class func LoginSuccessBlock(completion:()->()){
        RACObserve(MainManager.instance, keyPath: "isLoginSuccess").filter { (bool) -> Bool in
            let isLoginSuccess = bool as? Bool
            if isLoginSuccess != nil && isLoginSuccess! {
                return true
            }else{
                return false
            }
            }.subscribeNext { (_) -> Void in
               completion()
        }
    }
    
    func didReceiveMessages(aMessages: [AnyObject]!) {
        aMessages.forEach { (message) in
            let message = message as! EMMessage
            if message.body.type == EMMessageBodyTypeText {
                let body = message.body as! EMTextMessageBody
                NSNotificationCenter.defaultCenter().postNotificationName("didReceiveMessages", object: nil, userInfo: ["Messages" : aMessages])
            }
        }
    }
    func didReceiveCmdMessages(aCmdMessages: [AnyObject]!) {
        aCmdMessages.forEach { (message) in
            let message = message as! EMMessage
            if message.body.type == EMMessageBodyTypeText {
                let body = message.body as! EMTextMessageBody
            
            }
        }
    }
  
    func didReceiveOfflineMessages(offlineMessages: [AnyObject]!) {
        offlineMessages.forEach { (message) in
            let message = message as! EMMessage
            if message.body.type == EMMessageBodyTypeText {
                let body = message.body as! EMTextMessageBody
             
            }
        }
    }
//    func didReceiveMessage(message: EMMessage!) {
//        print(message)
//    }
}
