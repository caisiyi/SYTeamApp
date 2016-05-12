//
//  MessageTableHeadViewCell.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/5/6.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class MessageTableHeadViewCell: UITableViewCell {
    lazy var lineView:UIView = {
        var view = UIView()
        view.backgroundColor = AppGrayLineColor
        return view
    }()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = UITableViewCellSelectionStyle.None
        imageView?.image = UIImage(named: "wodejianzheng_2x")
        contentView.addSubview(lineView)
        lineView.snp_makeConstraints { (make) in
            make.left.right.equalTo(0)
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
