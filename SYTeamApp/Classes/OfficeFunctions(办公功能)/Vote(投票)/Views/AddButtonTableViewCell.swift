//
//  AddButtonTableViewCell.swift
//  Vote
//
//  Created by mac on 16/4/6.
//  Copyright © 2016年 CH. All rights reserved.
//

import UIKit

class AddButtonTableViewCell: UITableViewCell {
    lazy var addItem: UIButton = {
        var add = UIButton()
        add.setTitle("+新建投票选项", forState: UIControlState.Normal)
        add.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        return add
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(addItem)
        selectionStyle = UITableViewCellSelectionStyle.None
        addItem.snp_makeConstraints{(make)->Void in
            make.height.equalTo(45)
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
        }
//        addItem.backgroundColor = UIColor.greenColor()
        contentView.backgroundColor = UIColor.whiteColor()
        let seprator1 = UIView()
        contentView.addSubview(seprator1)
        seprator1.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.5)
        seprator1.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            make.height.equalTo(1)
            
        }

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
