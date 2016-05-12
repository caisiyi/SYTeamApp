//
//  SYWelcomeViewController.swift
//  Weibo
//
//  Created by 蔡斯仪 on 16/3/18.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class SYWelcomeViewController: UIViewController {
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
     
        // 更新约束
        userIcon.snp_updateConstraints { (make) -> Void in
            make.bottom.equalTo(-(UIScreen.mainScreen().bounds.height - 180))
        }
        // 动画移动头像
        UIView.animateWithDuration(1.0, delay: 0.1, usingSpringWithDamping: 0.6, initialSpringVelocity: 5, options: UIViewAnimationOptions(rawValue: 0), animations: { () -> Void in
            // 更新布局
            self.view.layoutIfNeeded()
            }) { (_) -> Void in
                // 动画渐变显示文字
                UIView.animateWithDuration(1.0, animations: { () -> Void in
                    self.userName.alpha = 1
                    }, completion: { (_) -> Void in
                        // 进入主页
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(1 * NSEC_PER_SEC)), dispatch_get_main_queue()) { () -> Void in
                            MainManager.instance.AutoLogin({ (successed) in
                                if successed {
                                    UserAccount.LoadUserInfo()
                                    UIApplication.sharedApplication().keyWindow?.rootViewController = SYTabBarViewController()
                                }else{
                                    UIApplication.sharedApplication().keyWindow?.rootViewController = LoginViewController()
                                }
                            })
                        }
                })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        // 背景颜色
        let image = UIImageView()
        image.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height)
        image.image = UIImage(named: "")
        self.view.addSubview(image)
        // 添加控件
        view.addSubview(userIcon)
        view.addSubview(userName)
        
        // 约束头像
        userIcon.snp_makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width:100, height: 100))
            make.centerX.equalTo(view.snp_centerX)
            make.bottom.equalTo(-180)
        }
        
        // 约束用户名称
        userName.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(userIcon.snp_centerX)
            make.top.equalTo(userIcon.snp_bottom).offset(15)
        }
    
    }
    
    /// MARK: - 懒加载
    /// 用户头像
    lazy var userIcon: UIImageView =
    {
        let iconView = UIImageView()
        // 加载用户头像
        if let icon = UserAccount.shareUser.iconImage {
        iconView.sd_setImageWithURL(NSURL(string: icon))
        }
        iconView.layer.cornerRadius = 50
        iconView.clipsToBounds = true
        return iconView
        
    }()
    
    /// 用户名称
    lazy var userName: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFontOfSize(15)
        name.alpha = 0
        name.text = "欢迎归来 \(UserAccount.shareUser.nickname ?? "")"
        return name
    }()
    
    
}

