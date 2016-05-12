//
//  SYAlertViewController.swift
//  SYAlertView
//
//  Created by 蔡斯仪 on 16/3/15.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

typealias SYAlertViewItemsActionBack = (sender:UIButton) -> ()
@objc public protocol SYAlertViewDelegate{
    optional func ClickCancelItem(alertVC:SYAlertViewController)
    optional func ClickChildItem(alertVC:SYAlertViewController,sender:UIButton,index:Int)
}
public class SYAlertViewController: UIViewController {
    
    public weak var delegate:SYAlertViewDelegate?
    
    var itemsWidth = UIScreen.mainScreen().bounds.width
    var itemsHeight:CGFloat = 44
    
    var itemsAction: SYAlertViewItemsActionBack?
    var cancelAction: SYAlertViewItemsActionBack?
    
    var itemsDefalutTitleColor:UIColor = UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 1.0)
    var itemsDefalutBackColor:UIColor = UIColor(white: 0.95, alpha: 1.0)
    
    var isCanDismissByTouchBackgrondView:Bool = true
    private class SYAlertBackgroundView: UIView {
        var touchHandler: ((UIView) -> Void)?
        override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
            touchHandler?(self)
        }
    }
    private var backgroundView: SYAlertBackgroundView {
        let backview = SYAlertBackgroundView()
        backview.backgroundColor = UIColor(white: 0.2, alpha: 0.4)
        backview.frame = view.bounds
        backview.touchHandler = { [weak self] view in
            if  self?.isCanDismissByTouchBackgrondView ?? false {
                self?.dismissViewControllerAnimated(true, completion: nil)
            }
        }
        return backview
    }
    lazy var contentsView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.whiteColor()
        return view
    }()
    lazy var ItemsView:[UIButton] = []
    lazy var cancelItem:UIButton = {
        let button = UIButton()
        button.tag = 0
        button.setTitleColor(UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 1.0), forState: UIControlState.Normal)
        button.setTitle("取消", forState: UIControlState.Normal)
        button.addTarget(self, action: "CancelTouchUpInside:", forControlEvents: UIControlEvents.TouchUpInside)
        return button
    }()
    var cancelItemTopViewHeight:CGFloat = 8
    lazy var cancelItemTopView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1.0)
        return view
    }()
    init(){
        super.init(nibName: nil, bundle: nil)
        defalutInit()
    }
    
    init(items:[String]){
        
        super.init(nibName: nil, bundle: nil)
        defalutInit()
        ItemsView.append(cancelItem)
        items.forEach { (title) -> () in
            addItems(title)
        }
        layoutView()
        
    }
    func getBackView()->UIView{
        return backgroundView
    }
    func defalutInit(){
        view.backgroundColor = UIColor.clearColor()
        modalPresentationStyle = .Custom
        modalTransitionStyle = .CrossDissolve
        transitioningDelegate = self
        view.addSubview(backgroundView)
        view.addSubview(contentsView)
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addItems(title:String){
        
        let index = CGFloat(ItemsView.count)
        let button = SYAlertButton()
        button.tag = Int(index)
        button.backgroundColor = itemsDefalutBackColor
        button.setTitleColor(itemsDefalutTitleColor, forState: UIControlState.Normal)
        button.setTitle(title, forState: UIControlState.Normal)
        button.frame = CGRect(x: UIScreen.mainScreen().bounds.width - itemsWidth, y: ( index - 1 ) * itemsHeight, width: itemsWidth, height: itemsHeight)
        button.addTarget(self, action: "TouchUpInside:", forControlEvents: UIControlEvents.TouchUpInside)
        ItemsView.append(button)
        contentsView.addSubview(button)
        
    }
    internal func addcancelAction(action: SYAlertViewItemsActionBack) {
        self.cancelAction = action
    }
    internal func addItemsAction(action: SYAlertViewItemsActionBack) {
        self.itemsAction = action
    }
    func CancelTouchUpInside(sender:UIButton){
        
        dismissViewControllerAnimated(true, completion: nil)
        delegate?.ClickCancelItem!(self)
        cancelAction?(sender: sender)
    }
    func TouchUpInside(sender:UIButton){
        
        dismissViewControllerAnimated(true, completion: nil)
        delegate?.ClickChildItem!(self, sender: sender, index: sender.tag)
        itemsAction?(sender: sender)
    }
    func layoutView(){
        
        contentsView.addSubview(cancelItemTopView)
        cancelItemTopView.frame = CGRect(x: UIScreen.mainScreen().bounds.width - itemsWidth, y: CGFloat(ItemsView.count - 1) * itemsHeight, width: itemsWidth, height: cancelItemTopViewHeight)
        
        contentsView.addSubview(cancelItem)
        cancelItem.frame = CGRect(x: UIScreen.mainScreen().bounds.width - itemsWidth, y: cancelItemTopView.frame.maxY, width: itemsWidth, height: itemsHeight)
        
        
        contentsView.frame = CGRect(x: 0, y: UIScreen.mainScreen().bounds.height - itemsHeight * CGFloat(ItemsView.count) - cancelItemTopViewHeight, width: UIScreen.mainScreen().bounds.width, height: itemsHeight * CGFloat(ItemsView.count) + cancelItemTopViewHeight)
        
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
}
class SYAlertButton:UIButton{
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        let linelayer = CALayer()
        linelayer.backgroundColor = UIColor(red: 228/255, green: 228/255, blue: 228/255, alpha: 1.0).CGColor
        linelayer.frame = CGRect(x: UIScreen.mainScreen().bounds.width - rect.width, y: rect.height - 1, width: rect.width, height: 1)
        layer.addSublayer(linelayer)
    }
}
/**
 *  SYAlertViewController-UIViewControllerTransitioningDelegate
 */
extension SYAlertViewController:UIViewControllerTransitioningDelegate{
    public func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SYAlertViewControllerDismissAnimation()
    }
    public func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SYAlertViewControllerPresentedAnimation()
    }
}