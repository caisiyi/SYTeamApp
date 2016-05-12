//
//  ConstructViewController.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/5/6.
//  Copyright © 2016年 caisiyi. All rights reserved.
//


import UIKit

class ConstructViewController: NormalNavViewController {

    var menuView:MultilevelMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "组织架构"
        
        view.backgroundColor = UIColor.whiteColor()
        
        
        
        automaticallyAdjustsScrollViewInsets = false
        
        let add = UIBarButtonItem.init(title: "编辑", target: self, action: "edit")
        
        navigationItem.rightBarButtonItem = add
        
        //        NSMutableArray * lis=[NSMutableArray arrayWithCapacity:0];
        let ls = NSMutableArray()
        let titleMain = ["管理层(9)","运维部(18)","财务部(18)","研发部(18)","人力资源部(18)","销售部(18)"]
        let ItemsTitle = ["一部","二部"]
        let SubItemsTitle = ["员工1","员工2","员工3","员工4","员工5","员工6","员工7","员工8","员工9"]
        let SubItemsImage = ["个人","个人","个人","个人","个人","个人","个人","个人","个人","个人","个人"]
        
        titleMain.forEach { (title) -> () in
            
            let menu = rightMeun()
            menu.meunName = title
            let sub = NSMutableArray()
            for i in 0...ItemsTitle.count-1{
                let date = rightMeun()
                date.meunName = ItemsTitle[i]
                let subDateArray = NSMutableArray()
                for i in 0...SubItemsTitle.count-1{
                    let subDate = rightMeun()
                    subDate.meunName = SubItemsTitle[i]
                    subDate.urlName =  SubItemsImage[i]
                    subDateArray.addObject(subDate)
                }
                date.nextArray =  subDateArray as [AnyObject]
                sub.addObject(date)
                
                if title == "管理层(9)" {
                    break
                }
            }
            menu.nextArray = sub as [AnyObject]
            ls.addObject(menu)
        }
        menuView = MultilevelMenu(frame: CGRect(x: 0, y: 64, width: WScreen, height: HScreen - 64), withData: ls as [AnyObject], withSelectIndex: { (left, right, info) -> Void in
            
            print(left)
            print(right)
            print(info)
            
            
        })
        menuView?.leftSelectColor = AppColor
        view.addSubview(menuView!)

    }
    func edit(){
        
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

