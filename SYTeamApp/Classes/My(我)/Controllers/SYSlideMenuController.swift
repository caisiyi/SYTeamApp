//
//  SYSlideMenuController.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/3/24.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class SYSlideMenuController: SlideMenuController {
    
    lazy var rainbowNavigation = RainbowNavigation()
    override func viewDidLoad() {
        super.viewDidLoad()
        SlideMenuOptions.leftViewWidth = WScreen * 0.7
        SlideMenuOptions.opacityViewBackgroundColor = UIColor(white: 0.8, alpha: 1.0)
        view.backgroundColor = UIColor.whiteColor()
        automaticallyAdjustsScrollViewInsets = false
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        navigationController?.navigationBarHidden = true
    }
    override func viewWillDisappear(animated: Bool) {
        navigationController?.navigationBarHidden = false
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
extension SYSlideMenuController:RainbowColorSource{
    
    func navigationBarOutColor() -> UIColor {
        return AppColor
    }
    func navigationBarInColor() -> UIColor {
        return UIColor.clearColor()
    }
}