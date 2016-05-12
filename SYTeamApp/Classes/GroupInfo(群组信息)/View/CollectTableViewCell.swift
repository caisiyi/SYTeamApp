//
//  CollectTableViewCell.swift
//  SYTeamApp
//
//  Created by mac on 16/4/14.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit
class Label: NSObject {
    var icon:String = ""
    var name:String = ""
    init(name:String,icon:String){
        
        self.name = name
        self.icon = icon
    }
}
class CollectTableViewCell: UITableViewCell {
    var ContentView:UICollectionView!
    var labels:[Label]? {
        didSet{
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.ContentView.reloadData()
            })
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setContentView()
        if contentView.subviews.count <= 0{
            contentView.addSubview(ContentView)
            selectionStyle = UITableViewCellSelectionStyle.None
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setContentView(){
        
        let pictureLayout = UICollectionViewFlowLayout()
        ContentView = UICollectionView(frame: CGRect(x: 0, y: 0, width: WScreen, height: 200), collectionViewLayout: pictureLayout)
        pictureLayout.itemSize = CGSize(width: (WScreen)/4, height: 100)
        pictureLayout.minimumInteritemSpacing = 0
        pictureLayout.minimumLineSpacing = 0
        ContentView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "LabelCell")
        ContentView.dataSource = self
        ContentView.delegate = self
        ContentView.backgroundColor = AppGrayLineColor
        
        self.labels = [Label(name: "公告", icon: "投票"),Label(name: "文件", icon: "投票"),Label(name: "相册", icon: "投票"),Label(name: "群活动", icon: "投票"),Label(name: "群投票", icon: "投票"),Label(name: "裙链接", icon: "投票"),Label(name: "签到", icon: "投票"),Label(name: "更多", icon: "投票")]
        
        
    }

}
extension CollectTableViewCell:UICollectionViewDataSource,UICollectionViewDelegate {
    
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
            image.snp_makeConstraints { (make) -> Void in
                make.centerX.equalTo(cell.contentView)
                make.centerY.equalTo(cell.contentView).offset(-8)
            }
            
            label.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(image.snp_bottom).offset(8)
                make.centerX.equalTo(cell.contentView)
            }
        }
        return cell
}
}
