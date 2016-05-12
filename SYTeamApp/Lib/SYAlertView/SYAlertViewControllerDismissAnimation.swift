//
//  SYAlertViewControllerDismissAnimation.swift
//  SYAlertView
//
//  Created by 蔡斯仪 on 16/3/14.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

// MARK: - 自定义dismiss动画的对象
class SYAlertViewControllerDismissAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.35
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let formVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! SYAlertViewController
    
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
        
        let animateView = formVC.contentsView
       
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
            
                fromView?.alpha = 0
            
                animateView.frame.size.height = 0
        
                animateView.frame.origin.y = UIScreen.mainScreen().bounds.height
            
            }) { (_) -> Void in
                
                transitionContext.completeTransition(true)
        }
    }
    
    func animationEnded(transitionCompleted: Bool) {
        
    }
}
