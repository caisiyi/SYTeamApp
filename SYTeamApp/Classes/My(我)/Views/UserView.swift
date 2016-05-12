//
//  UserView.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/3/24.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import UIKit

class UserView: UIView {
    var user:UserAccount?{
        didSet{
            iconImageView.image = UIImage(named: user!.iconImage ?? "")
            phoneLabel.text = "\(user!.phone)"
            priceLabel.text = "\(user!.price)个"
            discountLabel.text = "\(user!.discount)个"
        }
    }
    lazy var phoneLabel:UILabel = {
        var label = UILabel(textColor: UIColor.whiteColor(), font: BigTextFont)
        return label
    }()
    
    lazy var priceLabel:UILabel = {
        var label = UILabel(textColor: UIColor.whiteColor(), font: SmallTextFont)
        return label
    }()
    
    lazy var priceTitleLabel:UILabel = {
        var label = UILabel(textColor: UIColor.whiteColor(), font: SmallTextFont)
        label.text = "消息"
        return label
    }()
    
    lazy var discountTitleLabel:UILabel = {
        var label = UILabel(textColor: UIColor.whiteColor(), font: SmallTextFont)
        label.text = "备忘"
        return label
    }()
    
    
    lazy var discountLabel:UILabel = {
        var label = UILabel(textColor: UIColor.whiteColor(), font: SmallTextFont)
        return label
    }()
    
    lazy var iconImageView:UIImageView = {
        var imageView = UIImageView()
        return imageView
    }()
   
    lazy var backBtn:BlockButton = {
        return BlockButton(image: UIImage(named: "back")!)
    }()
    
    lazy var setupBtn:BlockButton  = {
        return BlockButton(image: UIImage(named: "设置setting")!)
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    init(){
        super.init(frame: CGRectZero)
        //131 215  221  100
        backgroundColor = AppColor
        addSubview(phoneLabel)
        addSubview(iconImageView)
        addSubview(priceTitleLabel)
        addSubview(priceLabel)
        addSubview(discountTitleLabel)
        addSubview(discountLabel)
//        addSubview(backBtn)
//        addSubview(setupBtn)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func drawRect(rect: CGRect) {
        
//        backBtn.snp_makeConstraints { (make) -> Void in
//            make.top.equalTo(24)
//            make.left.equalTo(12)
//        }
//        setupBtn.snp_makeConstraints { (make) -> Void in
//            make.top.equalTo(backBtn)
//            make.right.equalTo(-12)
//        }
        
        iconImageView.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(self).offset(32)
            make.left.equalTo(12)
            make.width.height.equalTo(80)
        }
        
        phoneLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(iconImageView.snp_top)
            make.left.equalTo(iconImageView.snp_right).offset(12)
        }
        
        priceTitleLabel.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(iconImageView)
            make.left.equalTo(iconImageView.snp_right).offset(12)
        }
      
        priceLabel.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(priceTitleLabel.snp_top).offset(-3)
            make.left.equalTo(priceTitleLabel)
        }
        
        discountTitleLabel.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(iconImageView)
            make.right.equalTo(-40)
        }
        
        discountLabel.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(discountTitleLabel.snp_top).offset(-3)
            make.left.equalTo(discountTitleLabel)
        }
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
