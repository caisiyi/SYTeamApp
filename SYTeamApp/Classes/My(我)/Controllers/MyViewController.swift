//
//  MyViewController.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/3/24.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class MyViewController: NormalNavViewController,UINavigationControllerDelegate {
 
    lazy var MytableView:UITableView = {
        return UITableView(VC: self)
    }()
    var functionmodels:[Label]?{
        didSet{
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.MytableView.reloadData()
            })
        }
    }
    override func viewDidLoad() {
       

        super.viewDidLoad()
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        view.backgroundColor = UIColor.whiteColor()
        //automaticallyAdjustsScrollViewInsets = false
        view.addSubview(MytableView)
        navigationItem.title = "我"

        MytableView.dataSource = self
        MytableView.delegate = self
        MytableView.frame = CGRect(x: 0, y: 0, w: kScreenW, h: kScreenH)
        MytableView.registerClass(MyInfoTableViewCell.self, forCellReuseIdentifier: "MyInfoTableViewCell")
        MytableView.registerClass(UserTableChildViewCell.self, forCellReuseIdentifier: "UserTableChildViewCell")
        MytableView.registerClass(SectionDIstanceTableViewCell.self, forCellReuseIdentifier: "SectionDIstanceTableViewCell")
        MytableView.backgroundColor = AppGrayLineColor
        functionmodels = [Label.init(name: " 部门", icon: "wodefensi_2x"),Label.init(name: " 福利", icon: "wodejianzheng_2x"),Label.init(name: " 关于", icon: "wodeguanzhu_2x"),Label.init(name: " 设置", icon: "gerenzhuye_2x")]
        
         NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MyViewController.InfoChanged), name: "InfoChanged", object: nil)
        
        // Do any additional setup after loading the view.
    }
    func InfoChanged(){
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.MytableView.reloadData()
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func scrollViewDidScroll(scrollView: UIScrollView)
//    {
//        if scrollView == tableView{
//            if scrollView.contentOffset.y <= 0 {
//                var offset = scrollView.contentOffset
//                offset.y = 0
//                scrollView.contentOffset = offset
//            }
//        }
//    }
   

    
}
extension MyViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section){
        case 1:return 4
        default:return 2
        }
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {

        if indexPath.row == 0{
            return 20
        }
        if indexPath.section == 0{
            return 100
        }
        else{
        return 60
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("SectionDIstanceTableViewCell") as! SectionDIstanceTableViewCell
            return cell
        }
        else{
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCellWithIdentifier("MyInfoTableViewCell") as! MyInfoTableViewCell
                cell.Userimage.sd_setImageWithURL(NSURL(string:UserAccount.shareUser.iconImage!))
                cell.UserName.text = UserAccount.shareUser.nickname ?? "未登陆"
                cell.UserNumber.text = UserAccount.shareUser.worknumber ?? "未登陆"
                return cell

            default:
                let cell = tableView.dequeueReusableCellWithIdentifier("UserTableChildViewCell") as! UserTableChildViewCell
                switch indexPath.section {
                case 1:
                    
                        cell.functionsmodel = functionmodels![indexPath.row-1]
                    return cell
                    
                default:
                        cell.functionsmodel = functionmodels![2+indexPath.row]
                    return cell
                }
            
            }
        }
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath.section == 0 && indexPath.row == 1 {
            let vc = PersonalInformationViewController()
            navigationController?.pushViewController(vc, animated: true)

        }
    }
}