//
//  SetupViewController.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/3/24.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController {
    lazy var tableView:UITableView = {
        return UITableView(VC: self)
    }()
    lazy var userView =  UserView()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = UIColor.whiteColor()
        automaticallyAdjustsScrollViewInsets = false
        
        let logoImage = UIImageView(image: UIImage(named: "考勤"))
        view.addSubview(logoImage)
        logoImage.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(20)
            make.bottom.equalTo(-70)
        }
        let content = UILabel(textColor: UIColor.blackColor(), font: UIFont.systemFontOfSize(15))
        view.addSubview(content)
        content.text = "XXXXXX企业"
        content.numberOfLines = 0
        content.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(logoImage.snp_bottom).offset(20)
        }
        
        userView.frame.size = CGSizeMake(WScreen * 0.7, 200)
        tableView.tableHeaderView = userView
        userView.user = UserAccount.shareUser
        view.addSubview(tableView)
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.right.equalTo(0)
            make.bottom.equalTo(logoImage.snp_top).offset(-8)
        }
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "SetupTableCell")
        
      
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
    var titleArray = ["其他","设置","组织","关于"]

}
extension SetupViewController:UITableViewDataSource,UITableViewDelegate{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("SetupTableCell")!
        cell.textLabel?.text = titleArray[indexPath.row]
        return cell
    }
}
