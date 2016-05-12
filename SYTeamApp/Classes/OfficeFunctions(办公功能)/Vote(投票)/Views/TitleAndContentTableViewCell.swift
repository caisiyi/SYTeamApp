//
//  TitleAndContentTableViewCell.swift
//  Vote
//
//  Created by mac on 16/4/6.
//  Copyright © 2016年 CH. All rights reserved.
//

import UIKit


class TitleAndContentTableViewCell: UITableViewCell {
    
    var placeHold = UILabel()
    lazy var titleTextField:UITextField = {
        var title = UITextField()
        return title
    }()
    lazy var descView:UIView = {
        var desc = UIView()
        return desc
    }()
    lazy var descTF:UITextView = {
        var desc = UITextView()
        return desc
    }()
    lazy var imgBtnView:UIView = {
        var image = UIView()
        return image
    }()
    lazy var imageButton:UIButton = {
        var imagebutton = UIButton()
        return imagebutton
    }()
    lazy var getImaView:UIImageView = {
        var image = UIImageView()
        return image
    }()
    lazy var leftImaView:UIImageView = {
        var image = UIImageView(image:UIImage(named:"vote"))
        return image
    }()
    lazy var PutImageView:UIView = {
        var put = UIView()
        return put
    }()
       override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleTextField)
        selectionStyle = UITableViewCellSelectionStyle.None

        contentView.backgroundColor = UIColor.whiteColor()
        let seprator1 = UIView()
        contentView.addSubview(seprator1)
        seprator1.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.5)
        seprator1.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
            make.top.equalTo(contentView)
            make.height.equalTo(1)
            
        }
        
        contentView.addSubview(leftImaView)
        leftImaView.snp_makeConstraints { (make) -> Void  in
            make.centerY.equalTo(titleTextField)
            make.left.equalTo(10)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        titleTextField.placeholder = "主题字数少于15"
        titleTextField.clearButtonMode = UITextFieldViewMode.Always
        titleTextField.snp_makeConstraints{(make)->Void in
            make.top.equalTo(seprator1.snp_bottom)
            make.height.equalTo(45)
            make.left.equalTo(leftImaView.snp_right).offset(10)
            make.right.equalTo(contentView)
            // Do any additional setup after loading the view.
        }
        let seprator2 = UIView()
        contentView.addSubview(seprator2)
        seprator2.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.5)
        seprator2.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
            make.top.equalTo(titleTextField.snp_bottom)
            make.height.equalTo(1)
            
        }
        
        placeHold.frame = CGRect(x: 5 , y: 10, width: kScreenW-20, height: 20  )
        
        placeHold.textColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.5)
        placeHold.text = "填写投票描述，让更多的人参与投票..."
        placeHold.font = UIFont.systemFontOfSize(16)
        descTF.addSubview(placeHold)
        
        descTF.delegate = self
        descView.addSubview(descTF)
        contentView.addSubview(descView)
        descView.snp_makeConstraints{(make)->Void in
            make.height.equalTo(titleTextField).multipliedBy(3)
            make.top.equalTo(seprator2.snp_bottom)
            make.right.equalTo(contentView)
            make.left.equalTo(contentView)
        }
//        descView.backgroundColor = UIColor.orangeColor()
        descTF.snp_makeConstraints{(make)->Void in
            make.edges.equalTo(descView).inset(UIEdgeInsetsMake(0, 5, 5, 5))
        }
//        descTF.backgroundColor = UIColor.blueColor()
        descTF.font = UIFont.systemFontOfSize(20)
        //        descTF.placeholder = "填写投票描述，让更多的人参与投票..."
        //        descTF.clearButtonMode = UITextFieldViewMode.Always
        contentView.addSubview(PutImageView)
        PutImageView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(descTF.snp_bottom)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(105)
            make.width.equalTo(contentView)
        }
        contentView.addSubview(imgBtnView)
        let seprator3 = UIView()
        contentView.addSubview(seprator3)
        seprator3.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.5)
        seprator3.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
            make.top.equalTo(PutImageView.snp_bottom)
            make.height.equalTo(1)
            
        }

        contentView.addSubview(imageButton)
        imageButton.setImage(UIImage(named: "image"), forState: UIControlState.Normal)
        imageButton.snp_makeConstraints { (make) ->Void in
            make.left.equalTo(imgBtnView).inset(5)
            make.top.equalTo(imgBtnView).inset(2)
            make.bottom.equalTo(imgBtnView).inset(2)
            make.width.equalTo(40)
        }
        imgBtnView.snp_makeConstraints{(make)-> Void in
            make.height.equalTo(titleTextField)
            make.top.equalTo(seprator3.snp_bottom)
            make.right.equalTo(contentView)
            make.left.equalTo(contentView)
        }
        PutImageView.addSubview(getImaView)
        getImaView.snp_makeConstraints { (make) ->Void in
            make.top.equalTo(10)
            make.height.equalTo(80)
            make.width.equalTo(80)
            make.left.equalTo(10)
        }
        
//        imgView.backgroundColor = UIColor.yellowColor()
        
              
    }
        required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
extension TitleAndContentTableViewCell:UITextViewDelegate{
    func textViewDidChange(textView: UITextView) {
        if textView.text.isEmpty{
            placeHold.text = "填写投票描述，让更多的人参与投票..."
        }
        else
        {
            placeHold.text = ""        }
        
    }    }
        


