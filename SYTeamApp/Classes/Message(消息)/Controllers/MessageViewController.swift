//
//  MessageViewController.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/4/7.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class MessageViewController: NormalNavViewController {
    var superVC:UIViewController?
    
    lazy var tableView = UITableView()
    var dataModles:[EMConversation] = []{
     
        didSet{
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
 
                self.tableView.reloadData()
               
            })
        }
    }
    var titleHead = ["企业架构","企业公告","客服小咚"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        automaticallyAdjustsScrollViewInsets = false
        //navigationItem.rightBarButtonItem = UIBarButtonItem(title: "添加群组", target: self, action: "AddGroup")
        
        tableView.snp_makeConstraints { (make) -> Void in
            make.left.right.equalTo(0)
            make.top.equalTo(64)
            make.bottom.equalTo(0)
        }
        tableView.emptyDataSetSource  = self
        tableView.emptyDataSetDelegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.registerClass(MessageTableViewCell.self, forCellReuseIdentifier: "MessageTableViewCell")
        tableView.registerClass(MessageTableHeadViewCell.self, forCellReuseIdentifier: "MessageTableHeadViewCell")
        
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension MessageViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 48
        default:
            return 72
        }
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return titleHead.count
        default:
            return dataModles.count
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("MessageTableHeadViewCell") as! MessageTableHeadViewCell
             cell.textLabel?.text = titleHead[indexPath.row]
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("MessageTableViewCell") as! MessageTableViewCell
            cell.model = dataModles[indexPath.row]
            return cell
        }
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 1 {
        let vc = ChatViewController()
        vc.chatType = dataModles[indexPath.row].type == EMConversationTypeChat ? EMChatTypeChat : EMChatTypeGroupChat
        superVC?.pushVC(vc)
        vc.conversationID = dataModles[indexPath.row].conversationId
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! MessageTableViewCell
        vc.title = cell.messageLabel.text
        ConversationManager.instance.GetConversationMessage(dataModles[indexPath.row].conversationId) { (result, error) in
            if result != nil{
                vc.dataModel = result!
            }
        }
        }else{
            switch indexPath.row {
            case 0:
                let vc = ConstructViewController()
                superVC?.pushVC(vc)
            case 1:
                let vc = PublicNoticeViewController()
                superVC?.pushVC(vc)
            default:
                break
            }
            
        }
    }
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if indexPath.section == 1 {
        return true
        }else{
        return false
        }
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        ConversationManager.instance.RemoveConversation(dataModles[indexPath.row].conversationId)
        dataModles.removeAtIndex(indexPath.row)
    }
    
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return  "删除"
    }
 
}
extension MessageViewController:DZNEmptyDataSetSource,DZNEmptyDataSetDelegate {
    func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "会话")!
    }
    func buttonTitleForEmptyDataSet(scrollView: UIScrollView!, forState state: UIControlState) -> NSAttributedString! {
        return
            NSAttributedString(string: "发起会话", attributes: [NSFontAttributeName:UIFont.systemFontOfSize(17)])
    }
    //
    //    func buttonBackgroundImageForEmptyDataSet(scrollView: UIScrollView!, forState state: UIControlState) -> UIImage! {
    //        return UIImage(named: "button_cart_add")!
    //    }
    func emptyDataSetDidTapButton(scrollView: UIScrollView!) {
        superVC?.pushVC(FriendsViewController())
    }
}