//
//  FirstTableViewCell.swift
//  PersonInformation
//
//  Created by MAC on 16/4/12.
//  Copyright © 2016年 MAC. All rights reserved.
//

import UIKit

class HeadTableViewCell: UITableViewCell {
 
    lazy var HeadLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.blackColor()
        label.text = "头像"
        return label
        
        }()
    lazy var HeadImage : UIImageView = {
        let image = UIImageView()
        
       
        image.image = UIImage(named: "3最热")
        return image
        
        }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        //self.selectionStyle = UITableViewCellSelectionStyle.None
        contentView.addSubview(HeadLabel)
        HeadLabel.snp_makeConstraints { (make) -> Void in
            make.top.bottom.equalTo(0)
            make.left.equalTo(20)
            make.right.equalTo(-120)
        }
        contentView.addSubview(HeadImage)
        HeadImage.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
            make.right.equalTo(-10)
            make.width.equalTo(HeadImage.snp_height)
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
