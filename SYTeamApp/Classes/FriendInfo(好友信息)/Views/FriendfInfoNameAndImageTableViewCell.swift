//
//  FriendfInfoNameAndImageTableViewCell.swift
//  SYTeamApp
//
//  Created by mac on 16/4/13.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class FriendfInfoNameAndImageTableViewCell: UITableViewCell {
    lazy var BackImage:UIImageView = {
        var back = UIImageView()
        return back
    }()
    lazy var UserImage:UIImageView = {
        var userimage = UIImageView()
        userimage.image = UIImage(named:"gerenzhuye_2x")
        userimage.backgroundColor = UIColor.whiteColor()
        return userimage
    }()
    lazy var userName:UILabel = {
        var username = UILabel()
        username.text = "哈哈"
        return username
    }()
    lazy var userSex:UILabel = {
        var usersex = UILabel()
        usersex.text = "男"
        return usersex
    }()
    lazy var userAge:UILabel = {
        var userage = UILabel()
        userage.text = "20"
        return userage
    }()
    lazy var userAddress:UILabel = {
        var useraddress = UILabel()
        useraddress.text = "福州"
        return useraddress
    }()
    lazy var  InfoView:UIView = {
        var info = UIView()
        return info
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
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(300)
        }
        BackImage.backgroundColor = AppColor
        contentView.addSubview(UserImage)
        UserImage.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(BackImage.snp_bottom)
            make.height.equalTo(100)
            make.width.equalTo(100)
            make.left.equalTo(20)
        }
        UserImage.layer.cornerRadius = 50
        UserImage.layer.masksToBounds = true
        contentView.addSubview(InfoView)
        InfoView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(BackImage.snp_bottom)
            make.left.equalTo(140)
            make.right.equalTo(0)
            make.height.equalTo(100)
        }
        InfoView.addSubview(userName)
        userName.snp_makeConstraints { (make)  -> Void in
            make.left.equalTo(0)
            make.top.equalTo(20)
            make.height.equalTo(30)
        }
        userName.font = UIFont.systemFontOfSize(20)
        userName.sizeToFit()
        
        
        InfoView.addSubview(userSex)
        userSex.snp_makeConstraints { (make)  -> Void in
            make.left.equalTo(0)
            make.top.equalTo(userName.snp_bottom)
            make.height.equalTo(30)
        }
        userSex.font = UIFont.systemFontOfSize(16)
        userSex.sizeToFit()
        InfoView.addSubview(userAge)
        userAge.snp_makeConstraints { (make)  -> Void in
            make.left.equalTo(userSex.snp_right).offset(10)
            make.centerY.equalTo(userSex)
            make.height.equalTo(30)
        }
        userAge.font = UIFont.systemFontOfSize(16)
        userAge.sizeToFit()
        InfoView.addSubview(userAddress)
        userAddress.snp_makeConstraints { (make)  -> Void in
            make.left.equalTo(userAge.snp_right).offset(10)
            make.centerY.equalTo(userSex)
            make.height.equalTo(30)
        }
        userAddress.font = UIFont.systemFontOfSize(16)
        userAddress.sizeToFit()


    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
