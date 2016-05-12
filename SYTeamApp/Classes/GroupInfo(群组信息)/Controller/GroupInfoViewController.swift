//
//  GroupInfoViewController.swift
//  SYTeamApp
//
//  Created by mac on 16/4/14.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class GroupInfoViewController: ClearNavViewController {
    lazy var GroupTableView:UITableView = {
        var grouptv = UITableView()
        return grouptv
    }()
    var conversationID:String?{
        didSet{
            text = [UserAccount.shareUser.nickname!,"","4人"]
            dispatch_async(dispatch_get_main_queue()) {
                self.GroupTableView.reloadData()
            }
        }
    }
    var name:[String] = ["我的群名片","","群成员"]
    var text:[String] = ["哈哈","","4人"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        view.addSubview(GroupTableView)
        automaticallyAdjustsScrollViewInsets = false
        GroupTableView.snp_makeConstraints { (make) -> Void in
            make.left.right.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
        }
        GroupTableView.delegate = self
        GroupTableView.dataSource = self
        GroupTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        GroupTableView.registerClass(GroupInfoTableViewCell.self, forCellReuseIdentifier: "GroupInfoTableViewCell")
        GroupTableView.registerClass(CollectTableViewCell.self, forCellReuseIdentifier: "CollectTableViewCell")
        GroupTableView.registerClass(SectionDIstanceTableViewCell.self, forCellReuseIdentifier: "SectionDIstanceTableViewCell" )
        GroupTableView.registerClass(GroupMemberImageTableViewCell.self, forCellReuseIdentifier: "GroupMemberImageTableViewCell" )
        GroupTableView.registerClass(GroupMemberTableViewCell.self, forCellReuseIdentifier: "GroupMemberTableViewCell" )
        // Do any additional setup after loading the view.
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
extension GroupInfoViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 2:
            return 3
        default:
            return 2
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 1{
            let cell = tableView.dequeueReusableCellWithIdentifier("SectionDIstanceTableViewCell") as! SectionDIstanceTableViewCell
            return cell
        }

        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("GroupInfoTableViewCell") as! GroupInfoTableViewCell
            cell.GroupNum.text = conversationID
            cell.GroupDes.text = conversationID
            cell.GroupCate.text = conversationID
            return cell

        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("CollectTableViewCell") as! CollectTableViewCell
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCellWithIdentifier("GroupMemberTableViewCell") as! GroupMemberTableViewCell
            cell.NameLable.text = name[indexPath.row]
            cell.NameText.text = text[indexPath.row]
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("GroupMemberImageTableViewCell") as! GroupMemberImageTableViewCell
            return cell

        }
            }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 1{
            if indexPath.section == 2{
                return 1
            }
            return 20
        }

        switch indexPath.section {
        case 0:
            return 300
        case 1:
            return  200
        case 2:
            return 50
        default:
            return 80
    }
    }
    
}
