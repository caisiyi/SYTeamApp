//
//  MessageTableViewCell.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/4/7.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    var model:EMConversation?{
        didSet{
            if let model = model {
                if model.type == EMConversationTypeGroupChat {
                iconImageView.image = UIImage(named: "wodefensi_2x")
                let query = AVQuery(className: "GroupList")
                query.whereKey("groupId", equalTo: model.conversationId)
                query.getFirstObjectInBackgroundWithBlock({ (object, error) in
                    if object != nil {
                        self.messageLabel.text =  object.objectForKey("groupName") as? String
                    }else{
                        self.messageLabel.text = model.conversationId
                    }
                })
                }else{
                    self.iconImageView.image = UIImage(named: "gerenzhuye_2x")
                    self.messageLabel.text = model.conversationId
                }
                if model.latestMessage != nil {
                    var timestamp = model.latestMessage.timestamp
                    if timestamp > 140000000000 {
                        timestamp = timestamp / 1000
                    }
                    timeLabel.text = NSDate(timeIntervalSince1970: Double(timestamp)).timePassed()
                    
                if model.latestMessage.body.type == EMMessageBodyTypeText {
                    let message = model.latestMessage.body as! EMTextMessageBody
                    contentLabel.text = message.text
                }else{
                    contentLabel.text = "[图片]"
                }
                }else{
                    contentLabel.text = "暂无消息"
                    timeLabel.text = ""
                }
                
                if  model.unreadMessagesCount != 0 {
                    unReadCount.hidden = false
                    unReadCount.text = "\(model.unreadMessagesCount)"
                }else{
                    unReadCount.hidden = true
                }
             
            }
        }
    }
    lazy var lineView:UIView = {
        var view = UIView()
        view.backgroundColor = AppGrayLineColor
        return view
    }()
    lazy var messageLabel:UILabel = {
        var label = UILabel(textColor: UIColor.blackColor(), font: UIFont.boldSystemFontOfSize(18))
        label.text = ""
        return label
    }()
    
    lazy var timeLabel:UILabel = {
        var label = UILabel(textColor: UIColor.darkGrayColor(), font: SmallTextFont)
        label.text = ""
        return label
    }()
    
    
    lazy var contentLabel:UILabel = {
        var label = UILabel(textColor: UIColor.darkGrayColor(), font: UIFont.systemFontOfSize(15))
        return label
    }()
    
    lazy var iconImageView:UIImageView = {
        var imageView = UIImageView()
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var unReadCount:UILabel = {
        var label = UILabel(textColor: UIColor.whiteColor(), font: UIFont.systemFontOfSize(11))
        label.backgroundColor = UIColor.redColor()
        label.layer.masksToBounds = true
        label.textAlignment = .Center
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = UITableViewCellSelectionStyle.None
        contentView.addSubview(lineView)
        contentView.addSubview(messageLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(contentLabel)
        contentView.addSubview(iconImageView)
        contentView.addSubview(unReadCount)
        
        lineView.snp_makeConstraints { (make) in
            make.left.equalTo(iconImageView.snp_right).offset(12)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            make.height.equalTo(1)
        }
        iconImageView.snp_makeConstraints { (make) in
            make.left.top.equalTo(12)
            make.height.width.equalTo(56)
            iconImageView.layer.cornerRadius = 28
        }
        messageLabel.snp_makeConstraints { (make) in
            make.bottom.equalTo(contentView.snp_centerY).offset(-5)
            make.left.equalTo(iconImageView.snp_right).offset(12)
            
        }
        contentLabel.snp_makeConstraints { (make) in
            make.top.equalTo(contentView.snp_centerY).offset(5)
            make.left.equalTo(iconImageView.snp_right).offset(12)
            
        }
        timeLabel.snp_makeConstraints { (make) in
            make.right.equalTo(-12)
            make.centerY.equalTo(messageLabel)
        }
        unReadCount.snp_makeConstraints { (make) in
            make.right.equalTo(timeLabel)
            make.width.greaterThanOrEqualTo(24)
            make.height.greaterThanOrEqualTo(18)
            make.centerY.equalTo(contentLabel)
            unReadCount.layer.cornerRadius = 8
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }


}
