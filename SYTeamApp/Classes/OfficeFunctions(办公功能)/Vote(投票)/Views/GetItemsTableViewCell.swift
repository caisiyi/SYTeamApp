//
//  GetItemsTableViewCell.swift
//  Vote
//
//  Created by mac on 16/4/9.
//  Copyright © 2016年 CH. All rights reserved.
//

import UIKit

class GetItemsTableViewCell: UITableViewCell {
    lazy var itemsContent: UITextField = {
        var item = UITextField()
        return item
    }()
    
    var chSelected: Bool = false{
        didSet{
            if chSelected == true{
            accessoryType = UITableViewCellAccessoryType.Checkmark
            }else{
            accessoryType = UITableViewCellAccessoryType.None
            }
        }
    }
    
  
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(itemsContent)
        selectionStyle = UITableViewCellSelectionStyle.None
//        let seprator1 = UIView()
//        contentView.addSubview(seprator1)
//        seprator1.backgroundColor = UIColor.lightGrayColor()
//        seprator1.snp_makeConstraints { (make) -> Void in
//            make.left.equalTo(contentView)
//            make.right.equalTo(contentView)
//            make.top.equalTo(contentView.snp_bottom)
//            make.height.equalTo(2)
//            
//        }
        let paddingView = UILabel()
        paddingView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        paddingView.text = "  •"
        paddingView.textColor = UIColor.blueColor()

        selectionStyle = UITableViewCellSelectionStyle.None
        itemsContent.enabled = false
        itemsContent.leftView = paddingView
        itemsContent.leftViewMode = UITextFieldViewMode.Always
        itemsContent.snp_makeConstraints{(make)->Void in
            make.right.equalTo(contentView)
            make.height.equalTo(45)
            make.left.equalTo(contentView)
            make.centerY.equalTo(contentView)
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
