//
//  FirendInfoViewController.swift
//  SYTeamApp
//
//  Created by mac on 16/4/13.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class FriendChatInfoViewController: ClearNavViewController {
    var conversationID:String?{
        didSet{
            content = [conversationID!,"表白不是好事，显得手太黑"]
            dispatch_async(dispatch_get_main_queue()) {
                self.FriendInfoTableView.reloadData()
            }
        }
    }
    lazy var FriendInfoTableView:UITableView = {
        var friendinfo = UITableView()
        return friendinfo
    }()
    var name:[String] = ["账号信息","个性签名"]
    var content:[String] = ["10086","表白不是好事，显得手太黑"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        automaticallyAdjustsScrollViewInsets = false
        view.addSubview(FriendInfoTableView)
        //FriendInfoTableView.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.2)
        FriendInfoTableView.snp_makeConstraints { (make) -> Void in
            make.left.right.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
        }
        FriendInfoTableView.registerClass(FriendfInfoNameAndImageTableViewCell.self, forCellReuseIdentifier: "FriendfInfoNameAndImageTableViewCell" )
        FriendInfoTableView.registerClass(OtherTableViewCell.self, forCellReuseIdentifier: "OtherTableViewCell" )
        FriendInfoTableView.registerClass(SectionDIstanceTableViewCell.self, forCellReuseIdentifier: "SectionDIstanceTableViewCell" )
        FriendInfoTableView.delegate = self
        FriendInfoTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        FriendInfoTableView.dataSource = self
        
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
extension FriendChatInfoViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 1{
            return 1
        }
        switch indexPath.section {
        case 0:
            return 400
        default:
            return 80
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 1{
            let cell = tableView.dequeueReusableCellWithIdentifier("SectionDIstanceTableViewCell") as! SectionDIstanceTableViewCell
            return cell
        }
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("FriendfInfoNameAndImageTableViewCell") as! FriendfInfoNameAndImageTableViewCell
            cell.userName.text = content[0]
            return cell
            
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("OtherTableViewCell") as! OtherTableViewCell
            cell.Name.text = name[indexPath.section-1]
            cell.Content.text = content[indexPath.section-1]
            return cell
            
        }
    }
    
}

    