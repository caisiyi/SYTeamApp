//
//  UIViewController+Extension.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/5/14.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

extension  UIViewController {

    func Delay(time:Double = 1.5,block:()->()){
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(time * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            block()
        }
    }
    


}
