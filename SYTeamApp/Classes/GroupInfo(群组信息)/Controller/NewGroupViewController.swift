//
//  NewGroupViewController.swift
//  SYTeamApp
//
//  Created by mac on 16/4/14.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit
var selectedMember:[String] = []

class NewGroupViewController: UIViewController {
    lazy var NewGroupTableView:UITableView = {
        var newgroup = UITableView()
        return newgroup
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(NewGroupTableView)
        let done = UIBarButtonItem.init(title: "完成", target: self, action: "finish")
        navigationItem.rightBarButtonItem = done
        navigationItem.title = "创建群"
        navigationItem.rightBarButtonItem = done
        NewGroupTableView.frame = CGRect(x: 0, y: 0, w: kScreenW, h: kScreenH)
        NewGroupTableView.delegate = self
        NewGroupTableView.dataSource = self
        NewGroupTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        NewGroupTableView.registerClass(NewGroupInfoTableViewCell.self, forCellReuseIdentifier: "NewGroupInfoTableViewCell")
        NewGroupTableView.registerClass(SectionDIstanceTableViewCell.self, forCellReuseIdentifier: "SectionDIstanceTableViewCell")
        NewGroupTableView.registerClass(AddGroupNewMemberTableViewCell.self, forCellReuseIdentifier: "AddGroupNewMemberTableViewCell")
        NewGroupTableView.registerClass(SelectedFriendsTableViewCell.self, forCellReuseIdentifier: "SelectedFriendsTableViewCell")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    func finish(){
       
        
        let cell = self.NewGroupTableView.cellForRowAtIndexPath(NSIndexPath.init(forRow: 0, inSection: 0)) as! NewGroupInfoTableViewCell
       // NewGroupInfoTableViewCell入不同的类型
       CreatGroup(cell.NewGroupName.text!, description: cell.NewGroupDes.text!) { (result, error) in
            if result != nil {
                let object = AVObject(className: "GroupList")
                object.setObject(result!.groupId.lowercaseString, forKey: "groupId")
                object.setObject(result!.subject, forKey: "groupName")
                object.setObject(result!.description, forKey: "groupDesc")
                object.saveInBackgroundWithBlock({ (bool, error) in
                    if error == nil {
                        SYProgressHUD.ShowSuccess("创建成功")
                        self.navigationController?.viewControllers.forEach({ (vc) in
                            if vc.isKindOfClass(MessageMainViewController) {
                                (vc as! MessageMainViewController).AddGroupResult()
                                self.navigationController?.popToViewController(vc, animated: true)
                            }
                        })
                    }else{
                        SYProgressHUD.ShowSuccess("创建失败")
                    }
                })
            }else{
                SYProgressHUD.ShowFailed("创建失败")
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
func CreatGroup(subject:String,description:String,completion:GroupManagerGroupBlock){
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
        var error:EMError?
        let style = EMGroupOptions()
        style.style = EMGroupStylePublicOpenJoin
        style.maxUsersCount = 200
        let group = EMClient.sharedClient().groupManager.createGroupWithSubject(subject, description: description, invitees: selectedMember, message: subject, setting: style, error: &error)
        if error == nil {
            completion(result: group, error: nil)
        }else{
            completion(result: nil, error: error)
        }
    }
}

extension NewGroupViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2{
        return selectedMember.count
        }
        return 2
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 1 && indexPath.section != 2{
            let cell = tableView.dequeueReusableCellWithIdentifier("SectionDIstanceTableViewCell") as! SectionDIstanceTableViewCell
            return cell
        }
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("NewGroupInfoTableViewCell") as! NewGroupInfoTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("AddGroupNewMemberTableViewCell") as! AddGroupNewMemberTableViewCell
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("SelectedFriendsTableViewCell") as! SelectedFriendsTableViewCell
            cell.tag = indexPath.row
            cell.UserName.text = selectedMember[indexPath.row]
            return cell

        }
        
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.row == 1 && indexPath.section != 2{
                return 8
            }
        switch indexPath.section {
        case 0:
            return 180
        case 2:
            return 60
        default:
            return 40
        }
     }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        view.endEditing(true)
        if indexPath.section == 1 && indexPath.row == 0 {
            navigationController?.pushViewController(FriendListInGroupViewController(), animated: true)
        }
        
    }
}