//
//  ItemsTableViewCell.swift
//  Vote
//
//  Created by mac on 16/4/5.
//  Copyright © 2016年 CH. All rights reserved.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {
    lazy var itemsContent: UITextField = {
        var item = UITextField()
        item.placeholder = "请输入内容"
        return item
    }()
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(itemsContent)
        let seprator1 = UIView()
        contentView.addSubview(seprator1)
        seprator1.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.5)
        seprator1.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
            make.top.equalTo(contentView.snp_bottom)
            make.height.equalTo(1)
            
        }
        let paddingView = UILabel()
        paddingView.frame = CGRect(x: 0, y: 0, width: 25, height: 60)
        paddingView.text = "  •"
        paddingView.textColor = UIColor.blueColor()
        selectionStyle = UITableViewCellSelectionStyle.None
        itemsContent.leftView = paddingView
        itemsContent.leftViewMode = UITextFieldViewMode.Always
        itemsContent.snp_makeConstraints{(make)->Void in
            make.right.equalTo(contentView)
            make.height.equalTo(45)
            make.left.equalTo(contentView)
            make.top.equalTo(contentView).offset(2)
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
    