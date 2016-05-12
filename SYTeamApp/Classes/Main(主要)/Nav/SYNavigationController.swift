//
//  SYNavigationController.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/3/24.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class SYNavigationController: UINavigationController ,UIGestureRecognizerDelegate{
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {// 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
            /* 自动显示和隐藏tabbar */
            viewController.hidesBottomBarWhenPushed = true
            
            /* 设置导航栏上面的内容 */
            
            let backBtn = UIButton(type: UIButtonType.Custom)
            backBtn.addTarget(self, action: "back", forControlEvents: UIControlEvents.TouchUpInside)
            // 设置图片
            backBtn.setBackgroundImage(UIImage(named: "返回"), forState: UIControlState.Normal)
            backBtn.setBackgroundImage(UIImage(named: "返回"), forState: UIControlState.Highlighted)
            // 设置尺寸
            backBtn.frame.size = backBtn.currentBackgroundImage!.size
            
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
            
            self.interactivePopGestureRecognizer?.enabled = true
            self.interactivePopGestureRecognizer?.delegate = self
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    func back(){
        let firstVc = self.viewControllers.first?.isKindOfClass(MessageMainViewController)
        let lastVc = self.viewControllers.last?.isKindOfClass(ChatViewController)
        if  firstVc! && lastVc! {
            viewControllers.forEach({ (vc) in
                if vc.isKindOfClass(MessageMainViewController) {
                    self.popToViewController(vc, animated: true)
                }
            })
        }else{
            self.popViewControllerAnimated(true)
        }
//        self.navigationController?.viewControllers.forEach({ (vc) in
//            if vc.isKindOfClass(MessageMainViewController) {
//                (vc as! MessageMainViewController).AddGroupResult()
//                self.navigationController?.popToViewController(vc, animated: true)
//            }
//        })
    }
    func more(){
        self.popToRootViewControllerAnimated(true)
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
