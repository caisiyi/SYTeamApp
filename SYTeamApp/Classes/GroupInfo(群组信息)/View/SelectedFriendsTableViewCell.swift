//
//  SelectedFriendsTableViewCell.swift
//  SYTeamApp
//
//  Created by mac on 16/4/15.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class SelectedFriendsTableViewCell: UITableViewCell {
    lazy var UserImage:UIImageView = {
        var userimg = UIImageView()
        return userimg
    }()
    lazy var UserName:UILabel = {
        var username = UILabel()
        return username
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(UserImage)
        selectionStyle = UITableViewCellSelectionStyle.None
        UserImage.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(10)
            make.centerY.equalTo(contentView)
            make.height.width.equalTo(60)
        }
        UserImage.image = UIImage(named: "gerenzhuye_2x")
        UserImage.layer.cornerRadius = 30
        UserImage.layer.masksToBounds = true
        contentView.addSubview(UserName)
        UserName.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(UserImage.snp_right).offset(20)
            make.right.equalTo(-10)
            make.top.equalTo(10)
            make.centerY.equalTo(contentView)
        }
        UserName.font = UIFont.systemFontOfSize(20)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
