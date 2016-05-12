//
//  GroupTableViewCell.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/3/25.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    var model:DDGroup?{
        didSet{
            if let model = model {
                iconImageView.image = UIImage(named: "wodefensi_2x")
                groupNameLabel.text = "\(model.groupName ?? "")"
                viceLabel.text = "\(model.groupDesc ?? "")"
            }
        }
    }
    lazy var lineView:UIView = {
        var view = UIView()
        view.backgroundColor = AppGrayLineColor
        return view
    }()
    lazy var groupNameLabel:UILabel = {
        var label = UILabel(textColor: UIColor.darkGrayColor(), font: UIFont.boldSystemFontOfSize(18))
        return label
    }()
    
    lazy var viceLabel:UILabel = {
        var label = UILabel(textColor: UIColor.redColor(), font: SmallTextFont)
        label.text = "测试部"
        return label
    }()
    
    
    lazy var membersCountLabel:UILabel = {
        var label = UILabel(textColor: UIColor.darkGrayColor(), font: UIFont.boldSystemFontOfSize(15))
        label.text = "0人"
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
        //selectionStyle = UITableViewCellSelectionStyle.None
        contentView.addSubview(lineView)
        contentView.addSubview(groupNameLabel)
        contentView.addSubview(viceLabel)
  //      contentView.addSubview(membersCountLabel)
        contentView.addSubview(iconImageView)
  //      contentView.addSubview(unReadCount)
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
        groupNameLabel.snp_makeConstraints { (make) in
            make.top.equalTo(contentView.snp_centerY).offset(5)
            make.left.equalTo(iconImageView.snp_right).offset(12)
        }
        viceLabel.snp_makeConstraints { (make) in
            make.bottom.equalTo(contentView.snp_centerY).offset(-5)
            make.left.equalTo(iconImageView.snp_right).offset(12)
        }
//        membersCountLabel.snp_makeConstraints { (make) in
//            make.top.equalTo(contentView.snp_centerY).offset(5)
//            make.left.equalTo(iconImageView.snp_right).offset(12)
//            
//        }
//        unReadCount.snp_makeConstraints { (make) in
//            make.right.equalTo(-12)
//            make.width.greaterThanOrEqualTo(24)
//            make.height.greaterThanOrEqualTo(18)
//            make.centerY.equalTo(contentView)
//            unReadCount.layer.cornerRadius = 8
//        }
        
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
