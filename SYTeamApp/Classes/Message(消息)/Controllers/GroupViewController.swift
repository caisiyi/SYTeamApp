//
//  GroupViewController.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/3/25.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class GroupViewController: NormalNavViewController {
    var superVC:UIViewController?
    lazy var tableView = UITableView()
    var dataModles:[DDGroup] = []{
        didSet{
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
            })
        }
    }
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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.registerClass(GroupTableViewCell.self, forCellReuseIdentifier: "GroupTableViewCell")
        
    
    }
  
    func AddGroup(){
        GroupManager.instance.CreatGroup("企业群组大号22", description: "欢迎热烈讨论22") { (result, error) -> () in
            if result != nil {
                
                //  self.dataModles.insert(result!, atIndex: 0)
                
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension GroupViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModles.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GroupTableViewCell") as! GroupTableViewCell
        cell.model = dataModles[indexPath.row]
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //GroupManager.instance.FetchGroupInfo(dataModles[indexPath.row])
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        let vc = ChatViewController()
        
        superVC?.pushVC(vc)
        vc.conversationID = dataModles[indexPath.row].emGroup!.groupId
        vc.chatType = EMChatTypeGroupChat
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! GroupTableViewCell
        vc.title = cell.groupNameLabel.text
        ConversationManager.instance.GetConversationMessage(dataModles[indexPath.row].emGroup!.groupId, type: EMConversationTypeGroupChat) { (result, error) in
            if result != nil{
                vc.dataModel = result!
            }
        }
    }
}
