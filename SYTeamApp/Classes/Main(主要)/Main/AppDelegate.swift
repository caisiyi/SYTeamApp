//
//  AppDelegate.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/3/22.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate{

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        UIApplication.sharedApplication().statusBarHidden = false
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
//        EaseSDKHelper.shareHelper().easemobApplication(application, didFinishLaunchingWithOptions: launchOptions, appkey: "csyteam#syteamapp", apnsCertName: "syteam", otherConfig: [kSDKConfigEnableConsoleLogger : NSNumber(bool: true)])
        
        let options = EMOptions(appkey: "csyteam#syteamapp")
        options.apnsCertName = "syteam"
        EMClient.sharedClient().initializeSDKWithOptions(options)
        AVOSCloud.setApplicationId("rxklafWw0mU1S2lxhzaELPf9-gzGzoHsz", clientKey: "nvp3DdrQOCnYRw9DFeY0iEe1")
        
      
     
        // 1.创建窗口
        self.window = UIWindow()
        self.window?.frame = UIScreen.mainScreen().bounds
        
        // 2.显示窗口
        self.window?.makeKeyAndVisible()
        
//        print(
//            EMClient.sharedClient().currentUsername)
        self.window?.switchRootViewController()
        
//        if EMClient.sharedClient().isAutoLogin == true && EMClient.sharedClient().currentUsername != nil {
//            MainManager.instance.AutoLogin({ (successed) in
//                if successed {
//                    UserAccount.LoadUserInfo()
//                    self.window?.rootViewController = SYTabBarViewController()
//                }else{
//                    self.window?.rootViewController = LoginViewController()
//                }
//            })
//        }else{
//            self.window?.rootViewController = LoginViewController()
//        }
//        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AppDelegate.Login), name: "LoginSucceed", object: nil)
        
        return true
    }
  
    func Login(){
//        let vc = SYSlideMenuController(mainViewController:
//            SYNavigationController(rootViewController: MyViewController()), leftMenuViewController: SetupViewController())
       // self.window?.rootViewController = SYTabBarViewController()
    }
    func didReceiveCmdMessages(aCmdMessages: [AnyObject]!) {
        
    }
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        EMClient.sharedClient().applicationDidEnterBackground(application)
    }

    func applicationWillEnterForeground(application: UIApplication) {
        EMClient.sharedClient().applicationWillEnterForeground(application)
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }



}

