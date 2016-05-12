//
//  MyViewController.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/3/24.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class OfficeViewController: ClearNavViewController {
    lazy var headerView =  UIView()
    lazy var tableView:UITableView = {
        return UITableView(VC: self)
    }()
    lazy var doingDoneBtn:ImageTitleButton = {
        let button = ImageTitleButton(image: UIImage(named: "今天")!, text: " 今天 ", textColor: TextColor, fontSize: 14)
        return button
    }()
    lazy var didDoneBtn:ImageTitleButton = {
        let button = ImageTitleButton(image: UIImage(named: "今天")!, text: " 同事圈 ", textColor: TextColor, fontSize: 14)
        return button
    }()
    lazy var waitCommentBtn:ImageTitleButton = {
        let button = ImageTitleButton(image: UIImage(named: "今天")!, text: " CRM ", textColor: TextColor, fontSize: 14)
        return button
    }()

    
    var ContentView:UICollectionView!
    var labels:[Label]? {
        didSet{
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.ContentView.reloadData()
            })
        }
    }
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        view.backgroundColor = UIColor.whiteColor()
        automaticallyAdjustsScrollViewInsets = false
        let leftButton = UIButton()
        leftButton.setImage(UIImage(named: "我"), forState: UIControlState.Normal)
        leftButton.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        leftButton.rac_signalForControlEvents(UIControlEvents.TouchUpInside).subscribeNext { (_) -> Void in
           
        }
        let rightButton = UIButton()
        rightButton.setImage(UIImage(named: "投票"), forState: UIControlState.Normal)
        rightButton.setTitle(" 15˚C", forState: UIControlState.Normal)
        rightButton.sizeToFit()
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        navigationItem.titleView = UIView()
        
        headerView.backgroundColor = AppColor
        view.addSubview(headerView)
        headerView.snp_makeConstraints { (make) -> Void in
            make.top.left.right.equalTo(0)
            make.height.equalTo(200)
        }
        headerView.addSubview(didDoneBtn)
        headerView.addSubview(doingDoneBtn)
        headerView.addSubview(waitCommentBtn)
        didDoneBtn.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(-20)
            make.height.width.equalTo(100)
            make.centerX.equalTo(headerView.center)
        }
        doingDoneBtn.snp_makeConstraints { (make) -> Void in
            make.bottom.width.height.equalTo(didDoneBtn)
            make.centerX.equalTo(headerView).offset(-WScreen/3)
        }
        waitCommentBtn.snp_makeConstraints { (make) -> Void in
            make.bottom.width.height.equalTo(didDoneBtn)
            make.centerX.equalTo(headerView).offset(WScreen/3)
        }

        setContentView()
        view.addSubview(ContentView)
        ContentView.snp_makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(headerView.snp_bottom)
            make.bottom.equalTo(-49)
        }
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.backgroundColor = AppGrayLineColor
//        tableView.snp_makeConstraints { (make) -> Void in
//            make.left.right.equalTo(0)
//            make.top.equalTo(headerView.snp_bottom)
//            make.bottom.equalTo(0)
//        }

        // Do any additional setup after loading the view.
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
    func setContentView(){
        
        let pictureLayout = UICollectionViewFlowLayout()
        ContentView = UICollectionView(frame: CGRect(x: 0, y: 0, width: WScreen, height: 400), collectionViewLayout: pictureLayout)
        pictureLayout.itemSize = CGSize(width: (WScreen-2.4)/3, height: 100)
        pictureLayout.minimumInteritemSpacing = 0.8
        pictureLayout.minimumLineSpacing = 0.8
        ContentView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "LabelCell")
        ContentView.dataSource = self
        ContentView.delegate = self
        ContentView.showsHorizontalScrollIndicator  = false
        ContentView.showsVerticalScrollIndicator = false
        ContentView.backgroundColor = AppGrayLineColor
        self.labels = [Label(name: "会议", icon: "消息"),Label(name: "任务", icon: "任务"),Label(name: "审批", icon: "审核"),Label(name: "工作汇报", icon: "汇报"),Label(name: "考勤打卡", icon: "考勤"),Label(name: "日历", icon: "日历"),Label(name: "签到", icon: "考勤"),Label(name: "文档", icon: "文档"),Label(name: "项目", icon: "项目"),Label(name: "公告", icon: "会话"),Label(name: "投票", icon: "投票"),Label(name: "领导信箱", icon: "消息"),Label(name: "开发中", icon: "开发中"),Label(name: "产品中心", icon: "开发中"),Label(name: "开发中", icon: "开发中")]
        
        
    }
    
    
}

extension OfficeViewController:UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.labels?.count ?? 0
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("LabelCell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.whiteColor()
        if cell.contentView.subviews.count == 0 {
            let label = UILabel()
            label.font = UIFont.systemFontOfSize(12)
            label.textAlignment = NSTextAlignment.Center
            label.text = self.labels![indexPath.row].name
            label.textColor = UIColor.blackColor()
            let image = UIImageView()
            image.image = UIImage(named: self.labels![indexPath.row].icon)
            cell.contentView.addSubview(label)
            cell.contentView.addSubview(image)
            image.snp_makeConstraints(closure: { (make) -> Void in
                make.centerX.equalTo(cell.contentView)
                make.centerY.equalTo(cell.contentView).offset(-8)
            })
            label.snp_makeConstraints(closure: { (make) -> Void in
                make.top.equalTo(image.snp_bottom).offset(8)
                make.centerX.equalTo(cell.contentView)
            })
        }
        return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        pushVC(VoteListViewController())
    }
}