//
//  extension.swift
//  hongpatu
//
//  Created by 蔡斯仪 on 15/9/4.
//  Copyright (c) 2015年 caisiyi. All rights reserved.
//


import UIKit


extension UIButton{
    convenience init(btnImage:UIImage,bgColor: UIColor  = UIColor.clearColor(),frame:CGRect = CGRectZero){
        self.init()
        self.frame = frame
        self.backgroundColor = bgColor
        self.setImage(btnImage, forState: UIControlState.Normal)
    }
    convenience init(bgColor: UIColor = UIColor.clearColor(),text:String,textColor: UIColor, fontSize: CGFloat,frame:CGRect = CGRectZero)
    {
        self.init()
        self.frame = frame
        self.backgroundColor = bgColor
        self.setTitle(text, forState: UIControlState.Normal)
        self.setTitleColor(textColor, forState: UIControlState.Normal)
        self.titleLabel?.font = UIFont.systemFontOfSize(fontSize)
        self.titleLabel?.textAlignment = NSTextAlignment.Center
        
    }
    convenience init(image:UIImage,bgColor: UIColor  = UIColor.clearColor(),text:String,textColor: UIColor, fontSize: CGFloat,frame:CGRect = CGRectZero)
    {
        self.init()
        self.frame = frame
        self.backgroundColor = bgColor
        self.setImage(image, forState: UIControlState.Normal)
        self.setTitle(text, forState: UIControlState.Normal)
        self.setTitleColor(textColor, forState: UIControlState.Normal)
        self.titleLabel?.font = UIFont.systemFontOfSize(fontSize)
        self.titleLabel?.textAlignment = NSTextAlignment.Center
    }
    convenience init(image:UIImage,bgColor: UIColor  = UIColor.clearColor()){
        self.init()
        self.backgroundColor = bgColor
        self.setImage(image, forState: UIControlState.Normal)
    }
    //调整按钮内容位置
    func centerLabelVerticallyWithPadding(spacing:CGFloat = 0) {
        // update positioning of image and title
        let imageSize = self.imageView!.frame.size
        self.titleEdgeInsets = UIEdgeInsets(top:13,
                left:-imageSize.width,
                bottom:-(imageSize.height + spacing),
                right:0)
        let titleSize = self.titleLabel!.frame.size
        self.imageEdgeInsets = UIEdgeInsets(top:-(titleSize.height + spacing),
                left:0,
                bottom: 0,
                right:-titleSize.width)
            
        // reset contentInset, so intrinsicContentSize() is still accurate
        let trueContentSize = CGRectUnion(self.titleLabel!.frame, self.imageView!.frame).size
        let oldContentSize = self.intrinsicContentSize()
        let heightDelta = trueContentSize.height - oldContentSize.height
        let widthDelta = trueContentSize.width - oldContentSize.width
        self.contentEdgeInsets = UIEdgeInsets(top:heightDelta/2.0,
        left:widthDelta/2.0,
        bottom:heightDelta/2.0,
        right:widthDelta/2.0)
    }
    
    
}




extension UIBarButtonItem {
    convenience init(imageName:String,highImageName:String,target:AnyObject,action:Selector = Selector("backByPop")) {
        self.init()
        let itemButton:UIButton = UIButton()
        itemButton.setBackgroundImage(UIImage(named: imageName), forState: UIControlState.Normal)
        itemButton.setBackgroundImage(UIImage(named: highImageName), forState: UIControlState.Highlighted)
        itemButton.frame.size = itemButton.currentBackgroundImage!.size
        itemButton.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        self.customView = itemButton
    }
    convenience init(title:String,target:AnyObject,action:Selector = Selector("backByPop")) {
        self.init()
        let itemButton:UIButton = UIButton(type: UIButtonType.Custom)
        itemButton.setTitle(title, forState: UIControlState.Normal)
        itemButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        itemButton.titleLabel?.font = UIFont.systemFontOfSize(16)
        itemButton.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Highlighted)
        itemButton.frame.size = CGSize(width: 50, height: 30)
        itemButton.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        self.customView = itemButton
    }
    
}

