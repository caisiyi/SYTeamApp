//
//  UserTableChildViewCell.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/3/24.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class UserTableChildViewCell: UITableViewCell {
    var functionsmodel:Label?{
        didSet{
            imageView?.image = UIImage(named: "\(functionsmodel!.icon)")
            textLabel?.text = "\(functionsmodel!.name)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()

    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: reuseIdentifier)
        //selectionStyle = UITableViewCellSelectionStyle.None
        accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        

        
//        contentView.addSubview(leftLineView)
//        contentView.addSubview(rightLineView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
