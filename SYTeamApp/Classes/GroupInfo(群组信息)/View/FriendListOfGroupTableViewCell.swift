//
//  FriendListOfGroupTableViewCell.swift
//  SYTeamApp
//
//  Created by mac on 16/4/15.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class FriendListOfGroupTableViewCell: UITableViewCell {
    lazy var UserImage: UIImageView = {
        var userimage = UIImageView()
        return userimage
    }()
    lazy var UserInfo: UILabel = {
        var info = UILabel()
        return info
    }()
    var chSelected: Bool = false{
        didSet{
            if chSelected == true{
                accessoryType = UITableViewCellAccessoryType.Checkmark
            }else{
                accessoryType = UITableViewCellAccessoryType.None
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(UserImage)
        selectionStyle = UITableViewCellSelectionStyle.None
        UserImage.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(15)
            make.top.equalTo(15)
            make.width.width.equalTo(70)
            make.centerY.equalTo(contentView)
        }
        UserImage.image = UIImage(named: "gerenzhuye_2x")
        UserImage.layer.cornerRadius = 35
        UserImage.layer.masksToBounds = true
        contentView.addSubview(UserInfo)
        UserInfo.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(UserImage.snp_right).offset(15)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.right.equalTo(-15)
        }
        UserInfo.text = "哈哈"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
