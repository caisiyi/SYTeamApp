//
//  UserTableViewCell.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/3/24.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
//    lazy var doingDoneBtn:BlockButton = {
//        let button = BlockButton(image: UIImage(named: "我")!, text: " 今天 ", textColor: TextColor, fontSize: 14)
//        return button
//    }()
//    lazy var didDoneBtn:BlockButton = {
//        let button = BlockButton(image: UIImage(named: "我")!, text: " 同事圈 ", textColor: TextColor, fontSize: 14)
//        return button
//    }()
//    lazy var waitCommentBtn:BlockButton = {
//        let button = BlockButton(image: UIImage(named: "我")!, text: " CRM ", textColor: TextColor, fontSize: 14)
//        return button
//    }()
//    
//    lazy var rightLineView:UIView = {
//        var view = UIView()
//        view.backgroundColor = AppGrayLineColor
//        return view
//    }()
//    
//    
//    
//    lazy var leftLineView:UIView = {
//        var view = UIView()
//        view.backgroundColor = AppGrayLineColor
//        return view
//    }()
//    
//    lazy var bottomLineView:UIView = {
//        var view = UIView()
//        view.backgroundColor = AppGrayLineColor
//        return view
//    }()
    lazy var UserInfoView: UIView = {
        var userinfo = UIView()
        return  userinfo
    }()
    lazy var UserImage: UIImageView = {
        var userImage = UIImageView()
        return userImage
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        doingDoneBtn.snp_makeConstraints { (make) -> Void in
//            make.centerX.equalTo(self).offset(-WScreen / 3)
//            make.centerY.equalTo(self)
//        }
//        doingDoneBtn.centerLabelVerticallyWithPadding()
//        
//        didDoneBtn.snp_makeConstraints { (make) -> Void in
//            make.centerX.equalTo(self)
//            make.centerY.equalTo(self)
//        }
//        didDoneBtn.centerLabelVerticallyWithPadding()
        
//        waitPutBtn.snp_makeConstraints { (make) -> Void in
//            make.centerX.equalTo(self).offset(WScreen / 8)
//            make.centerY.equalTo(self)
//        }
//        waitPutBtn.centerLabelVerticallyWithPadding()
        
//        waitCommentBtn.snp_makeConstraints { (make) -> Void in
//            make.centerX.equalTo(self).offset(WScreen /  3)
//            make.centerY.equalTo(self)
//        }
//        waitCommentBtn.centerLabelVerticallyWithPadding()
//        
//        rightLineView.snp_makeConstraints { (make) -> Void in
//            make.centerX.equalTo(self).offset(WScreen /  6)
//            make.centerY.equalTo(self)
//            make.top.equalTo(8)
//            make.bottom.equalTo(-8)
//            make.width.equalTo(1)
//        }
//        
//        leftLineView.snp_makeConstraints { (make) -> Void in
//            make.centerX.equalTo(self).offset(-WScreen /  6)
//            make.centerY.equalTo(self)
//            make.top.equalTo(8)
//            make.bottom.equalTo(-8)
//            make.width.equalTo(1)
//        }
//        
//        bottomLineView.snp_makeConstraints { (make) -> Void in
//            make.right.left.equalTo(0)
//            make.bottom.equalTo(0)
//            make.height.equalTo(1)
//        }
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: reuseIdentifier)
        selectionStyle = UITableViewCellSelectionStyle.None
        contentView.addSubview(UserInfoView)
        UserInfoView.snp_makeConstraints { (make) -> Void in
            make.left.right.top.bottom.equalTo(0)
        }
        UserInfoView.addSubview(UserImage)
        UserImage.snp_makeConstraints { (make) in
            make.top.equalTo(5)
            make.left.equalTo(5)
            make.bottom.equalTo(5)
            make.width.equalTo(50)
        }
        
//        contentView.addSubview(doingDoneBtn)
//        contentView.addSubview(didDoneBtn)
//   //     contentView.addSubview(waitPutBtn)
//        contentView.addSubview(waitCommentBtn)
//        contentView.addSubview(rightLineView)
//        contentView.addSubview(leftLineView)
//        contentView.addSubview(bottomLineView)
//        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
