//
//  VoteListTableViewCell.swift
//  SYTeamApp
//
//  Created by mac on 16/4/12.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit
class VoteListTableViewCell: UITableViewCell {
    lazy var userImage:UIImageView = {
        var userimage = UIImageView()
        userimage.image = UIImage(named:"gerenzhuye_2x")
        return userimage
    }()
    lazy var userName:UILabel = {
        var name = UILabel()
        name.text = ""
        return name
    }()
    lazy var voteTitle: UILabel = {
        var title = UILabel()
        title.text = ""
        return title
    }()
    lazy var voteDate: UILabel = {
        var date = UILabel()
        date.text = ""
        return date
    }()
    lazy var voteState:UILabel = {
        var state = UILabel()
        state.text = "进行中"
        return state
    }()
    lazy var ifVoted: UILabel = {
        var ifvoted = UILabel()
        ifvoted.text = "未投"
        return ifvoted
    }()
   
    lazy var State:UIView = {
        var state = UIView()
        return state
    }()
    lazy var separator:UIView = {
        var sep = UIView()
        return  sep
    }()
    var voteInfo:VoteInfo?{
        didSet{
            
            userName.text = voteInfo?.username
            voteTitle.text = voteInfo?.voteTitle
            voteDate.text = voteInfo?.voteDate
            if let state = voteInfo?.voteState {
                voteState.text = state ? "进行中" : "结束"
            }
            if let state = voteInfo?.isVoted {
                ifVoted.text = state ? "已投" : "未投"
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(userImage)
        backgroundColor = AppGrayLineColor
        contentView.backgroundColor = UIColor.whiteColor()
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        contentView.snp_makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(12)
            make.bottom.equalTo(0)
        }
        selectionStyle = UITableViewCellSelectionStyle.None
        userImage.snp_makeConstraints { (make) -> Void in
            make.left.top.equalTo(10)
            make.height.width.equalTo(40)
        }
        contentView.addSubview(userName)
        userName.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(userImage.snp_bottom).offset(10)
            make.top.equalTo(10)
            make.centerY.equalTo(userImage)

        }
        userName.sizeToFit()
        userName.font = UIFont.systemFontOfSize(20)
        contentView.addSubview(voteDate)
        voteDate.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(-5)
            make.top.equalTo(10)
            make.centerY.equalTo(userImage)
        }
        voteDate.textColor = UIColor.grayColor()
        voteDate.font = UIFont.systemFontOfSize(12)
        contentView.addSubview(voteTitle)
        voteTitle.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(userImage.snp_bottom).offset(10)
            make.left.right.equalTo(10)
            make.height.equalTo(30)
        }
        contentView.addSubview(separator)
        separator.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(voteTitle.snp_bottom).offset(10)
            make.left.right.equalTo(0)
            make.height.equalTo(1)
        }
        separator.backgroundColor = AppGrayLineColor
        contentView.addSubview(State)
        State.snp_makeConstraints { (make) -> Void in
            make.left.right.equalTo(0)
            make.height.equalTo(50)
            make.top.equalTo(separator.snp_bottom)
        }
        State.addSubview(voteState)
        voteState.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(10)
            make.top.bottom.equalTo(0)
        }
        voteState.textColor = UIColor.grayColor()
        State.addSubview(ifVoted)
        ifVoted.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(-5)
            make.top.bottom.equalTo(0)
            make.centerY.equalTo(voteState)

        }
        ifVoted.font = UIFont.systemFontOfSize(12)
        ifVoted.textColor = UIColor.grayColor()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
