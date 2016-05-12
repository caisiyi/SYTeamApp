//
//  extensionLabel.swift
//  hongpatu
//
//  Created by 蔡斯仪 on 15/9/4.
//  Copyright (c) 2015年 caisiyi. All rights reserved.
//

import UIKit
enum sizeToFitStyle {
    case Width
    case Height
}
extension UILabel{
 
    convenience init(textColor: UIColor, fontSize: CGFloat)
    {
        self.init()
        self.numberOfLines = 0
        self.textColor = textColor
        self.font = UIFont.systemFontOfSize(fontSize)
    }
    convenience init(text:String,textColor: UIColor, fontSize: CGFloat)
    {
        self.init()
        self.text = text
        self.numberOfLines = 0
        self.textColor = textColor
        self.font = UIFont.systemFontOfSize(fontSize)
        self.sizeThatFits(CGSize.init(width: 0, height: fontSize))
        self.sizeToFit()
    }
    convenience init(textColor: UIColor, font: UIFont)
    {
        self.init()
        self.numberOfLines = 0
        self.textColor = textColor
        self.font = font
    }
    func setSizetoFit(style:sizeToFitStyle){
        if style == sizeToFitStyle.Height {
            self.sizeThatFits(CGSize.init(width: self.frame.width, height: 0))
            self.sizeToFit()
        }else{
            self.sizeThatFits(CGSize.init(width: 0, height: self.frame.height))
            self.sizeToFit()
        }
    }
    //多种样式标签视图
    func setUILabelwithMoreStyle(headtitle:String,foottitle:String,headcolor:UIColor?,footcolor:UIColor?,headfont:UIFont?,footfont:UIFont?){
        var headstring = String()
        headstring = headtitle
        let number = NSString(string: headtitle).length
        let totalstring  = headstring + foottitle
        let totalnumber = NSString(string: totalstring).length
        let string:NSMutableAttributedString = NSMutableAttributedString(string: totalstring)
        if headcolor != nil{
            //  string.addAttribute(NSFontAttributeName, value: UIFont(name: "Arial-BoldItalicMT", size: 20.0)!, range: NSMakeRange(0, number))//改变字体
            string.addAttribute(NSForegroundColorAttributeName, value: headcolor!, range: NSMakeRange(0, number))//改变颜色
        }
        if footcolor != nil{
            //    string.addAttribute(NSFontAttributeName, value: UIFont(name: "Arial-BoldItalicMT", size: 20.0)!, range: NSMakeRange(0, number))//改变字体
            string.addAttribute(NSForegroundColorAttributeName, value: footcolor!, range: NSMakeRange(number, totalnumber - number))//改变颜色
        }
        self.attributedText = string
    }
    
}
