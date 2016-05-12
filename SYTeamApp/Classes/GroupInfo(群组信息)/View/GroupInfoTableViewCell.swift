//
//  GroupInfoTableViewCell.swift
//  SYTeamApp
//
//  Created by mac on 16/4/14.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class GroupInfoTableViewCell: UITableViewCell {
    lazy var BackImage:UIView = {
        var back = UIView()
        return back
    }()
    lazy var GroupImage:UIImageView = {
        var groupimage = UIImageView()
        return groupimage
    }()
    lazy var GroupNum:UILabel = {
        var groupnum = UILabel()
        groupnum.text = "10086"
        return groupnum
    }()
    lazy var GroupDes:UILabel = {
        var groupdes = UILabel()
        groupdes.text = "福建师大"
        return groupdes
    }()
    lazy var GroupCate:UILabel = {
        var userage = UILabel()
        userage.text = "  天文学  "
        return userage
    }()
    lazy var GroupLable:UILabel = {
        var lable = UILabel()
        return lable
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
         contentView.addSubview(BackImage)
        selectionStyle = UITableViewCellSelectionStyle.None
         BackImage.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(300)
        }
        BackImage.backgroundColor = AppColor
        BackImage.addSubview(GroupImage)
        GroupImage.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(0)
            make.height.width.equalTo(100)
            make.top.equalTo(70)
        }
        GroupImage.image = UIImage(named:"wodefensi_2x")
        BackImage.addSubview(GroupNum)
        GroupNum.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(20)
            make.top.equalTo(GroupImage.snp_bottom).offset(10)
            make.height.equalTo(40)
        }
        GroupNum.sizeToFit()
        GroupNum.textColor = UIColor.whiteColor()
        
        BackImage.addSubview(GroupDes)
        GroupDes.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(20)
            make.top.equalTo(GroupNum.snp_bottom)
            make.height.equalTo(40)
        }
        GroupDes.sizeToFit()
        GroupDes.textColor = UIColor.whiteColor()
        
        BackImage.addSubview(GroupLable)
        GroupLable.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(20)
            make.top.equalTo(GroupDes.snp_bottom)
            make.height.equalTo(40)
        }
        GroupLable.sizeToFit()
        
        GroupLable.addSubview(GroupCate)
        GroupCate.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(10)
            make.centerY.equalTo(0)
        }
        GroupCate.sizeToFit()
        GroupCate.textColor = UIColor.whiteColor()
        GroupCate.backgroundColor = AppColor
        GroupCate.layer.cornerRadius = 10
        GroupCate.layer.masksToBounds = true
        GroupCate.font = UIFont.systemFontOfSize(12)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
