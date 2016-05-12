//
//  OtherTableViewCell.swift
//  SYTeamApp
//
//  Created by mac on 16/4/13.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class OtherTableViewCell: UITableViewCell {
    lazy var Name:UILabel = {
        var name = UILabel()
        return name
    }()
    lazy var Content:UILabel = {
        var content = UILabel()
        return content
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = UITableViewCellSelectionStyle.None
        contentView.addSubview(Name)
        accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        Name.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(10)
            make.top.equalTo(0)
            make.centerY.equalTo(0)
        }
        Name.textColor = UIColor.grayColor()
        Name.sizeToFit()
        Name.text = "asdasdsad"
        Name.font = UIFont.systemFontOfSize(20)
        contentView.addSubview(Content)
        Content.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(Name.snp_right).offset(20)
            make.top.equalTo(0)
            make.centerY.equalTo(0)

        }
        Content.font = UIFont.systemFontOfSize(20)
        Content.text = "asdasdsad"

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
