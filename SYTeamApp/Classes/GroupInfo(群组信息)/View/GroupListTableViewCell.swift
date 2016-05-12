//
//  GroupListTableViewCell.swift
//  Organization
//
//  Created by mac on 16/4/10.
//  Copyright © 2016年 CH. All rights reserved.
//

import UIKit

class GroupListTableViewCell: UITableViewCell {
    lazy var UserImage: UIImageView = {
        var userimage = UIImageView()
        return userimage
    }()
    lazy var UserInfoTable: UITableView = {
        var info = UITableView()
        return info
    }()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(UserImage)
        contentView.addSubview(UserInfoTable)
        UserImage.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(15)
            make.top.equalTo(15)
            make.bottom.equalTo(-15)
            make.width.equalTo(70)
            make.centerY.equalTo(contentView)
        }
        UserImage.layer.cornerRadius = 35
        UserImage.backgroundColor = UIColor.redColor()
        UserInfoTable.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(UserImage.snp_right).offset(15)
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
            make.right.equalTo(-10)
            make.centerY.equalTo(contentView)

        }
        UserInfoTable.registerClass(UserInfoTableViewCell.self ,forCellReuseIdentifier: "UserInfoTableViewCell")
        UserInfoTable.scrollEnabled = false
        UserInfoTable.delegate = self
        UserInfoTable.dataSource = self
        selectionStyle = UITableViewCellSelectionStyle.None
        UserInfoTable.separatorStyle = UITableViewCellSeparatorStyle.None
        let separator: UIView = UIView()
        contentView.addSubview(separator)
        separator.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(UserImage.snp_bottom).offset(15)
            make.height.equalTo(1)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
        separator.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.5)
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
extension GroupListTableViewCell: UITableViewDataSource,UITableViewDelegate{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UserInfoTableViewCell", forIndexPath: indexPath) as! UserInfoTableViewCell

        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
}
