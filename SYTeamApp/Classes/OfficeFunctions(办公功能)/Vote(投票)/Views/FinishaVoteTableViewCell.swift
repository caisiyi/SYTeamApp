//
//  FinishaVoteTableViewCell.swift
//  Vote
//
//  Created by mac on 16/4/9.
//  Copyright © 2016年 CH. All rights reserved.
//

import UIKit

class FinishaVoteTableViewCell: UITableViewCell {
    lazy var FinishVote: UIButton = {
        var finish = UIButton()
        finish.setTitle("我要投票", forState: UIControlState.Normal)
        finish.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        return finish
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let seprator1 = UIView()
        contentView.addSubview(seprator1)
        seprator1.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.5)
        seprator1.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
            make.top.equalTo(0)
            make.height.equalTo(1)
            
        }

        contentView.addSubview(FinishVote)
        selectionStyle = UITableViewCellSelectionStyle.None
        FinishVote.snp_makeConstraints{(make)->Void in
            make.top.equalTo(seprator1.snp_bottom)
            make.height.equalTo(45)
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
        }
//        FinishVote.backgroundColor = UIColor.greenColor()
        contentView.backgroundColor = UIColor.whiteColor()
        let seprator2 = UIView()
        contentView.addSubview(seprator2)
        seprator2.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.5)
        seprator2.snp_makeConstraints { (make) -> Void in
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
