//
//  SYForkLayer.swift
//  SYProgressHUD
//
//  Created by 蔡斯仪 on 16/3/22.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class SYForkLayer: CALayer {
    
    private let forkHeight:CGFloat = 30
    private let forkWidth:CGFloat = 30
    private let lineLayer = CAShapeLayer()
    override init() {
        super.init()
        defaultInit()
    }
    init(frame:CGRect) {
        super.init()
        self.frame = frame
        defaultInit()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func defaultInit(){
        lineLayer.fillColor = UIColor.clearColor().CGColor
        lineLayer.anchorPoint = CGPointMake(0, 0)
        lineLayer.lineJoin = kCALineJoinRound
        lineLayer.lineCap = kCALineCapRound
        lineLayer.contentsScale = contentsScale
        lineLayer.lineWidth = 2
        lineLayer.strokeColor = UIColor.blackColor().CGColor
        addSublayer(lineLayer)
    }
    override func layoutSublayers() {
        super.layoutSublayers()
        
        
        let canvasFrame = CGRectMake(
            (frame.width - forkWidth) / 2,
            (frame.height - forkHeight) / 2 ,
            forkWidth,
            forkHeight)
        lineLayer.frame = canvasFrame
        
    }
    func drawFork(completion: (() -> Void)?) {
        let paths = UIBezierPath()
        
        let leftToRightpath = UIBezierPath()
        leftToRightpath.moveToPoint(CGPointMake(0, forkHeight))
        leftToRightpath.addLineToPoint(CGPointMake(forkWidth, 0))
        paths.appendPath(leftToRightpath)
        
        let rightToLeftpath = UIBezierPath()
        rightToLeftpath.moveToPoint(CGPointMake(forkWidth, forkHeight))
        rightToLeftpath.addLineToPoint(CGPointMake(0, 0))
        paths.appendPath(rightToLeftpath)
        
        lineLayer.geometryFlipped = true
        lineLayer.path = paths.CGPath
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = 0.25
        pathAnimation.fromValue = NSNumber(float: 0)
        pathAnimation.toValue = NSNumber(float: 1)
        CATransaction.begin()
        if let completion = completion {
            CATransaction.setCompletionBlock(completion)
        }
        lineLayer.addAnimation(pathAnimation, forKey:"strokeEndAnimation")
        CATransaction.commit()
        
    }

}
