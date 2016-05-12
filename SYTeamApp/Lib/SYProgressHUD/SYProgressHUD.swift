//
//  SYProgressHUD.swift
//  SYProgressHUD
//
//  Created by 蔡斯仪 on 16/3/22.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

public class SYProgressHUD: NSObject {
    
    private var hudWidth:CGFloat = 160
    private var hudHeight:CGFloat = 100
    private var spacing:CGFloat = 12
    private static let sharedObject = SYProgressHUD()
    private let backgroutView = UIView()
    private var contentView = UIView()
    private var durationTime:Double = 0.25
    private var isAutoClear:Bool = true
    private var isEnabled:Bool = true
    private var autoClearTime:Double = 1.5
    private var superView = UIApplication.sharedApplication().keyWindow!
    private var contentLayer:CALayer?
    private var contentMessageLabel:UILabel?
    private var tag:Int = 0
    
    override init() {
        super.init()
        setContentView()
        setContentMessageLabel()
    }
    private func setContentView(){
        var originX: CGFloat, originY: CGFloat
        if (UIDevice.currentDevice().systemVersion as NSString).floatValue >= 8.0 {
            originX = (superView.bounds.width - hudWidth) / 2
            originY = (superView.bounds.height - hudHeight) / 2
        } else {
            let isLandscape = UIDevice.currentDevice().orientation.isLandscape
            originX = ((isLandscape ? superView.bounds.height : superView.bounds.width) - hudWidth) / 2
            originY = ((isLandscape ? superView.bounds.width : superView.bounds.height) - hudHeight) / 2
        }
        let contentFrame = CGRectMake(
            originX,
            originY,
            hudWidth,
            hudHeight)
        contentView.layer.cornerRadius = 30
        contentView.layer.masksToBounds = true
        contentView.frame = contentFrame
        contentView.alpha = 0
        
        var blurView: UIView
        if #available(iOS 8.0, *) {
            blurView = UIVisualEffectView(effect: UIBlurEffect(style: .ExtraLight))
        } else {
            blurView = UIView()
            blurView.backgroundColor = UIColor(white: 1, alpha: 0.8)
        }
        blurView.frame = contentView.bounds
        contentView.insertSubview(blurView, atIndex: 0)
    }
    private func setContentMessageLabel(){
        contentMessageLabel = UILabel()
        contentMessageLabel?.textColor = UIColor.darkTextColor()
        contentMessageLabel?.font = UIFont.systemFontOfSize(13)
        contentMessageLabel?.textAlignment = NSTextAlignment.Center
        contentMessageLabel?.frame = CGRect(x: 0, y: contentView.bounds.height - 13 - spacing, width: contentView.bounds.width, height: 13)
        contentMessageLabel?.alpha = 0
    }
    public static func ShowLoading(message:String? = nil) {
        SYProgressHUD.sharedObject.showLoadingContent(message: message)
    }
    public static func ShowSuccess(message:String? = nil) {
        SYProgressHUD.sharedObject.showSuccessContent(message: message)
    }
    public static func ShowFailed(message:String? = nil) {
        SYProgressHUD.sharedObject.showFailedContent(message: message)
    }
    public static func Clear() {
        SYProgressHUD.sharedObject.clear()
    }
    private func showLoadingContent(message message: String?) {
        forcecClear()
        superView.addSubview(contentView)
        if let message = message {
            contentLayer = SYRingLayer()
            contentLayer?.frame = CGRect(x: 0, y: spacing, width: contentView.bounds.width, height: contentView.bounds.height - 2 * spacing - (contentMessageLabel?.frame.height ?? 0))
            contentMessageLabel?.text = message
            contentView.addSubview(contentMessageLabel!)
        }else{
            contentLayer = SYRingLayer(frame: contentView.bounds)
        }
        contentView.layer.addSublayer(contentLayer!)
        showContentView { (tag) -> () in
            self.showContentMessageLabel()
            self.delay(0, block: { () -> () in
                if self.isAutoClear {
                    self.delay(self.autoClearTime, block: { () -> () in
                        if tag == self.tag{
                            self.clear()
                        }
                    })
                }
            })
        }
    }
    private func showSuccessContent(message message: String?) {
        forcecClear()
        superView.addSubview(contentView)
        if let message = message {
            contentLayer = SYCheckLayer(frame: CGRect(x: 0, y: spacing, width: contentView.bounds.width, height: contentView.bounds.height - 2 * spacing - (contentMessageLabel?.frame.height ?? 0)))
            contentMessageLabel?.text = message
            contentView.addSubview(contentMessageLabel!)
        }else{
            contentLayer = SYCheckLayer(frame: contentView.bounds)
        }
        contentView.layer.addSublayer(contentLayer!)
        showContentView { (tag) -> () in
            self.showContentMessageLabel()
            (self.contentLayer as! SYCheckLayer).drawCheck({ () -> Void in
                if self.isAutoClear {
                    self.delay(self.autoClearTime, block: { () -> () in
                        if tag == self.tag{
                            self.clear()
                        }
                    })
                }
            })
        }
    }
    private func showFailedContent(message message: String?) {
        forcecClear()
        superView.addSubview(contentView)
        if let message = message {
            contentLayer = SYForkLayer(frame: CGRect(x: 0, y: spacing, width: contentView.bounds.width, height: contentView.bounds.height - 2 * spacing - (contentMessageLabel?.frame.height ?? 0)))
            contentMessageLabel?.text = message
            contentView.addSubview(contentMessageLabel!)
        }else{
            contentLayer = SYForkLayer(frame: contentView.bounds)
        }
        contentView.layer.addSublayer(contentLayer!)
        showContentView { (tag) -> () in
            self.showContentMessageLabel()
            (self.contentLayer as! SYForkLayer).drawFork({ () -> Void in
                if self.isAutoClear {
                    self.delay(self.autoClearTime, block: { () -> () in
                        if tag == self.tag{
                            self.clear()
                        }
                    })
                }
            })
        }
    }
    private func clear() {
        UIView.animateWithDuration(durationTime, animations: { () -> Void in
            self.contentView.alpha = 0
            }) { (result: Bool) -> Void in
                self.contentLayer?.removeFromSuperlayer()
                self.contentMessageLabel?.removeFromSuperview()
                self.contentView.removeFromSuperview()
        }
    }
    private func showContentView(completion:(tag:Int)->()){
        UIView.animateWithDuration(durationTime, animations: { () -> Void in
            self.contentView.alpha = 1
            }) { (result: Bool) -> Void in
                completion(tag: self.tag)
        }
        self.tag += 1
    }
    private func showContentMessageLabel(){
        guard contentMessageLabel != nil else{
            return
        }
        UIView.animateWithDuration(durationTime, animations: { () -> Void in
            self.contentMessageLabel?.alpha = 1
            }) { (result: Bool) -> Void in
        }
    }
    private func forcecClear(){
        contentMessageLabel?.alpha = 0
        contentView.alpha = 0
        contentLayer?.removeFromSuperlayer()
        contentMessageLabel?.removeFromSuperview()
        contentView.removeFromSuperview()
    }
    
    private func delay(time:Double = 1.5,block:()->()){
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(time * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            block()
        }
    }
}
