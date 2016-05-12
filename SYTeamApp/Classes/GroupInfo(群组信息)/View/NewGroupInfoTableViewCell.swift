//
//  NewGroupInfoTableViewCell.swift
//  SYTeamApp
//
//  Created by mac on 16/4/14.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class NewGroupInfoTableViewCell: UITableViewCell {
    var placeHold = UILabel()

    lazy var NewGroupImage:UIButton = {
        var img = UIButton()
        return img
    }()
    lazy var NewGroupName:UITextField = {
        var name = UITextField()
        name.tintColor = AppColor
        return name
    }()
    lazy var NewGroupDes:UITextField = {
        var des = UITextField()
        des.tintColor = AppColor
        return des
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(NewGroupImage)
        selectionStyle = UITableViewCellSelectionStyle.None
        NewGroupImage.snp_makeConstraints { (make) -> Void in
            make.height.width.equalTo(80)
            make.top.equalTo(10)
            make.centerX.equalTo(0)
        }
        NewGroupImage.layer.cornerRadius = 40
        NewGroupImage.setImage(UIImage(named: "wodefensi_2x"), forState: .Normal)
        contentView.addSubview(NewGroupName)
        NewGroupName.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(NewGroupImage.snp_bottom).offset(10)
            make.height.equalTo(32)
        }
        NewGroupName.placeholder = "请输入群名字"
        NewGroupName.font = UIFont.systemFontOfSize(20)
        NewGroupName.textAlignment = NSTextAlignment.Center
        NewGroupName.clearButtonMode = UITextFieldViewMode.Always
        contentView.addSubview(NewGroupDes)
        NewGroupDes.placeholder = "请输入群描述"
        NewGroupDes.font = UIFont.systemFontOfSize(20)
        NewGroupDes.textAlignment = NSTextAlignment.Center
        NewGroupDes.clearButtonMode = UITextFieldViewMode.Always
        NewGroupDes.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(NewGroupName.snp_bottom).offset(10)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(32)
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
extension NewGroupInfoTableViewCell:UITextViewDelegate{
    func textViewDidChange(textView: UITextView) {
        if textView.text.isEmpty{
            placeHold.text = "填写投票描述，让更多的人参与投票..."
        }
        else
        {
            placeHold.text = ""        }
        
    }    }
