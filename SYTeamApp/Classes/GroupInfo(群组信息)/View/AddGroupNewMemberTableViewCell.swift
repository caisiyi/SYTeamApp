//
//  AddGroupNewMemberTableViewCell.swift
//  SYTeamApp
//
//  Created by mac on 16/4/14.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class AddGroupNewMemberTableViewCell: UITableViewCell {
    lazy var AddMemberLable:UILabel = {
        var add = UILabel()
        return add
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(AddMemberLable)
        AddMemberLable.snp_makeConstraints { (make) -> Void in
            make.left.top.bottom.right.equalTo(0)
        }
        AddMemberLable.text = "     邀请同事"
        AddMemberLable.font = UIFont.systemFontOfSize(20)
        selectionStyle = UITableViewCellSelectionStyle.None
        accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
