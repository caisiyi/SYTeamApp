//
//  VoteListViewController.swift
//  SYTeamApp
//
//  Created by mac on 16/4/12.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class VoteListViewController: NormalNavViewController ,UINavigationControllerDelegate{
    
    lazy var VoteList:UITableView = {
        var votelist = UITableView()
        return votelist
    }()
    var dataModles:[VoteInfo] = []{
        didSet{
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.VoteList.reloadData()
            })
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "投票"
        view.addSubview(VoteList)
        VoteList.backgroundColor = AppGrayLineColor
        VoteList.separatorStyle = UITableViewCellSeparatorStyle.None
        VoteList.delegate = self
        VoteList.dataSource = self
        VoteList.rowHeight = 160
        VoteList.frame = CGRect(x: 0, y: 0, w: kScreenW, h: kScreenH)
        VoteList.registerClass(VoteListTableViewCell.self, forCellReuseIdentifier: "VoteListTableViewCell")
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "加号"), style: UIBarButtonItemStyle.Plain, target: self, action: #selector(VoteListViewController.NewVote))
        view.backgroundColor = UIColor.whiteColor()
        
        VoteInfo.loadVote { (result, error) in
            if result != nil {
                self.dataModles = result!
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func NewVote(){
        let vc = AddVoteViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
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
extension VoteListViewController:UITableViewDelegate,UITableViewDataSource,AddVoteViewControllerDetegate{
    func FinishedAddVote() {
        VoteInfo.loadVote { (result, error) in
            if result != nil {
                self.dataModles = result!
            }
        }
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModles.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("VoteListTableViewCell") as! VoteListTableViewCell
        cell.voteInfo = self.dataModles[indexPath.row]
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = ConductVoteViewController()
        vc.voteInfo = self.dataModles[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}