//
//  ImageTitleButton.swift
//  workReport
//
//  Created by MAC on 16/3/26.
//  Copyright © 2016年 CH. All rights reserved.
//

import UIKit

class ImageTitleButton: UIButton {
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        titleLabel?.textAlignment = NSTextAlignment.Center
    }
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        return CGRect(x: (contentRect.width - 50)/2, y: contentRect.height/2-30, width: 50, height: 50)
    }
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        return CGRect(x: 0, y: contentRect.height - 30, width: contentRect.width, height: 15)
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
