//
//  SecondTableViewCell.swift
//  PersonInformation
//
//  Created by MAC on 16/4/12.
//  Copyright © 2016年 MAC. All rights reserved.
//

import UIKit

class BlankTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        //selectionStyle = UITableViewCellSelectionStyle.None
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
