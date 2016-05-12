//
//  MessageMainViewController.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/3/28.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class MessageMainViewController: NormalNavViewController {
    private lazy var navBarSegmentSwitch: AnimatedSegmentSwitch = {
        
        let segmentControl = AnimatedSegmentSwitch()
        
        segmentControl.frame = CGRect(x: 0, y: 0, width:  200.0, height: 30.0)
        segmentControl.autoresizingMask = [.FlexibleWidth]
        
        segmentControl.backgroundColor = UIColor.whiteColor()
        segmentControl.selectedTitleColor = UIColor.whiteColor()
        segmentControl.titleColor = AppColor
        segmentControl.font = UIFont(name: "HelveticaNeue-Medium", size: 13.0)
        
        segmentControl.thumbColor = AppColor
        
        segmentControl.addTarget(self, action: #selector(MessageMainViewController.segmentValueDidChange(_:)), forControlEvents: .ValueChanged)

        segmentControl.items = ["会话", "群组"]
        segmentControl.selectedIndex = 0
        return segmentControl
        
        
    }()
    private var pageMenu:CAPSPageMenu!
    var controllerArray:[UIViewController] = []
    let messageVC = MessageViewController()
    let groupVC = GroupViewController()
    var scrollView  = UIScrollView()
    let leftButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        navigationItem.titleView = navBarSegmentSwitch
        automaticallyAdjustsScrollViewInsets = false

        leftButton.setTitle(" 消息", forState: UIControlState.Normal)
        leftButton.titleLabel?.font = UIFont.boldSystemFontOfSize(14)
        leftButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        leftButton.setTitleColor(UIColor.lightGrayColor(), forState: .Highlighted)
        leftButton.setTitleColor(UIColor.redColor(), forState: .Selected)
        leftButton.sizeToFit()
        leftButton.addTarget(self, action: #selector(MessageMainViewController.GotoPublicNoticeVC), forControlEvents: UIControlEvents.TouchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "加号"), style: UIBarButtonItemStyle.Plain,target: self, action: #selector(MessageMainViewController.AddGroup))
        
      
        messageVC.superVC = self
        controllerArray.append(messageVC)
        groupVC.superVC = self
        controllerArray.append(groupVC)

        let parameters: [CAPSPageMenuOption] = [
            .MenuHeight(0),
            .SelectionIndicatorHeight(0.0),
        ]
        
        // Initialize scroll menu
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0, self.view.frame.width, self.view.frame.height - 49), pageMenuOptions: parameters)
        pageMenu.delegate = self
        pageMenu.controllerScrollView.scrollEnabled = false
        self.view.addSubview(pageMenu!.view)
        ConversationManager.instance.GetConversation { (result, error) in
            if result != nil {
                self.messageVC.dataModles = result!
            }
        }
        DDGroup.loadGroup { (result, error) in
            if result != nil {
              self.groupVC.dataModles = result!
            }
        }
        
      
        // 设置计时器,每60秒获得未读数
        let timer = NSTimer(timeInterval: 1, target: self, selector: #selector(MessageMainViewController.setupUnreadCount), userInfo: nil, repeats: true)
        // 主线程也会抽时间处理一下timer（不管主线程是否正在其他事件
        NSRunLoop.mainRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
        
        
        
//        let query = AVQuery.init(className: "UserList")
//        query.whereKeyExists("userName")
////        query.findObjectsInBackgroundWithBlock { (result, error) in
////            print(result)
////        }
//        let obejct = AVObject(className: "UserList")
//        obejct.setObject("xiaocai2", forKey: "userName")
//        obejct.saveInBackgroundWithBlock { (bool, error) in
//            print(bool)
//        }
     
    }
    func setupUnreadCount(){
        ConversationManager.instance.GetConversation { (result, error) in
            if result != nil {
                if !self.messageVC.tableView.editing {
                self.messageVC.dataModles = result!
                }
            }
        }
        let count =  Int(EMClient.sharedClient().chatManager.getConversation("admin", type: EMConversationTypeChat, createIfNotExist: true).unreadMessagesCount)
        if count != 0 {
           leftButton.selected = true
        }else{
            leftButton.selected = false
        }
        
    }
    func GotoPublicNoticeVC(){
        let vc = SystemMessageViewController()
        pushVC(vc)
    }
    
    func AddGroup(){
        let images =  [("发起会话","conversation_options_addmember"),("加入群组","conversation_options_multichat"),("创建群租","conversation_facetoface_qr")]
        var array:[AnyObject] = []
        images.forEach {  (title,image) in
            let model = XLPopMenuViewModel()
            model.title = title
            model.image = image
            array.append(model)
        }
        // 弹出框的宽度
        let menuViewWidth:CGFloat = 150;
        // 弹出框的左上角起点坐标
        let startPoint = CGPointMake(UIScreen.mainScreen().bounds.size.width - menuViewWidth - 10, 64 + 12);
        XLPopMenuViewSingleton.shareManager().creatPopMenuWithFrame(startPoint, popMenuWidth: menuViewWidth, popMenuItems: array) { (index) in
            if index == 0 {
                self.pushVC(FriendsViewController())
            }
            if index == 2 {
                self.pushVC(NewGroupViewController())
            }
        }
  
        
    }
    func segmentValueDidChange(sender: AnimatedSegmentSwitch){
        pageMenu.moveToPage(sender.selectedIndex)
    }
    
    func changeNavItem(){
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func AddGroupResult(){
        pageMenu.moveToPage(1)
        navBarSegmentSwitch.selectedIndex = 1
        DDGroup.loadGroup { (result, error) in
            if result != nil {
                self.groupVC.dataModles = result!
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension MessageMainViewController:CAPSPageMenuDelegate {
    func didMoveToPage(controller: UIViewController, index: Int) {
        navBarSegmentSwitch.selectedIndex = index
    }
    func willMoveToPage(controller: UIViewController, index: Int) {
        navBarSegmentSwitch.selectedIndex = index
    }
}
