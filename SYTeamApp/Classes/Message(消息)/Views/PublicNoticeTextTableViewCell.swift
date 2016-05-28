//
//  PublicNoticeTextTableViewCell.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/4/13.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit



class PublicNoticeTextTableViewCell: UITableViewCell {
    var model:EMMessage?{
        didSet{
            let message = model!.body as! EMTextMessageBody
 //           DateLabel.text = "\(model!.timestamp)"
            MessageTitle.text = " 公告 "
            var timestamp = model!.timestamp
            if timestamp > 140000000000 {
                timestamp = timestamp / 1000
            }
            MessageDate.text = NSDate(timeIntervalSince1970: Double(timestamp)).toString()
            MessageImage.image = UIImage(named: "返回")
            MessageLabel.text = message.text
            DetailImage.image = UIImage(named: "返回")
        }
    }
    
    lazy var MessageTitle:UILabel = {
        let label = UILabel()
        return label
        
    }()
    lazy var MessageDate:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(13)
        label.textColor = UIColor(white: 0.8, alpha: 1)
        return label
        
        
    }()
    lazy var MessageImage:UIImageView = {
        let imageview = UIImageView()
        
        return imageview
        
    }()
    lazy var MessageLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(15)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var MessageDetail:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(15)
        label.text = "查看详情"
        return label
        
    }()
    lazy var DetailImage:UIImageView = {
        let imageview = UIImageView()
        imageview.layer.masksToBounds = true
        imageview.layer.cornerRadius = 10
        return imageview
        
    }()
    lazy var MessageBtn : UIButton = {
        let messagebtn = UIButton()
        messagebtn.layer.masksToBounds = true
        messagebtn.layer.cornerRadius = 10
        messagebtn.backgroundColor = UIColor.whiteColor()
        
        return  messagebtn
    }()
    lazy var DateLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(13)
        label.textColor = UIColor.whiteColor()
        label.textAlignment = NSTextAlignment.Center
        label.backgroundColor = UIColor(white: 0.6, alpha: 1)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        return label
        
    }()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = UITableViewCellSelectionStyle.None
        contentView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        
//        contentView.addSubview(DateLabel)
//        DateLabel.snp_makeConstraints { (make) -> Void in
//            make.top.equalTo(17)
//            make.centerX.equalTo(contentView.snp_centerX)
//            make.height.equalTo(18)
//        }
        contentView.addSubview(MessageBtn)
        MessageBtn.snp_makeConstraints { (make) -> Void in
            
            make.top.equalTo(10)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.bottom.equalTo(contentView.snp_bottom)
        }
        let topView = UIView()
        topView.backgroundColor = UIColor.init(red: 31/255, green: 172/255, blue: 224/255, alpha: 1)
        MessageBtn.addSubview(topView)
        topView.snp_makeConstraints { (make) -> Void in
            make.top .equalTo(MessageBtn.snp_top)
            make.left.right.equalTo(0)
            make.height.equalTo(10)
        }
        MessageBtn.addSubview(MessageTitle)
        MessageTitle.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(topView.snp_bottom)
            make.left.equalTo(10)
            make.right.equalTo(-60)
            make.height.equalTo(40)
            
        }
        MessageBtn.addSubview(MessageImage)
        MessageImage.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(MessageTitle.snp_top)
            make.left.equalTo(MessageTitle.snp_right)
            make.right.equalTo(-20)
            make.bottom.equalTo(MessageTitle.snp_bottom)
            
            
        }
        
        MessageBtn.addSubview(MessageDate)
        MessageDate.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(MessageTitle.snp_bottom)
            make.left.right.equalTo(MessageTitle)
            make.height.equalTo(20)
            
        }
        
        
        MessageBtn.addSubview(MessageLabel)
        MessageLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(MessageDate.snp_bottom).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
        }
 
        MessageBtn.addSubview(DetailImage)
        DetailImage.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(-12)
            make.width.height.equalTo(15)
            make.bottom.equalTo(contentView.snp_bottom).offset(-5)
        }
        MessageBtn.addSubview(MessageDetail)
        MessageDetail.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(12)
            make.centerY.equalTo(DetailImage)
        }
        
        let contextview  = UIView()
        contextview.backgroundColor = UIColor(white: 0.8, alpha: 1)
        MessageBtn.addSubview(contextview)
        contextview.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(DetailImage.snp_top).offset(-8)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(1)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
