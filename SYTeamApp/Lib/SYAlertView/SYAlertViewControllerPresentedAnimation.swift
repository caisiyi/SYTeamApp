//
//  SYAlertViewControllerPresentedAnimation.swift
//  SYAlertView
//
//  Created by 蔡斯仪 on 16/3/14.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

// MARK: - 自定义presented动画的对象
class SYAlertViewControllerPresentedAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.35
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let formVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! SYAlertViewController
        
        let fromView = transitionContext.viewForKey(UITransitionContextToViewKey)
        fromView?.alpha = 0
      
        let animateView = formVC.contentsView
        
        let frame = animateView.frame
        animateView.frame.size.height = 0
        animateView.frame.origin.y = UIScreen.mainScreen().bounds.height
        
        transitionContext.containerView()?.addSubview(fromView!)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
            
            fromView?.alpha = 1
            animateView.frame = frame
            
            }) { (_) -> Void in
                transitionContext.completeTransition(true)
        }
    }
    
    func animationEnded(transitionCompleted: Bool) {
        
    }
}
