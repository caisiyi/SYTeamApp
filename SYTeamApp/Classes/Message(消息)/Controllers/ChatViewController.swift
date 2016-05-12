//
//  ConsultViewController.swift
//  Medical
//
//  Created by 蔡斯仪 on 16/2/2.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit
private let leftCellId = "UUChatLeftMessageCell"
private let rightCellId = "UUChatRightMessageCell"

class ChatViewController: NormalNavViewController,UITableViewDataSource,UITableViewDelegate,ConversationManagerDelegate {
    
    var chatTableView: UITableView!
    var inputBackView: UUInputView!
    var dataModel:[EMMessage]! = []{
        didSet{
            
            var array:[AnyObject] = []
            for i in 0..<dataModel.count {
                if i == 0 {
                array.append(UUChatModel(model: dataModel[i]))
                }else{
                array.append(UUChatModel(preModel: dataModel[i-1],model: dataModel[i]))
                }
            }
            self.dataArray = array
            
        }
    }
    var chatType:EMChatType = EMChatTypeChat
    var dataArray: [AnyObject]! = []{
        didSet{
            dispatch_async(dispatch_get_main_queue()) {
                EMClient.sharedClient().chatManager.getConversation(self.conversationID, type: self.chatType == EMChatTypeChat ? EMConversationTypeChat : EMConversationTypeGroupChat, createIfNotExist: true).markAllMessagesAsRead()
                self.chatTableView.reloadData()
                self.chatTableView.scrollToRowAtIndexPath(NSIndexPath.init(forRow: self.dataArray.count - 1, inSection: 0), atScrollPosition: UITableViewScrollPosition.Top, animated: true)
            }
        }
    }
    var inputViewConstraint: NSLayoutConstraint? = nil
    var conversationID:String!{
        didSet{
            title = conversationID
            ConversationManager.instance.convenienceID = conversationID
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ChatViewController.keyboardFrameChanged(_:)), name: UIKeyboardWillChangeFrameNotification, object: nil)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidAppear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    //TODO: This method seems like would fix the problem of cells layout when Orientation changed.
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        //chatTableView.reloadData()
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor.whiteColor()
        automaticallyAdjustsScrollViewInsets = false
       
        // Do any additional setup after loading the view.

        
        initBaseViews()
        
        
        chatTableView.registerClass(UUChatLeftMessageCell.classForKeyedArchiver(), forCellReuseIdentifier: leftCellId)
        chatTableView.registerClass(UUChatRightMessageCell.classForKeyedArchiver(), forCellReuseIdentifier: rightCellId)
        chatTableView.estimatedRowHeight = 100
        
        
        ConversationManager.instance.delegate = self
       
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "更多"), style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ChatViewController.RrightBarButton))
    }
    func RrightBarButton(){

        if self.chatType == EMChatTypeChat {
            let vc = FriendChatInfoViewController()
            vc.conversationID = self.conversationID
            self.pushVC(vc)
        }else{
            let vc = GroupInfoViewController()
            vc.conversationID = self.conversationID
            self.pushVC(vc)
        }
    }
    func GetMessagesAction(aMessages: AnyObject!) {
        
            let message = aMessages as! EMMessage
            
            self.dataArray.append(UUChatModel(model: message))
            
            //self.reload()
        
    }
  
    func initBaseViews() {
        
        
        inputBackView = UUInputView()
        self.view.addSubview(inputBackView)
        
        // temporary method
        inputViewConstraint = NSLayoutConstraint(
            item: inputBackView,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 0
        )
        inputBackView.snp_makeConstraints { (make) -> Void in
            make.leading.trailing.equalTo(self.view)
        }
        view.addConstraint(inputViewConstraint!)
        inputBackView.sendMessage(
            imageBlock: { [weak self](image:UIImage, textView:UITextView) -> Void in
                let message = ConversationManager.instance.SentMessages(self!.conversationID,type:self!.chatType, Image: image)
                self!.dataModel.append(message)
          
            },
            textBlock: { [weak self](text:String, textView:UITextView) -> Void in
                let message = ConversationManager.instance.SentMessages(self!.conversationID,type:self!.chatType, content: text)
                self!.dataModel.append(message)
              
            },
            voiceBlock: { [weak self](voice:NSData, textView:UITextView) -> Void in
                //self!.reload()
            })
        
        
        
        chatTableView = UITableView.init(frame: CGRectZero, style: .Plain)
        chatTableView.dataSource = self
        chatTableView.delegate = self
        chatTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        chatTableView.keyboardDismissMode = UIScrollViewKeyboardDismissMode.Interactive
        chatTableView.estimatedRowHeight = 60
        self.view.addSubview(chatTableView)
        chatTableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(64)
            make.right.left.equalTo(0)
            make.bottom.equalTo(inputBackView.snp_top)
        }
        //chatTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0)
        
    }
    func reload(){
        dispatch_async(dispatch_get_main_queue()) {
            self.chatTableView.reloadData()
            self.chatTableView.scrollToBottom(animation: true)
        }
    }
    // private method
    
    func backAction(){
        if navigationController?.viewControllers.count>1 {
            self.navigationController?.popViewControllerAnimated(true)
        } else {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @objc func keyboardFrameChanged(notification: NSNotification) {
        
        let dict = NSDictionary(dictionary: notification.userInfo!)
        let keyboardValue = dict.objectForKey(UIKeyboardFrameEndUserInfoKey) as! NSValue
        let bottomDistance = mainScreenSize().height - keyboardValue.CGRectValue().origin.y
        let duration = Double(dict.objectForKey(UIKeyboardAnimationDurationUserInfoKey) as! NSNumber)
        
        UIView.animateWithDuration(duration, animations: {
            self.inputViewConstraint!.constant = -bottomDistance
            self.view.layoutIfNeeded()
            }, completion: {
                (value: Bool) in
                self.chatTableView.scrollToBottom(animation: true)
        })
    }
    
    private func mainScreenSize() -> CGSize {
        return UIScreen.mainScreen().bounds.size
    }
    
    // tableview delegate & dataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let model = dataArray[indexPath.row] as! UUChatModel
        if model.from == .Me {
            let cell:UUChatRightMessageCell = tableView.dequeueReusableCellWithIdentifier(rightCellId) as! UUChatRightMessageCell
            cell.model = model
            return cell
        }
        else {
            let cell:UUChatLeftMessageCell = tableView.dequeueReusableCellWithIdentifier(leftCellId, forIndexPath: indexPath) as! UUChatLeftMessageCell
            cell.model = model
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.view.endEditing(true)
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
