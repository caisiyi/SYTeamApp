//
//  CollectionViewController.swift
//  Login_Demo
//
//  Created by MAC on 16/4/9.
//  Copyright © 2016年 MAC. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
class ChooseLabel:NSObject{
    
    var icon:String = ""
    
    
    init(icon:String){
       
        self.icon = icon
    }
}
protocol CollectionViewControllerDelegate{
    func backUserImage(vc:ChooseImageViewcontroller,image:UIImage)
}
extension ChooseImageViewcontroller:UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.labels?.count ?? 0
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("LabelCell", forIndexPath: indexPath)
        if cell.contentView.subviews.count == 0 {
            
            let image = UIImageView()
            image.image = UIImage(named: self.labels![indexPath.row].icon)
           
            cell.contentView.addSubview(image)
            
            image.snp_makeConstraints(closure: { (make) -> Void in
//                make.centerX.equalTo(cell.contentView)
//                make.centerY.equalTo(cell.contentView).offset(-8)
                make.width.equalTo(100)
                make.height.equalTo(100)
                make.left.equalTo(20)
                
            })
            
                    }
        return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//        var key = self.collectionView.dataArray.objectAtIndex(indexPath.row) as String
//        DialogUtil.showDlgAlert(key)
        print("\(indexPath.row)")
        imagestring = self.labels![indexPath.row].icon
    }
}
class ChooseImageViewcontroller: UIViewController {
    var imagestring:String?
    var delegete:CollectionViewControllerDelegate?
    
    var labels:[ChooseLabel]?{
        didSet{
            ContentView.reloadData()
        }
    }
  
    var ContentView:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="选择头像"
        let topView=UIView()
        view.addSubview(topView)
        topView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(64)
        }
        let cancelBtn=UIButton()
        cancelBtn.setTitle("取消", forState: UIControlState.Normal)
        cancelBtn.addTarget(self, action: "cancel", forControlEvents: .TouchUpInside)
        cancelBtn.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        topView.addSubview(cancelBtn)
        cancelBtn.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(20)
            make.top.equalTo(20)
            make.height.equalTo(40)
            make.width.equalTo(80)
        }
        let sureBtn=UIButton()
        sureBtn.setTitle("完成", forState: UIControlState.Normal)
        sureBtn.addTarget(self, action: "sure", forControlEvents: .TouchUpInside)
        sureBtn.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        topView.addSubview(sureBtn)
        sureBtn.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(-20)
            make.top.equalTo(20)
            make.height.equalTo(40)
            make.width.equalTo(80)
        }

        

        view.backgroundColor = UIColor.whiteColor()
        let pictureLayout = UICollectionViewFlowLayout()
        ContentView = UICollectionView(frame: CGRect(x: 0, y: 80, width: view.bounds.width, height: 700), collectionViewLayout: pictureLayout)
        pictureLayout.itemSize = CGSize(width: view.bounds.width / 3, height: 150)
        pictureLayout.minimumInteritemSpacing = 0
        pictureLayout.minimumLineSpacing = 0
        
        ContentView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "LabelCell")
        ContentView.dataSource = self
        ContentView.delegate = self
        ContentView.backgroundColor = UIColor.whiteColor()
        
        self.labels = [ChooseLabel(icon: "1愿望"),ChooseLabel(icon: "2最新"),ChooseLabel(icon: "3最热"),ChooseLabel(icon: "4生活"),ChooseLabel(icon: "5学习"),ChooseLabel(icon: "6挑战")]
        
        view.addSubview(ContentView)
        // Do any additional setup after loading the view.
    }
    func cancel(){
        self.navigationController?.popViewControllerAnimated(true)
       
    }
    func sure(){
//        switch(indexPath.row){
//        case 1:
//        
//        }
    
        
        self.delegete?.backUserImage(self, image: UIImage(named: imagestring!)!)
        self.navigationController?.popViewControllerAnimated(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
   

}
