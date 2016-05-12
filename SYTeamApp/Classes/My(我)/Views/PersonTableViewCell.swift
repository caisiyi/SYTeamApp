
//
//  PersonTableViewCell.swift
//  PersonInformation
//
//  Created by MAC on 16/4/12.
//  Copyright © 2016年 MAC. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    lazy var LeftLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.blackColor()
        
        return label
        }()
    lazy var RightLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(white: 0.8, alpha: 1)
        label.textAlignment = NSTextAlignment.Right
        return label
        }()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
       // self.selectionStyle = UITableViewCellSelectionStyle.None
        contentView.addSubview(LeftLabel)
        LeftLabel.snp_makeConstraints { (make) -> Void in
            make.top.bottom.equalTo(0)
            make.left.equalTo(20)
            make.width.equalTo(contentView.frame.width/2)
        }
        contentView.addSubview(RightLabel)
        RightLabel.snp_makeConstraints { (make) -> Void in
            make.top.bottom.equalTo(0)
            make.right.equalTo(-10)
            make.width.equalTo(120)
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
