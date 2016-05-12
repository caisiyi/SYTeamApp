//
//  ClearNavViewController.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/3/24.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class ClearNavViewController: UIViewController {

    lazy var rainbowNavigation = RainbowNavigation()
    
    override func viewWillAppear(animated: Bool) {
        if let navController = self.navigationController {
            rainbowNavigation.wireTo(navigationController: navController)
        }
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
//实现方法
extension ClearNavViewController:RainbowColorSource{
    
    func navigationBarOutColor() -> UIColor {
        return UIColor.clearColor()
    }
    func navigationBarInColor() -> UIColor {
        return UIColor.clearColor()
    }
    
}