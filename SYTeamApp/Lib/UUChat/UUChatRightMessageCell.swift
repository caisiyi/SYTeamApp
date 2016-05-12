//
//  UUChatRightMessageCell.swift
//  UUChatTableViewSwift
//
//  Created by XcodeYang on 8/13/15.
//  Copyright © 2015 XcodeYang. All rights reserved.
//

import UIKit

class UUChatRightMessageCell: UITableViewCell {

    internal var dateLabel: UILabel!
    internal var headImageView: UIButton!
    internal var nameLabel: UILabel!
    internal var contentButton: UIButton!
    internal var contentLabel: UILabel!
    
    var imageHeightConstraint: NSLayoutConstraint!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
        // 日期
        dateLabel = UILabel()
        contentView.addSubview(dateLabel)
        dateLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
        dateLabel.textColor = UIColor.grayColor()
        dateLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(contentView)
            make.centerX.equalTo(contentView)
        }
        
        // 头像
        headImageView = UIButton()
        contentView.addSubview(headImageView)
//        headImageView.layer.borderWidth = 4
//        headImageView.layer.borderColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.5).CGColor
//        headImageView.layer.cornerRadius = 25
//        headImageView.clipsToBounds = true
//        headImageView.setImage(UIImage(named: "gerenzhuye_2x"), forState: UIControlState.Normal)
        headImageView.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.trailing.equalTo(-10)
            make.top.equalTo(dateLabel).offset(24)
        }

        // 内容frame辅助
        contentLabel = UILabel()
        contentView.addSubview(contentLabel)
        contentLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        contentLabel.numberOfLines = 0
        contentLabel.textColor = UIColor.whiteColor()
        contentLabel.snp_makeConstraints { (make) -> Void in
            make.trailing.equalTo(-90)
            make.width.lessThanOrEqualTo(contentView).multipliedBy(0.6)
            make.top.equalTo(headImageView).offset(10)
            make.bottom.equalTo(-20).priorityLow()
        }
        // 内容视图
        contentButton = UIButton()
        contentView.insertSubview(contentButton, belowSubview: contentLabel)
        contentButton.imageView?.contentMode = .ScaleAspectFill
        contentButton.setBackgroundImage(UIImage(named: "right_message_back"), forState: .Normal)
        contentButton.snp_makeConstraints { (make) -> Void in
            make.trailing.equalTo(contentView).offset(-70)
            make.left.equalTo(contentLabel.snp_left).offset(-10)
            make.top.equalTo(headImageView)
            make.bottom.equalTo(contentLabel.snp_bottom).offset(10)
        }
        
        // temporary method
        imageHeightConstraint = NSLayoutConstraint(
            item: contentButton,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.LessThanOrEqual,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: 1000
        )
        imageHeightConstraint.priority = UILayoutPriorityRequired
        contentButton.addConstraint(imageHeightConstraint)

    }
    var model:UUChatModel? {
        didSet{
            headImageView.setBackgroundImage(UIImage(named: "gerenzhuye_2x"), forState: .Normal)
            if model!.time == "" {
                headImageView.snp_updateConstraints(closure: { (make) in
                    make.top.equalTo(dateLabel)
                })
            }else{
                headImageView.snp_updateConstraints(closure: { (make) in
                    make.top.equalTo(dateLabel).offset(24)
                })
            }
            dateLabel.text = model!.time
            switch model!.messageType {
            case UUChatMessageType.Text:
                self.contentLabel.text = model!.text
                self.headImageView.setImage(model!.headImage, forState: .Normal)
                self.contentButton.setImage(nil, forState: UIControlState.Normal)
                break
            case .Image:
                self.contentLabel.text = ""
                
                if model!.image != nil {
                    self.contentButton.setImage(model?.image, forState: .Normal)
                }else{
                    let image = UIImageView(image: UIImage(named: "灰底"))
                    image.frame.size = CGSize(width: UIScreen.mainScreen().bounds.size.width*0.6, height: UIScreen.mainScreen().bounds.size.width*0.6)
                    self.contentButton.sd_setImageWithURL(NSURL(string: model!.imageUrl!), forState: UIControlState.Normal, placeholderImage: image.image)
                }
                self.imageHeightConstraint.constant = UIScreen.mainScreen().bounds.size.width*0.6
                break
            case .Voice:
                
                break
            default:
                break
            }
            layoutIfNeeded()
        }
    }

}
