//
//  ExitTableViewCell.swift
//  SYTeamApp
//
//  Created by MAC on 16/4/15.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class ExitTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        let loginOut = UIButton()
        loginOut.setTitle("退出登陆", forState: UIControlState.Normal)
        loginOut.backgroundColor = UIColor.redColor()
        contentView.addSubview(loginOut)
        loginOut.snp_makeConstraints { (make) in
            make.centerY.equalTo(contentView)
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.height.equalTo(42)
        }
        loginOut.addTarget(self, action: "LoginOut", forControlEvents: UIControlEvents.TouchUpInside)

    }
    func  LoginOut(){
        
        UserAccount.shareUser = UserAccount()
        UserAccount.shareUser.saveUserAccount()
        
        EMClient.sharedClient().logout(true)
        UIApplication.sharedApplication().keyWindow!.rootViewController = LoginViewController()
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
