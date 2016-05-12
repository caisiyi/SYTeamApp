//
//  GroupMemberImageTableViewCell.swift
//  SYTeamApp
//
//  Created by mac on 16/4/14.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit
class GroupMemberImageTableViewCell: UITableViewCell {
    var MemberImgModel:[UIImageView] = [UIImageView(),UIImageView(),UIImageView(),UIImageView(),UIImageView()]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    lazy var MemberImageView:UIView = {
        var img = UIView()
        return img
    }()
        override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(MemberImageView)
        MemberImageView.snp_makeConstraints { (make) -> Void in
            make.right.left.top.bottom.equalTo(0)
        }
            for i in 0..<MemberImgModel.count {
                MemberImageView.addSubview(MemberImgModel[i])
                selectionStyle = UITableViewCellSelectionStyle.None
                MemberImgModel[i].snp_makeConstraints { (make) -> Void in
                    make.height.width.equalTo(60)
                    make.top.equalTo(10)
                    make.left.equalTo(10+70*i)
                }
                MemberImgModel[i].layer.cornerRadius = 30
//                MemberImgModel[i].layer.masksToBounds = true
                if i == MemberImgModel.count-1{
                    MemberImgModel[i].image = UIImage(named:"add" )
                    MemberImgModel[i].contentMode = UIViewContentMode.ScaleAspectFill
                }else{
                    MemberImgModel[i].image = UIImage(named:"gerenzhuye_2x" )
                    MemberImgModel[i].contentMode = UIViewContentMode.ScaleAspectFill
                }
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
