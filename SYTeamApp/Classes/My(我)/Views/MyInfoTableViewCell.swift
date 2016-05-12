//
//  MyInfoTableViewCell.swift
//  SYTeamApp
//
//  Created by mac on 16/4/12.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class MyInfoTableViewCell: UITableViewCell {

    lazy var Userimage:UIImageView = {
        var userimage = UIImageView()
        return userimage
    }()
    lazy var UserName:UILabel = {
        var name = UILabel()
        return name
    }()
    lazy var UserNumber:UILabel = {
        var number = UILabel()
        return number
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
//        imageView?.image = UIImage(named: "6挑战")
//        let itemSize = CGSizeMake(70, 70);
//        
//        UIGraphicsBeginImageContext(itemSize);
//        
//        let imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
//        
//        imageView?.image?.drawInRect(imageRect)
//        imageView?.image = UIGraphicsGetImageFromCurrentImageContext()
////        [cell.imageView.image drawInRect:imageRect];
////        
////        cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();

        Userimage.userInteractionEnabled = false
        contentView.addSubview(Userimage)
        Userimage.snp_makeConstraints { (make)-> Void in
            make.left.equalTo(12)
            make.width.height.equalTo(70)
            make.centerY.equalTo(contentView)
        }
        contentView.addSubview(UserName)
        UserName.snp_makeConstraints { (make)-> Void in
            make.left.equalTo(Userimage.snp_right).offset(20)
            make.top.equalTo(20)
        }
        UserName.font = UIFont.systemFontOfSize(20)
        UserName.sizeToFit()
        contentView.addSubview(UserNumber)
        UserNumber.snp_makeConstraints { (make)-> Void in
            make.bottom.equalTo(-20)
            make.left.equalTo(Userimage.snp_right).offset(20)
        }
        UserNumber.sizeToFit()
        UserNumber.font = UIFont.systemFontOfSize(20)

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
