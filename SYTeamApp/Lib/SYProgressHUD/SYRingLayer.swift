//
//  SYRingLayer.swift
//  SYProgressHUD
//
//  Created by 蔡斯仪 on 16/3/22.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class SYRingLayer: CALayer {
    private let circleLayer = CAShapeLayer()
    private let backgroudLayer = CAGradientLayer()
    private let ringRadius:CGFloat = 26
    private let ringWidth:CGFloat = 4
    override init() {
        super.init()
        defaultInit()
    }
    init(frame:CGRect) {
        super.init()
        self.frame = frame
        defaultInit()
    }
    func defaultInit(){
        setRingAnimation()
        addSublayer(backgroudLayer)
    }
    private func setRingAnimation(){
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0
        animation.toValue = M_PI*320
        animation.duration = 160
        animation.repeatCount = Float(Int.max)
        addAnimation(animation, forKey: "ringAnimation")
    }
    func stopAnimation(){
        speed = 0.0
        timeOffset = convertTime(CACurrentMediaTime(), fromLayer: nil)
    }
    func startAnimation(){
        speed = 1.0;
        beginTime = 0.0
        beginTime = convertTime(CACurrentMediaTime(), fromLayer: nil) - timeOffset
        timeOffset = 0.0
    }
    override func layoutSublayers() {
        
        super.layoutSublayers()
        
        let canvasFrame = CGRectMake(
            (bounds.width - ringRadius * 2) / 2,
            (bounds.height - ringRadius * 2) / 2 ,
            ringRadius * 2,
            ringRadius * 2)
        backgroudLayer.frame = canvasFrame
        backgroudLayer.cornerRadius = ringRadius
        backgroudLayer.colors = [UIColor(white: 0.9, alpha: 1.0).CGColor,UIColor(white: 0.8, alpha: 1.0).CGColor,UIColor(white: 0.7, alpha: 1.0).CGColor]
        backgroudLayer.startPoint = CGPoint(x: 0, y: 0.5)
        backgroudLayer.endPoint = CGPoint(x: 1, y: 0.5)
      
        circleLayer.cornerRadius = ringRadius
        circleLayer.frame = backgroudLayer.bounds
        circleLayer.path = UIBezierPath(arcCenter: CGPoint(x: ringRadius, y: ringRadius), radius: ringRadius  - ringWidth, startAngle: (CGFloat)(-M_PI_2), endAngle: (CGFloat)(M_PI+M_PI_2), clockwise: true).CGPath
        circleLayer.fillColor = UIColor.whiteColor().CGColor
        circleLayer.strokeColor = UIColor.clearColor().CGColor
        circleLayer.lineWidth = 0
        
        backgroudLayer.addSublayer(circleLayer)
        
        
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
