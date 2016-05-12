//
//  MainViewController.swift
//  Organization
//
//  Created by mac on 16/4/9.
//  Copyright © 2016年 CH. All rights reserved.
//

import UIKit
class GroupListViewController: UIViewController {
    var groupTableVIew:UITableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        view.addSubview(groupTableVIew)
        groupTableVIew.delegate = self
        groupTableVIew.dataSource = self
        groupTableVIew.registerClass(GroupListTableViewCell.self, forCellReuseIdentifier: "GroupListTableViewCell")
        groupTableVIew.frame = CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH)
        groupTableVIew.separatorStyle = UITableViewCellSeparatorStyle.None
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
extension GroupListViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GroupListTableViewCell", forIndexPath: indexPath) as! GroupListTableViewCell
        return  cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
}
