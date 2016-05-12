//
//  FriendsViewController.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/4/13.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class FriendsViewController: NormalNavViewController,FriendsTableViewCellDelegate {
    lazy var tableView = UITableView()
    var dataModles:[AnyObject] = []{
        didSet{
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
            })
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "同事列表"
        view.backgroundColor = UIColor.whiteColor()
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
        tableView.tableFooterView = UIView()
        //tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.registerClass(FriendsTableViewCell.self, forCellReuseIdentifier: "FriendsTableViewCell")
        
        FriendManager.instance.GetFriendsList { (result, error) in
            if result != nil{
            self.dataModles = result!
            }
        }
        
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
extension FriendsViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModles.count
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let vc = FriendInfoViewController()
        vc.conversationID = self.dataModles[indexPath.row] as? String

        self.pushVC(vc)
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendsTableViewCell", forIndexPath: indexPath) as! FriendsTableViewCell
        cell.tag = indexPath.row
        cell.tableDelegate = self
        cell.UserLabel.text = self.dataModles[indexPath.row] as? String
        return  cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    func tableclick(tag:Int) {
        let vc = FriendInfoViewController()
        vc.conversationID = self.dataModles[tag] as? String
        self.pushVC(vc)
    }
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.separatorInset = UIEdgeInsetsZero
        cell.preservesSuperviewLayoutMargins = false
        cell.layoutMargins = UIEdgeInsetsZero
    }
}
