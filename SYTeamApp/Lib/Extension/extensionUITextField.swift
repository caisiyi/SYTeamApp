//
//  File.swift
//  Hospital
//
//  Created by 蔡斯仪 on 16/1/27.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

extension UITextField {
    convenience init(placeholder:String,textColor:UIColor,tintColor:UIColor,bgColor:UIColor = UIColor.whiteColor(),font:UIFont = UIFont.systemFontOfSize(15)){
        self.init()
        self.placeholder = placeholder
        self.textColor = textColor
        self.tintColor = tintColor
        self.backgroundColor = bgColor
        self.font = font
        self.setValue(NSNumber(int: 5), forKey: "paddingLeft")//设置textField左边距
        

    }
}
