//
//  UIWindow+Extension.swift
//  Weibo
//
//  Created by 蔡斯仪 on 16/2/24.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

extension UIWindow {
    
    func switchRootViewController(){
        let bool = EMClient.sharedClient().isAutoLogin == true && EMClient.sharedClient().currentUsername != nil
      
        self.rootViewController = isNewVersion() ? LoginViewController() : bool ? SYWelcomeViewController() : LoginViewController()
    }
    
    /**
    是否是新版本
    
    - returns: 返回true则表示当前版本是新版本
    */
    private func isNewVersion() -> Bool {
        
        // 版本key
        let versionKey = kCFBundleVersionKey as String
        
        // 获取当前应用版本号
        let currentVersion = NSBundle.mainBundle().infoDictionary![versionKey] as? NSString
        
        // 获取沙盒中的版本号
        let sandBoxVersion = NSUserDefaults.standardUserDefaults().valueForKey(versionKey) as? NSString
        
        // 存储当前版本到沙盒
        NSUserDefaults.standardUserDefaults().setValue(currentVersion, forKey: versionKey)
        
        return currentVersion?.doubleValue > sandBoxVersion?.doubleValue
        
    }
    
}