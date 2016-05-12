//
//  ConductVoteViewController.swift
//  Vote
//
//  Created by mac on 16/4/8.
//  Copyright © 2016年 CH. All rights reserved.
//

import UIKit

class ConductVoteViewController: UIViewController{
    var precell:GetItemsTableViewCell = GetItemsTableViewCell()
    var voteInfo:VoteInfo?{
        didSet{
            dispatch_async(dispatch_get_main_queue()) {
                self.InfoTableView.reloadData()
            }
        }
    }
    var InfoTableView:UITableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(InfoTableView)
        view.backgroundColor = UIColor.whiteColor()
        navigationItem.title = "发布"
        InfoTableView.delegate = self
        InfoTableView.dataSource = self
        InfoTableView.separatorStyle =  UITableViewCellSeparatorStyle.None
        InfoTableView.registerClass(GetTitleAndContentTableViewCell.self, forCellReuseIdentifier: "GetTitleAndContentTableViewCell")
        InfoTableView.registerClass(FinishaVoteTableViewCell.self, forCellReuseIdentifier: "FinishaVoteTableViewCell")
        InfoTableView.registerClass(GetItemsTableViewCell.self, forCellReuseIdentifier: "GetItemsTableViewCell")
        
        InfoTableView.snp_makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(0)
        }
        // Do any additional setup after loading the view.
    }
//    override func viewWillAppear(animated: Bool) {
//        
//        preVC?.imagedelegate = self
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func backVoteImage(vc: UIViewController, image: UIImage) {
//        let ImageCell = self.InfoTableView.cellForRowAtIndexPath(NSIndexPath.init(forRow: 0, inSection: 0)) as! TitleAndContentTableViewCell
//        
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ConductVoteViewController:UITableViewDataSource,UITableViewDelegate{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            return  self.voteInfo!.voteItems.count
        default:
            return 1
        }
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("GetTitleAndContentTableViewCell") as! GetTitleAndContentTableViewCell
            return  cell.backRowHeight(self.voteInfo)
        default:
            return 46
        }
    }
 
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 1{
        let cell = tableView.cellForRowAtIndexPath(indexPath)as!GetItemsTableViewCell
        cell.chSelected = !cell.chSelected
        if voteInfo?.ismorechoice == false{
            precell.chSelected = false
            precell = cell
        }
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let titileAndContentCell = tableView.dequeueReusableCellWithIdentifier("GetTitleAndContentTableViewCell", forIndexPath: indexPath) as! GetTitleAndContentTableViewCell
            titileAndContentCell.voteInfo = voteInfo
            if(titileAndContentCell.voteInfo?.ismorechoice == true)
            {
                titileAndContentCell.moreChoice.text = "支持多选"
            }
            else{
                titileAndContentCell.moreChoice.text = "单选"
            }
            return titileAndContentCell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("GetItemsTableViewCell", forIndexPath: indexPath) as! GetItemsTableViewCell
            cell.itemsContent.tag = indexPath.row
            cell.itemsContent.text = voteInfo!.voteItems[indexPath.row].itemsContent
            if voteInfo?.ismorechoice == false{
            if indexPath.row == 0 {
                cell.chSelected = true
                precell = cell
            }
            }
            return cell
//            let cell = tableView.dequeueReusableCellWithIdentifier("SwitchTableViewCell", forIndexPath: indexPath) as! SwitchTableViewCell
//            return cell
        
            
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("FinishaVoteTableViewCell", forIndexPath: indexPath) as! FinishaVoteTableViewCell
            return cell
            
            
        }
        
    }
}