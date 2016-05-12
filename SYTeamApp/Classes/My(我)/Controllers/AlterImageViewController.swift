//
//  AlterImageViewController.swift
//  PersonInformation
//
//  Created by MAC on 16/4/13.
//  Copyright © 2016年 MAC. All rights reserved.
//

import UIKit
private let reuseIdentifier = "Cell"
class AlterImageLabel:NSObject{
    
    var icon:String = ""
    
    
    init(icon:String){
        
        self.icon = icon
    }
}


extension AlterImageViewController:UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.labels?.count ?? 0
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("LabelCell", forIndexPath: indexPath)
        if cell.contentView.subviews.count == 0 {
            
            let image = UIImageView()
//             cell.HeadImage.sd_setImageWithURL(NSURL(string: "http://tp4.sinaimg.cn/1889104851/180/5753176555/1"))
            image.sd_setImageWithURL(NSURL(string: self.labels![indexPath.row].icon))
            
            cell.contentView.addSubview(image)
            
            image.snp_makeConstraints(closure: { (make) -> Void in
                //                make.centerX.equalTo(cell.contentView)
                //                make.centerY.equalTo(cell.contentView).offset(-8)
               make.top.equalTo(20)
                make.left.equalTo(20)
                make.right.equalTo(-20)
                make.bottom.equalTo(-20)
                
            })
            
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, shouldDeselectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        cell?.contentView.backgroundColor = UIColor.whiteColor()
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //        var key = self.collectionView.dataArray.objectAtIndex(indexPath.row) as String
        //        DialogUtil.showDlgAlert(key)
        print("\(indexPath.row)")
        imagestring = self.labels![indexPath.row].icon
//        let YesView = UIImageView()
//        YesView.image = UIImage(named: "yes")
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        cell?.contentView.backgroundColor = UIColor(white: 0.8, alpha: 1)
        
        
    }
}

class AlterImageViewController: UIViewController {
    var imagestring:String?
    var delegete:AlterImageViewControllerDelegate?
    
    var labels:[AlterImageLabel]?{
        didSet{
            ContentView.reloadData()
        }
    }
    
    var ContentView:UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        self.title = "选择头像"
        let leftItem = UIBarButtonItem(title: "取消", style: .Plain, target: self, action: "cancel")
        self.navigationItem.leftBarButtonItem = leftItem
        let rightItem = UIBarButtonItem(title: "完成", style: .Plain, target: self, action: "sure")
        self.navigationItem.rightBarButtonItem = rightItem

        let pictureLayout = UICollectionViewFlowLayout()
        ContentView = UICollectionView(frame: CGRect(x: 0, y: 40, width: view.bounds.width, height: view.frame.height), collectionViewLayout: pictureLayout)
        pictureLayout.itemSize = CGSize(width: view.bounds.width / 3, height: view.bounds.width / 3)
        pictureLayout.minimumInteritemSpacing = 0
        pictureLayout.minimumLineSpacing = 0
        
        ContentView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "LabelCell")
        ContentView.dataSource = self
        ContentView.delegate = self
        ContentView.backgroundColor = UIColor.whiteColor()
        let query = AVQuery(className: "UserDefaultIcon")
        query.findObjectsInBackgroundWithBlock { (images, error) in
            var a:[AlterImageLabel] = []
                images.forEach({ (image) in
                    a.append(AlterImageLabel.init(icon: image.objectForKey("iconUrl") as! String))
                })
            self.labels = a
        }
      
        view.addSubview(ContentView)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func cancel(){
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    func sure(){
        
        UserAccount.ChangeUserInfo(imagestring!, key: "userImage")
        self.delegete?.backUserImage(self, image:imagestring!)
        self.navigationController?.popViewControllerAnimated(true)
        
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
