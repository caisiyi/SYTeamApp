//
//  FirendInfoViewController.swift
//  SYTeamApp
//
//  Created by mac on 16/4/13.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class FriendInfoViewController: ClearNavViewController {
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
    lazy var BtnView:UIView = {
        var btnview = UIView()
        return btnview
    }()
    lazy var SendMessageBtn:UIButton = {
        var sendmessage = UIButton()
        sendmessage.setTitle("发消息", forState: UIControlState.Normal)
        sendmessage.backgroundColor = UIColor.whiteColor()

        sendmessage.setTitleColor(AppColor, forState: UIControlState.Normal)
        return sendmessage
    }()
    lazy var VideoBtn:UIButton = {
        var video = UIButton()
        video.setTitle("视频电话", forState: UIControlState.Normal)
        video.backgroundColor = AppColor
        return video
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
            make.bottom.equalTo(-80)
        }
        FriendInfoTableView.registerClass(FriendfInfoNameAndImageTableViewCell.self, forCellReuseIdentifier: "FriendfInfoNameAndImageTableViewCell" )
        FriendInfoTableView.registerClass(OtherTableViewCell.self, forCellReuseIdentifier: "OtherTableViewCell" )
        FriendInfoTableView.registerClass(SectionDIstanceTableViewCell.self, forCellReuseIdentifier: "SectionDIstanceTableViewCell" )
        FriendInfoTableView.delegate = self
        FriendInfoTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        FriendInfoTableView.dataSource = self
        view.addSubview(BtnView)
        BtnView.backgroundColor = AppGrayLineColor
        BtnView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(FriendInfoTableView.snp_bottom)
            make.left.right.equalTo(0)
            make.height.equalTo(80)
        }
        BtnView.addSubview(VideoBtn)
        VideoBtn.snp_makeConstraints { (make) -> Void in
            make.width.equalTo((kScreenW-30)/2)
            make.left.equalTo(10)
            make.top.equalTo(10)
            make.height.equalTo(60)
        }
        VideoBtn.layer.cornerRadius = 10
        
        
        SendMessageBtn.addTarget(self, action: "sendMessage", forControlEvents: UIControlEvents.TouchUpInside)
        BtnView.addSubview(SendMessageBtn)
        SendMessageBtn.snp_makeConstraints { (make) -> Void in
            make.width.equalTo((kScreenW-30)/2)
            make.left.equalTo(VideoBtn.snp_right).offset(10)
            make.top.equalTo(10)
            make.height.equalTo(60)
        }
        SendMessageBtn.layer.cornerRadius = 10

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func sendMessage(){
        let vc = ChatViewController()
        vc.conversationID = conversationID
        vc.chatType = EMChatTypeChat
        self.pushVC(vc)
        ConversationManager.instance.GetConversationMessage(conversationID!, type: EMConversationTypeChat) { (result, error) in
            if result != nil{
                vc.dataModel = result!
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
extension FriendInfoViewController:UITableViewDelegate,UITableViewDataSource{
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

    