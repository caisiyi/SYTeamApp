//
//  PublicNoticeViewController.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/4/9.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class SystemMessageViewController: NormalNavViewController,ConversationManagerDelegate {
    var dataModles:[EMMessage] = []{
        didSet{
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                EMClient.sharedClient().chatManager.getConversation("admin", type: EMConversationTypeChat, createIfNotExist: true).markAllMessagesAsRead()
                self.tableView.reloadData()
            })
        }
    }
    lazy var tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "消息"
        
        view.backgroundColor = UIColor.whiteColor()
        view.addSubview(tableView)
        automaticallyAdjustsScrollViewInsets = false
        //navigationItem.rightBarButtonItem = UIBarButtonItem(title: "添加群组", target: self, action: "AddGroup")
        
        tableView.snp_makeConstraints { (make) -> Void in
            make.left.right.equalTo(0)
            make.top.equalTo(64)
            make.bottom.equalTo(0)
        }
        tableView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        tableView.emptyDataSetSource  = self
        tableView.emptyDataSetDelegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.registerClass(PublicNoticeImageTableViewCell.self, forCellReuseIdentifier: "PublicNoticeImageTableViewCell")
        tableView.registerClass(PublicNoticeTextTableViewCell.self, forCellReuseIdentifier: "PublicNoticeTextTableViewCell")
        // Do any additional setup after loading the view.
        ConversationManager.instance.GetAdminConversationMessage { (result, error) in
            if result != nil {
                self.dataModles = result!
            }
        }
        ConversationManager.instance.convenienceID = "admin"
        ConversationManager.instance.delegate = self
    }
    func GetMessagesAction(aMessages: AnyObject!) {
        let message = aMessages as! EMMessage
        self.dataModles.insert(message, atIndex: 0)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
extension SystemMessageViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModles.count
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let model = dataModles[indexPath.row]
        if model.body.type == EMMessageBodyTypeText {
            return 160
        }else{
            return (view.frame.width - 30 - 20)/16*9 + 90
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let model = dataModles[indexPath.row]
        if model.body.type == EMMessageBodyTypeText {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("PublicNoticeTextTableViewCell") as! PublicNoticeTextTableViewCell
            cell.model = model
            return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("PublicNoticeImageTableViewCell") as! PublicNoticeImageTableViewCell
            cell.model = model
            return cell
        }
        
        
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //GroupManager.instance.FetchGroupInfo(dataModles[indexPath.row])
        
    }
}
extension SystemMessageViewController:DZNEmptyDataSetSource,DZNEmptyDataSetDelegate {
    func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "会话")!
    }
    func buttonTitleForEmptyDataSet(scrollView: UIScrollView!, forState state: UIControlState) -> NSAttributedString! {
        return
            NSAttributedString(string: "暂无系统消息", attributes: [NSFontAttributeName:UIFont.systemFontOfSize(17)])
    }
    //
    //    func buttonBackgroundImageForEmptyDataSet(scrollView: UIScrollView!, forState state: UIControlState) -> UIImage! {
    //        return UIImage(named: "button_cart_add")!
    //    }
    func emptyDataSetDidTapButton(scrollView: UIScrollView!) {
        
    }
}