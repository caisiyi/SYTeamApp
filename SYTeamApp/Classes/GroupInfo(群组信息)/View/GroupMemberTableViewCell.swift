//
//  GroupMemberTableViewCell.swift
//  SYTeamApp
//
//  Created by mac on 16/4/14.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class GroupMemberTableViewCell: UITableViewCell {
    
    lazy var NameLable:UILabel = {
        var name = UILabel()
        return name
    }()
    lazy var NameText:UILabel = {
        var name = UILabel()
        return name
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(NameLable)
        selectionStyle = UITableViewCellSelectionStyle.None
        accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        NameLable.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(10)
            make.centerY.equalTo(0)

        }
        contentView.addSubview(NameText)

        NameText.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(-10)
            make.centerY.equalTo(0)
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
