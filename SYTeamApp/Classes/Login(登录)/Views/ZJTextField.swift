//
//  ZJTextField.swift
//  Login_Demo
//
//  Created by MAC on 16/4/7.
//  Copyright © 2016年 MAC. All rights reserved.
//

import UIKit

class ZJTextField: UITextField,UITextFieldDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor=UIColor.init(white:0.5,alpha:0.4)
        
        self.borderStyle=UITextBorderStyle.RoundedRect
        self.clearButtonMode=UITextFieldViewMode.Always
        self.keyboardAppearance=UIKeyboardAppearance.Default
       
        self .setValue(UIColor .init(white:0.9,alpha:0.8), forKeyPath: "_placeholderLabel.textColor")
        self.textColor=UIColor.whiteColor()
        self.layer.cornerRadius=30
        self.tintColor=UIColor.whiteColor()
       self.delegate = self
        
    }
    
    override func clearButtonRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectMake(bounds.origin.x + bounds.size.width-100, bounds.origin.y + bounds.size.height-35, 16, 16)
    }
    override func placeholderRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectMake(bounds.origin.x+100, bounds.origin.y, bounds.size.width-10, bounds.size.height)
    }
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectMake(bounds.origin.x+60, bounds.origin.y, bounds.size.width-10, bounds.size.height)
    }
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectMake(bounds.origin.x+60, bounds.origin.y, bounds.size.width-10, bounds.size.height)
    }
    override func leftViewRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectMake(bounds.origin.x+10, bounds.origin.y+10, 40, 40)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
