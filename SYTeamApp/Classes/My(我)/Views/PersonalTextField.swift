//
//  PersonalTextField.swift
//  SYTeamApp
//
//  Created by MAC on 16/4/15.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

import UIKit

class PersonalTextField: UITextField ,UITextFieldDelegate{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        tintColor = AppColor
    }
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        
        return CGRectMake(bounds.origin.x+20, bounds.origin.y, bounds.size.width-10, bounds.size.height)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectMake(bounds.origin.x+20, bounds.origin.y, bounds.size.width-10, bounds.size.height)
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
