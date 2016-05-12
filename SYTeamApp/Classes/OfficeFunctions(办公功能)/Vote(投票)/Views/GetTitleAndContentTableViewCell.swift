//
//  GetTitleAndContentTableViewCell.swift
//  Vote
//
//  Created by mac on 16/4/9.
//  Copyright © 2016年 CH. All rights reserved.
//

import UIKit

class GetTitleAndContentTableViewCell: UITableViewCell {
    var voteInfo:VoteInfo?{
        didSet{
            userImage.image = UIImage(named:"gerenzhuye_2x")
            userName.text = voteInfo?.username
            voteTitle.text = voteInfo?.voteTitle
            voteDate.text = voteInfo?.voteDate
            voteDesc.text = voteInfo?.voteDes
            if let state = voteInfo?.voteState {
                voteState.text = state ? "进行中" : "结束"
            }
            if let state = voteInfo?.isVoted {
                ifVoted.text = state ? "已投" : "未投"
            }
            
            layoutIfNeeded()
        }
    }
    lazy var userImage:UIImageView = {
        var userimage = UIImageView()
        return userimage
    }()
    lazy var userName:UILabel = {
        var name = UILabel()
        name.text = "哈哈"
        
        return name
    }()
    lazy var voteDate: UILabel = {
        var date = UILabel()
        date.text = "04/12 19:30-04/19 00:00"
        return date
    }()
    lazy var voteState:UILabel = {
        var state = UILabel()
        state.text = "实名－已结束"
        
        return state
    }()
    lazy var ifVoted: UILabel = {
        var ifvoted = UILabel()
        ifvoted.text = "您已投"
        return ifvoted
    }()
    lazy var userInfo:UIView = {
        var info = UIView()
        return info
    }()
    lazy var voteTitle:UILabel = {
        var title = UILabel()
        
        title.numberOfLines = 0
        return title
    }()
    lazy var voteDesc:UILabel = {
        var content = UILabel()
        return content
    }()
    lazy var moreChoice: UITextField = {
       var morechoice = UITextField()
        return morechoice
    }()
    lazy var upLoadImage:UIImageView = {
        var ULimage = UIImageView()
        return ULimage
    }()
    
    lazy var state:UIView = {
        var state = UIView()
        return state
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func backRowHeight(voteInfo:VoteInfo?)->CGFloat{
        self.voteInfo = voteInfo
        return
            CGRectGetMaxY(moreChoice.frame)
    }
    let seprator1 = UIView()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = UITableViewCellSelectionStyle.None
        contentView.addSubview(userInfo)
        userInfo.snp_makeConstraints { (make) -> Void in
            make.left.right.top.equalTo(0)
            make.height.equalTo(50)
        }
        userInfo.addSubview(userImage)
        userImage.snp_makeConstraints { (make) -> Void in
            make.left.top.equalTo(10)
            make.height.width.equalTo(40)
        }
        userImage.image = UIImage(named: "我")
        userInfo.addSubview(userName)
        userName.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(userImage.snp_bottom).offset(10)
            make.top.equalTo(10)
            make.centerY.equalTo(userImage)
            
        }
        userName.sizeToFit()
        userName.font = UIFont.systemFontOfSize(20)
        userInfo.addSubview(voteDate)
        voteDate.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(-5)
            make.top.equalTo(10)
            make.centerY.equalTo(userImage)
        }
        voteDate.textColor = UIColor.grayColor()
        voteDate.font = UIFont.systemFontOfSize(12)

        contentView.addSubview(state)
        state.snp_makeConstraints { (make) -> Void in
            make.left.right.equalTo(0)
            make.height.equalTo(50)
            make.top.equalTo(userInfo.snp_bottom)
        }
        state.addSubview(voteState)
        voteState.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(10)
            make.top.bottom.equalTo(0)
        }
        voteState.textColor = UIColor.grayColor()
        state.addSubview(ifVoted)
        ifVoted.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(-5)
            make.top.bottom.equalTo(0)
            make.centerY.equalTo(voteState)
            
        }
        ifVoted.font = UIFont.systemFontOfSize(12)
        ifVoted.textColor = UIColor.grayColor()
        
        contentView.addSubview(seprator1)
        seprator1.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.5)
        seprator1.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(state.snp_bottom)
            make.height.equalTo(1)
        }

        contentView.addSubview(voteTitle)
        contentView.addSubview(voteDesc)
        voteTitle.font = UIFont.systemFontOfSize(20)
        voteDesc.font = UIFont.systemFontOfSize(16)
        voteTitle.textAlignment = NSTextAlignment.Center
        voteTitle.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(seprator1.snp_bottom)
            make.left.equalTo(0)
            make.width.equalTo(kScreenW)
        }
//        let seprator2 = UIView()
//        contentView.addSubview(seprator2)
//        seprator2.backgroundColor = UIColor.lightGrayColor()
//        seprator2.snp_makeConstraints { (make) -> Void in
//            make.left.equalTo(contentView)
//            make.right.equalTo(contentView)
//            make.top.equalTo(titleTextField.snp_bottom)
//            make.height.equalTo(2)
//            
//        }
        let paddingView = UILabel()
        paddingView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        paddingView.text = ""
        selectionStyle = UITableViewCellSelectionStyle.None
        moreChoice.enabled = false
        moreChoice.leftView = paddingView
        moreChoice.leftViewMode = UITextFieldViewMode.Always
        moreChoice.textColor = UIColor.redColor()
        
        voteDesc.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(20)
            make.right.equalTo(20)
            make.top.equalTo(voteTitle.snp_bottom)
            make.width.equalTo(kScreenW)

        }
        voteDesc.numberOfLines = 0
        let seprator2 = UIView()
        contentView.addSubview(seprator2)
        seprator2.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.5)

        seprator2.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
            make.top.equalTo(voteDesc.snp_bottom)
            make.height.equalTo(1)
            
        }
        contentView.addSubview(upLoadImage)
        upLoadImage.snp_makeConstraints { (make)-> Void in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(seprator2)
            make.height.equalTo(0)
        }
        upLoadImage.contentMode = UIViewContentMode.ScaleAspectFit
        contentView.addSubview(moreChoice)
        let seprator3 = UIView()
        contentView.addSubview(seprator3)
        seprator3.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.5)
        seprator3.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
            make.top.equalTo(upLoadImage.snp_bottom)
            make.height.equalTo(1)
            
        }

        moreChoice.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
            make.top.equalTo(seprator3.snp_bottom)
            make.height.equalTo(30)
        }
        let seprator4 = UIView()
        contentView.addSubview(seprator4)
        seprator4.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.5)
        seprator4.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
            make.top.equalTo(moreChoice.snp_bottom)
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
