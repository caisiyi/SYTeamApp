//
//  ViewController.swift
//  PersonInformation
//
//  Created by MAC on 16/4/12.
//  Copyright © 2016年 MAC. All rights reserved.
//


import UIKit


protocol AlterImageViewControllerDelegate{
    func backUserImage(vc:AlterImageViewController,image:String)
}
protocol AlterNameViewControllerDelegate{
    func backUserName(text:String)
}
protocol AlterDepartmentViewControllerDelegate{
    func backUserDepartment(vc:AlterDepartmentViewController,text:String)
}
protocol AlterSexViewControllerDelegate{
    
    func backUserSex(vc:AlterSexViewController,text:String)
}

protocol AlterSignViewControllerDelegate{
    func backUserSign(vc:AlterSignViewController,text:String)
    
}

class PersonalInformationViewController: UIViewController,AlterNameViewControllerDelegate,AlterDepartmentViewControllerDelegate ,AlterSignViewControllerDelegate,AlterImageViewControllerDelegate,AlterSexViewControllerDelegate{

 
    lazy var MainTableView : UITableView = {
        let tableview = UITableView()
        
        return tableview
        
    }()
   

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "个人信息"
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        
        view.addSubview(MainTableView)
        MainTableView.delegate = self
        MainTableView.dataSource = self
        MainTableView.scrollEnabled = false
        MainTableView.tableFooterView = UIView()
        MainTableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.right.equalTo(0)
            make.height.equalTo(view.frame.height)
        }
        MainTableView.registerClass(HeadTableViewCell.self, forCellReuseIdentifier: "HeadTableViewCell")
        MainTableView.registerClass(BlankTableViewCell.self, forCellReuseIdentifier: "BlankTableViewCell")
        MainTableView.registerClass(PersonTableViewCell.self, forCellReuseIdentifier: "PersonTableViewCell")
        MainTableView.registerClass(ExitTableViewCell.self, forCellReuseIdentifier: "ExitTableViewCell")
        
    }
    func backUserName(text: String) {
  
        UserAccount.shareUser.nickname = text
        UserAccount.shareUser.saveUserAccount()
        reload()
        NSNotificationCenter.defaultCenter().postNotificationName("InfoChanged", object: nil, userInfo: nil)
    }
    
    func reload() {
        dispatch_async(dispatch_get_main_queue()) {
            self.MainTableView.reloadData()
        }
    }
    func backUserDepartment(vc: AlterDepartmentViewController, text: String) {
        
        
        UserAccount.shareUser.department = text
        UserAccount.shareUser.saveUserAccount()
        reload()
    }
  
    func backUserSign(vc: AlterSignViewController, text: String) {
        UserAccount.shareUser.sign = text
        UserAccount.shareUser.saveUserAccount()
        reload()
    }
    func backUserImage(vc: AlterImageViewController, image: String) {
        UserAccount.shareUser.iconImage = image
        UserAccount.shareUser.saveUserAccount()
        reload()
        NSNotificationCenter.defaultCenter().postNotificationName("InfoChanged", object: nil, userInfo: nil)
    }
    func backUserSex(vc: AlterSexViewController, text: String) {
        UserAccount.shareUser.sex = text
        UserAccount.shareUser.saveUserAccount()
        reload()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension PersonalInformationViewController:UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section){
        case 0:return 6
        case 1:return 3
        default:return 1
        }
        

    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            switch indexPath.section{
            case 0:return 15
            case 1:return 30
            default:return UIScreen.mainScreen().bounds.height - 6 * 50 - 80 - 15 - 30
            }
        }
        else if indexPath.row == 1{
            if indexPath.section == 0{
                return 80
            }
            else {
                return 50
            }
        }
        else {
            return 50
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            
            if (indexPath.section == 2) {
                let cell = tableView.dequeueReusableCellWithIdentifier("ExitTableViewCell", forIndexPath: indexPath) as!ExitTableViewCell
                    return cell
            }
            else {
            let cell = tableView.dequeueReusableCellWithIdentifier("BlankTableViewCell", forIndexPath: indexPath) as!BlankTableViewCell
            return cell
            }
        }
         if(indexPath.row == 1&&indexPath.section == 0){
            
            let cell = tableView.dequeueReusableCellWithIdentifier("HeadTableViewCell", forIndexPath: indexPath)as! HeadTableViewCell
            cell.HeadLabel.text = "头像"
            cell.HeadImage.sd_setImageWithURL(NSURL(string:UserAccount.shareUser.iconImage!))
            
            return cell
            
        }
         else if(indexPath.row == 4&&indexPath.section == 0){
         
            let cell = tableView.dequeueReusableCellWithIdentifier("HeadTableViewCell", forIndexPath: indexPath)as! HeadTableViewCell
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
                let codeImage = SYQRCodeTool.createQRForString(UserAccount.shareUser.nickname, qrImageName: nil)
                 dispatch_async(dispatch_get_main_queue(), { () -> Void in
                          cell.HeadImage.image = codeImage
                 })
            }
            cell.HeadLabel.text = "我的二维码"
            return cell
         }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier("PersonTableViewCell", forIndexPath: indexPath)as!PersonTableViewCell
            if(indexPath.section == 0){
            switch indexPath.row{
            case 2:
                cell.LeftLabel.text = "姓名"
                cell.RightLabel.text = UserAccount.shareUser.nickname
                
                
            case 3:cell.LeftLabel.text = "工号"
            cell.RightLabel.text = UserAccount.shareUser.worknumber
            
                    cell.accessoryType = UITableViewCellAccessoryType.None
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            
            default :cell.RightLabel.text = UserAccount.shareUser.department
                cell.LeftLabel.text = "我的部门"
            }
            }
            else {
                switch indexPath.row{
                case 1:cell.RightLabel.text = UserAccount.shareUser.sex
                    cell.LeftLabel.text = "性别"
                
                default:cell.RightLabel.text = UserAccount.shareUser.sign
                    cell.LeftLabel.text = "个性签名"
                }
            }
            
            return cell
        }
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if(indexPath.section == 0){
            switch indexPath.row{
            case 1:
                let vc = AlterImageViewController()
                vc.delegete = self
                self.navigationController?.pushViewController(vc, animated: true)
            case 2:
                let vc = AlterNameViewController()
                vc.delegete = self
                
                self.navigationController?.pushViewController(vc, animated: true)
            case 3: break
            case 4:
                let vc = MyCodeViewController()
                let cell = tableView.cellForRowAtIndexPath(indexPath) as! HeadTableViewCell
                vc.codeImageView.image = cell.HeadImage.image
                vc.codeLabel.text = "工号: " + UserAccount.shareUser.worknumber!
                self.navigationController?.pushViewController(vc, animated: true)
            default:
                
                let vc = AlterDepartmentViewController()
                vc.delegete = self
                self.navigationController?.pushViewController(vc, animated: true)
            
            }
        }
        else{
            switch indexPath.row{
            case 1:
                let vc = AlterSexViewController()
                vc.delegete = self
                self.navigationController?.pushViewController(vc, animated: true)
          
            default:
                
                let vc = AlterSignViewController()
                vc.degelete = self
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
   
    
    
    
    
}
