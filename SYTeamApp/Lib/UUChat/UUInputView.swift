//
//  UUInputView.swift
//  UUChatTableViewSwift
//
//  Created by XcodeYang on 8/13/15.
//  Copyright © 2015 XcodeYang. All rights reserved.
//

import UIKit

typealias TextBlock  = (text:String,    textView:UITextView)->Void
typealias ImageBlock = (image:UIImage,  textView:UITextView)->Void
typealias VoiceBlock = (voice:NSData,   textView:UITextView)->Void

class UUInputView: UIToolbar, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    var leftButton: UIButton!
    var rightButton: UIButton!
    var contentTextView: UITextView!
    var placeHolderLabel: UILabel!
    var contentViewHeightConstraint: NSLayoutConstraint!
    
    var sendTextBlock:TextBlock!
    var sendImageBlock:ImageBlock!
    var sendVoiceBlock:VoiceBlock!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        leftButton = UIButton()
        self.addSubview(leftButton)
        leftButton.setImage(UIImage(named: "chat_voice_record"), forState: .Normal)
        leftButton.snp_makeConstraints { (make) -> Void in
            make.leading.equalTo(self).offset(8)
            make.bottom.equalTo(self).offset(-8)
            make.width.height.equalTo(30)
        }

        rightButton = UIButton()
        self.addSubview(rightButton)
        rightButton.setImage(UIImage(named: "chat_take_picture"), forState: .Normal)
        rightButton.addTarget(self, action: Selector("sendImage"), forControlEvents: .TouchUpInside)
        rightButton.snp_makeConstraints { (make) -> Void in
            make.trailing.bottom.equalTo(self).offset(-8)
            make.height.width.equalTo(30)
        }
        
        contentTextView = UITextView()
        self.addSubview(contentTextView)
        contentTextView.layer.cornerRadius = 4
        contentTextView.layer.borderWidth = 0.5
        contentTextView.layer.borderColor = UIColor.lightGrayColor().CGColor
        contentTextView.delegate = self
        contentTextView.returnKeyType = .Send
        contentTextView.enablesReturnKeyAutomatically = true
        contentTextView.snp_makeConstraints { (make) -> Void in
            make.leading.equalTo(self).offset(45)
            make.trailing.equalTo(self).offset(-45)
            make.top.equalTo(self).offset(8)
            make.bottom.equalTo(self).offset(-8)
            make.height.greaterThanOrEqualTo(30)
        }
        // temporary method
        contentViewHeightConstraint = NSLayoutConstraint(
            item: contentTextView,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: 30
        )
        contentViewHeightConstraint.priority = UILayoutPriorityDefaultHigh
        contentTextView.addConstraint(contentViewHeightConstraint)
        
        placeHolderLabel = UILabel()
        placeHolderLabel.text = "请在这里输入文本内容"
        placeHolderLabel.textColor = UIColor.lightGrayColor()
        placeHolderLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        contentTextView.addSubview(placeHolderLabel)
        placeHolderLabel.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(contentTextView)
        }
}
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func sendMessage(imageBlock imageBlock:ImageBlock, textBlock:TextBlock, voiceBlock:VoiceBlock){
        self.sendImageBlock = imageBlock
        self.sendTextBlock = textBlock
        self.sendVoiceBlock = voiceBlock
    }
    
    //MARK: textViewDelegate
    func textViewDidBeginEditing(textView: UITextView) {
        placeHolderLabel.hidden = true
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        placeHolderLabel.hidden = !textView.text.isEmpty
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if text != "\n" {
            return true
        } else {
            // send text
            self.sendTextBlock!(text: contentTextView.text, textView: contentTextView)
            textView.text = ""
            self.textViewDidChange(textView)
            return false
        }
    }
    
    // adjust content's height from 30 t0 100
    func textViewDidChange(textView: UITextView) {
        let textContentH = textView.contentSize.height
        print("output：\(textContentH)")
        let textHeight = textContentH>30 ? (textContentH<100 ? textContentH:100):30
        UIView.animateWithDuration(0.2) { () -> Void in
            self.contentViewHeightConstraint.constant = textHeight
            self.layoutIfNeeded()
            self.superview?.layoutIfNeeded()
            let vc = self.responderViewController()
            vc.view.layoutIfNeeded()
            for view in vc.view.subviews {
                if view.isKindOfClass(UITableView){
                    (view as! UITableView).scrollToBottom(animation: true)
                    break
                }
            }
           
        }
    }
    
    func sendImage() {
        self.contentTextView.resignFirstResponder()
        
        let sheet = UIAlertController()
        // is the device support camera?（iPod & Simulator）
        if (UIImagePickerController.isSourceTypeAvailable(.Camera)) {
            sheet.addAction(UIAlertAction.init(title: "Camera", style: .Default, handler: { _ in
                self.showPhotoes(.Camera)
            }))
        }
        sheet.addAction(UIAlertAction.init(title: "PhotoLibrary", style: .Default, handler: { _ in
            self.showPhotoes(.PhotoLibrary)
        }))
        sheet.addAction(UIAlertAction.init(title: "SavedPhotosAlbum", style: .Default, handler: { _ in
            self.showPhotoes(.SavedPhotosAlbum)
        }))
        sheet.addAction(UIAlertAction.init(title: "Cancel", style: .Cancel, handler: nil))
        
        
        if let resppp:UIViewController? = self.responderViewController() {
            resppp!.presentViewController(sheet, animated: true, completion: nil)
        }
    }
    
    func showPhotoes(source: UIImagePickerControllerSourceType) {
        if let resppp:UIViewController? = self.responderViewController() {
            let controller = UIImagePickerController()
            controller.delegate = self
            controller.sourceType = source
            controller.allowsEditing = true
            resppp!.presentViewController(controller, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        responderViewController().dismissViewControllerAnimated(true) { [weak self]() -> Void in
            let image = info[UIImagePickerControllerEditedImage] as? UIImage
            self!.sendImageBlock!(image: image!, textView: self!.contentTextView)
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.responderViewController().dismissViewControllerAnimated(true, completion: nil)
    }
    
}

