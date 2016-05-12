//
//  UUViewsCategory.swift
//  UUChatTableViewSwift
//
//  Created by 杨志平 on 11/24/15.
//  Copyright © 2015 XcodeYang. All rights reserved.
//

import UIKit


// find VC
extension UIView {
    
    func responderViewController() -> UIViewController {
        var responder: UIResponder! = nil
        for var next = self.superview; (next != nil); next = next!.superview {
            responder = next?.nextResponder()
            if (responder!.isKindOfClass(UIViewController)){
                return (responder as! UIViewController)
            }
        }
        return (responder as! UIViewController)
    }
}


extension UIScrollView {
    
    func scrollToBottom(animation animation:Bool) {
        let visibleBottomRect = CGRectMake(0, contentSize.height-bounds.size.height, 1, bounds.size.height)
        UIView.animateWithDuration(animation ? 0.2 : 0.01) { () -> Void in
            self.scrollRectToVisible(visibleBottomRect, animated: true)
        }
    }
}