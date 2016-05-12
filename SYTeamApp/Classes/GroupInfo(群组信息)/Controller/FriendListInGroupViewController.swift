//
//  FriendListInGroupViewController.swift
//  SYTeamApp
//
//  Created by mac on 16/4/15.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class FriendListInGroupViewController: UIViewController {
    
   lazy  var FriendListTableView: UITableView = {
    var friendlist = UITableView(){
    didSet{
        dispatch_async(dispatch_get_main_queue()) {
            self.FriendListTableView.reloadData()
        }
        }
    }
    return friendlist
    }()
        var dataModles:[AnyObject] = []{
        didSet{
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.FriendListTableView.reloadData()
            })
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(FriendListTableView)
        title = "同事列表"
        let add = UIBarButtonItem.init(title: "添加", target: self, action: "getMember")
        
        navigationItem.rightBarButtonItem = add
        FriendListTableView.frame = CGRect(x: 0, y: 0, w: kScreenW, h: kScreenH)
        FriendListTableView.delegate = self
        FriendListTableView.dataSource = self
        FriendListTableView.registerClass(FriendListOfGroupTableViewCell.self, forCellReuseIdentifier: "FriendListOfGroupTableViewCell")
        // Do any additional setup after loading the view.
        
        FriendManager.instance.GetFriendsList { (result, error) in
            if result != nil{
                self.dataModles = result!
            }
        }
    }
    var FriendsCount:Int = 0{
        didSet{
            dispatch_async(dispatch_get_main_queue()) {
                self.FriendListTableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getMember(){
        print(navigationController?.viewControllers)
        navigationController?.viewControllers.forEach({ (vc) in
            if vc.isKindOfClass(NewGroupViewController) {
                let vc = vc as! NewGroupViewController
                dispatch_async(dispatch_get_main_queue()) {
                    vc.NewGroupTableView.reloadData()
                }
            }
        })
        
        navigationController?.popViewControllerAnimated(true)
//        let vc = NewGroupViewController()
      
//        navigationController?.pushViewController(vc, animated: true)
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
extension FriendListInGroupViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModles.count

    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendListOfGroupTableViewCell") as! FriendListOfGroupTableViewCell
        cell.tag = indexPath.row
        cell.UserInfo.text = self.dataModles[indexPath.row] as? String
        if selectedMember.contains(cell.UserInfo.text!){
            cell.chSelected = true
        }
        
        
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)as!FriendListOfGroupTableViewCell 
        cell.chSelected = !cell.chSelected
        if cell.chSelected == true{
            if !selectedMember.contains(cell.UserInfo.text!){
                selectedMember.append(cell.UserInfo.text!)
                FriendsCount += 1

            }
        }
        else{
            selectedMember.removeObject(cell.UserInfo.text!)
            FriendsCount -= 1

        }
        
        
    }
}