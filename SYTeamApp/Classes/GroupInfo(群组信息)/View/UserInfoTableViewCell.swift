//
//  UserInfoTableViewCell.swift
//  Organization
//
//  Created by mac on 16/4/10.
//  Copyright © 2016年 CH. All rights reserved.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {
    lazy var GroupNameAndNumberView:UIView = {
       var nameAndNumber = UIView()
        return nameAndNumber
    }()
    lazy var GroupNameLablel:UILabel = {
        var name = UILabel()
        return name
    }()
    lazy var GroupNumberLable: UILabel = {
        var number = UILabel()
        return number
    }()
    lazy var GroupLableView: UIView = {
        var GroupLable = UIView()
        return GroupLable
    }()
    lazy var GroupDes: UILabel = {
        var Des = UILabel()
        return Des
    }()
    lazy var GroupMemberNumberLale:UILabel = {
        var memberNumber = UILabel()
        return memberNumber
    }()
    lazy var NumberLeft: UILabel = {
        var left = UILabel()
        left.text = "("
        left.font = UIFont.systemFontOfSize(20)

        left.textColor = UIColor.lightGrayColor()
        return left
    }()
    lazy var NumberRight: UILabel = {
        var right = UILabel()
        right.text = ")"
        right.font = UIFont.systemFontOfSize(20)

        right.textColor = UIColor.lightGrayColor()

        return right
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = UITableViewCellSelectionStyle.None
        contentView.addSubview(GroupNameAndNumberView)
        GroupNameAndNumberView.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(contentView).dividedBy(3)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(0)
        }
        GroupNameAndNumberView.addSubview(GroupNameLablel)
        GroupNameLablel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(2)
            make.left.equalTo(5)
        }
        GroupNameLablel.sizeToFit()
        GroupNameLablel.text = "旋风女汉子"
        GroupNameLablel.font = UIFont.systemFontOfSize(20)
        GroupNameAndNumberView.addSubview(NumberLeft)
        GroupNameAndNumberView.addSubview(GroupNumberLable)
        GroupNameAndNumberView.addSubview(NumberRight)
        NumberLeft.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(GroupNameLablel.snp_right)
            make.top.equalTo(2)
            make.width.equalTo(5)
        }
        GroupNumberLable.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(NumberLeft.snp_right)
            make.top.equalTo(2)
        }
        GroupNumberLable.sizeToFit()
        GroupNumberLable.textColor = UIColor.lightGrayColor()
        GroupNumberLable.text = "10086"
        GroupNumberLable.font = UIFont.systemFontOfSize(20)

        GroupNameAndNumberView.addSubview(NumberRight)
        NumberRight.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(GroupNumberLable.snp_right)
            make.width.equalTo(5)
            make.top.equalTo(2)
        }
        contentView.addSubview(GroupLableView)
        GroupLableView.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(contentView).dividedBy(3)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(GroupNameAndNumberView.snp_bottom)
        }
        GroupLableView.addSubview(GroupMemberNumberLale)
                let memberNumberImage:UILabel = UILabel()
        GroupLableView.addSubview(memberNumberImage)
        memberNumberImage.text = "👤"
        memberNumberImage.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(3)
            make.left.equalTo(5)
        }
        memberNumberImage.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.3)
        memberNumberImage.sizeToFit()
        GroupMemberNumberLale.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(3)
            make.left.equalTo(memberNumberImage.snp_right)
        }

        GroupMemberNumberLale.text = "100"
        GroupMemberNumberLale.textColor = UIColor.whiteColor()
        GroupMemberNumberLale.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.3)
        GroupMemberNumberLale.sizeToFit()
        contentView.addSubview(GroupDes)
        GroupDes.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(contentView).dividedBy(3)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(GroupLableView.snp_bottom)
        }
        GroupDes.text = "有兴趣的加群！"
        GroupDes.textColor = UIColor.grayColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
