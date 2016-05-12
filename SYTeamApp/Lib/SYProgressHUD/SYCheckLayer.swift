//
//  SYCheckLayer.swift
//  SYProgressHUD
//
//  Created by 蔡斯仪 on 16/3/22.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class SYCheckLayer: CALayer {
    
    private let checkHeight:CGFloat = 40
    private let checkWidth:CGFloat = 60
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
            (frame.width - checkWidth) / 2,
            (frame.height - checkHeight) / 2 ,
            checkWidth,
            checkHeight)
        lineLayer.frame = canvasFrame
        
    }
    func drawCheck(completion: (() -> Void)?) {
        
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(0, checkHeight/2))
        path.addLineToPoint(CGPointMake(checkWidth/3, 0))
        path.addLineToPoint(CGPointMake(checkWidth, checkHeight))
        lineLayer.geometryFlipped = true
        lineLayer.path = path.CGPath
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
