//
//  WBTabBarViewController.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/3/24.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class SYTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始化子控制器
        //let home = HomeViewController()
        //self.addChildVc(home, title: "首页", image: "tabbar_home", selectedImage: "tabbar_home_selected")
        
        let message = MessageMainViewController()
        self.addChildVc(message, title: "消息", image: "tabbar_message_center", selectedImage: "tabbar_message_center_selected")
        
        //let CRM = CRMViewController()
        //self.addChildVc(CRM, title: "CRM", image: "tabbar_message_center", selectedImage: "tabbar_message_center_selected")
        
        let office = OfficeViewController()
        self.addChildVc(office, title: "办公", image: "tabbar_discover", selectedImage: "tabbar_discover_selected")
        
        let my = MyViewController()
        self.addChildVc(my, title: "我", image: "tabbar_profile", selectedImage: "tabbar_profile_selected")
        
        

        // 设置计时器,每60秒获得未读数
        let timer = NSTimer(timeInterval: 10, target: self, selector: "setupUnreadCount", userInfo: nil, repeats: true)
        // 主线程也会抽时间处理一下timer（不管主线程是否正在其他事件
        NSRunLoop.mainRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
        // Do any additional setup after loading the view.
    }
    func setupUnreadCount(){
      
    }
   
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     *  添加一个子控制器
     *
     *  @param childVc       子控制器
     *  @param title         标题
     *  @param image         图片
     *  @param selectedImage 选中的图片
     */
    func addChildVc(childVc:UIViewController,title:String,image:String,selectedImage:String){
        
        // 设置子控制器的文字
        childVc.title = title // 同时设置tabbar和navigationBar的文字
        //    childVc.tabBarItem.title = title // 设置tabbar的文字
        //    childVc.navigationItem.title = title // 设置navigationBar的文字
        
        // 设置子控制器图片
        childVc.tabBarItem.image = UIImage(named: image)
        childVc.tabBarItem.selectedImage = UIImage(named: selectedImage)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        
        // 设置文字的样式
        let textAttrs = [NSForegroundColorAttributeName:UIColor(r: 123, g: 123, b: 123)]
        let selectTextAttrs = [NSForegroundColorAttributeName:AppColor]
        
        childVc.tabBarItem.setTitleTextAttributes(textAttrs, forState: UIControlState.Normal)
        childVc.tabBarItem.setTitleTextAttributes(selectTextAttrs, forState: UIControlState.Selected)
        
        childVc.view.backgroundColor = UIColor.whiteColor()
        
        let nav = SYNavigationController(rootViewController: childVc)
        
        if childVc.isKindOfClass(OfficeViewController){
            nav.navigationBar.df_setStatusBarMaskColor(UIColor.clearColor())
            nav.navigationBar.df_setBackgroundColor(UIColor.clearColor())
        }else{
            nav.navigationBar.df_setStatusBarMaskColor(UIColor.clearColor())
            nav.navigationBar.df_setBackgroundColor(AppColor)
        }
        
        //改变title颜色
        nav.navigationBar.tintColor = UIColor.whiteColor()
        nav.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(),
                                                 NSFontAttributeName : UIFont.boldSystemFontOfSize(18)]
         // 添加为子控制器
        self.addChildViewController(nav)
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
