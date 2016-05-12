//
//  SwitchTableViewCell.swift
//  Vote
//
//  Created by mac on 16/4/6.
//  Copyright © 2016年 CH. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    lazy var MoreChoiceLable:UILabel = {
        var choice = UILabel()
        choice.text = "支持多选"
        choice.textAlignment = NSTextAlignment.Center
        return choice
    }()
    
    lazy var MoreChoiceView:UIView = {
        var choice = UIView()
        return choice
    }()

    lazy var moreChoiceSwitch:UISwitch = {
        var morechoice = UISwitch()
        return morechoice
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let seprator4 = UIView()
        contentView.addSubview(seprator4)
        seprator4.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.2)
        seprator4.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
            make.top.equalTo(contentView)
            make.height.equalTo(20)
            
        }
        MoreChoiceView.addSubview(MoreChoiceLable)
        selectionStyle = UITableViewCellSelectionStyle.None
        
//        MoreChoiceView.backgroundColor = UIColor.greenColor()
        MoreChoiceLable.snp_makeConstraints{(make)-> Void in
            make.left.equalTo(MoreChoiceView).inset(20)
            make.top.equalTo(MoreChoiceView).inset(5)
            make.bottom.equalTo(MoreChoiceView).inset(5)
            make.right.equalTo(MoreChoiceView).inset(kScreenW-120)
        }
//        MoreChoiceLable.backgroundColor = UIColor.orangeColor()
        moreChoiceSwitch.onTintColor = UIColor.blueColor()
        
        MoreChoiceView.addSubview(moreChoiceSwitch)
        moreChoiceSwitch.snp_makeConstraints{(make)->Void in
            
            make.right.equalTo(MoreChoiceView).inset(20)
            make.height.equalTo(30)
            make.width.equalTo(50)
            make.top.equalTo(MoreChoiceView).inset(10)
            make.bottom.equalTo(MoreChoiceView).inset(10)
        }
//        moreChoiceSwitch.backgroundColor = UIColor.brownColor()
        contentView.addSubview(MoreChoiceView)
        MoreChoiceView.snp_makeConstraints{(make)->Void in
            make.right.equalTo(contentView)
            make.left.equalTo(contentView)
            make.top.equalTo(seprator4.snp_bottom)
            make.height.equalTo(50)
        }
        
        let seprator5 = UIView()
        contentView.addSubview(seprator5)
        seprator5.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.5)
        seprator5.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
            make.top.equalTo(MoreChoiceView.snp_bottom)
            make.height.equalTo(1)
            
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
