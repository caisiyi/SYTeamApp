//
//  UUChatModel.swift
//  UUChatTableViewSwift
//
//  Created by 杨志平 on 11/22/15.
//  Copyright © 2015 XcodeYang. All rights reserved.
//

import UIKit

enum UUChatFrom : Int {
    case Me
    case Other
}
enum UUChatType : Int {
    case Chat
    case GroupChat
}

enum UUChatMessageType : Int {
    case Text
    case Image
    case Voice
//    case Video
//    case Map
}

class UUChatModel: AnyObject {
    var from:UUChatFrom = .Me
    var messageType:UUChatMessageType = .Text
    var userName:String!
    var time:String!
    var headImage:UIImage!
    var timestamp:Int?
    
    var chatType:UUChatType = .Chat
    var imageUrl:String?
    var text:String?
    var image:UIImage?
    var voice:NSData?
    var VoiceSecond:String?
    init(){}
    init(model:EMMessage){
        self.from = model.direction == EMMessageDirectionSend ? .Me : .Other
        self.timestamp = Int(model.timestamp)
        self.messageType = .Text
        if model.body.type == EMMessageBodyTypeText {
            let body = model.body as! EMTextMessageBody
            self.text = body.text
        }
        if model.body.type == EMMessageBodyTypeImage {
            let body = model.body as! EMImageMessageBody
            self.messageType = .Image
            if UIImage(contentsOfFile: body.thumbnailLocalPath) != nil{
            self.image = UIImage(contentsOfFile: body.thumbnailLocalPath)
            }else{
            self.imageUrl = body.thumbnailRemotePath
            }
                
        }
        self.chatType = model.chatType == EMChatTypeChat ? .Chat : .GroupChat
        self.userName = model.from
        var timestamp = model.timestamp
        if timestamp > 140000000000 {
            timestamp = timestamp / 1000
        }
        self.time = NSDate(timeIntervalSince1970: Double(timestamp)).chatTimePassed()
        self.headImage = UIImage(named: "thumb_raw_1451290532")
    
    }
    init(preModel:EMMessage,model:EMMessage){
        self.from = model.direction == EMMessageDirectionSend ? .Me : .Other
        self.timestamp = Int(model.timestamp)
        self.messageType = .Text
        if model.body.type == EMMessageBodyTypeText {
            let body = model.body as! EMTextMessageBody
            self.text = body.text
        }
        if model.body.type == EMMessageBodyTypeImage {
            let body = model.body as! EMImageMessageBody
            self.messageType = .Image
            if UIImage(contentsOfFile: body.thumbnailLocalPath) != nil{
                self.image = UIImage(contentsOfFile: body.thumbnailLocalPath)
            }else{
                self.imageUrl = body.thumbnailRemotePath
            }
            
        }
        self.chatType = model.chatType == EMChatTypeChat ? .Chat : .GroupChat
        self.userName = model.from
        var timestamp = model.timestamp
        if timestamp > 140000000000 {
            timestamp = timestamp / 1000
        }
        self.time = NSDate(timeIntervalSince1970: Double(timestamp)).chatTimePassed()
        var pretimestamp = preModel.timestamp
        if pretimestamp > 140000000000 {
            pretimestamp = pretimestamp / 1000
        }
        if  timestamp - pretimestamp < 60{
            self.time = ""
        }
        self.headImage = UIImage(named: "thumb_raw_1451290532")
        
    }
    class func creatMessageFromMeByText(text:String,timestamp:Int? = nil) -> UUChatModel{
        let model = UUChatModel()
        model.messageType = .Text
        model.text = text
        model.configMeBaseInfo()
        if timestamp != 0 {
        if var timestamp = timestamp {
            if timestamp > 140000000000 {
                timestamp = timestamp / 1000
            }
            model.time = NSDate(timeIntervalSince1970: Double(timestamp)).chatTimePassed()
        }
        }
        return model
    }
    
    class func creatMessageFromMeByImage(image:UIImage,timestamp:Int? = nil) -> UUChatModel{
        let model = UUChatModel()
        model.messageType = .Image
        model.image = image
        model.configMeBaseInfo()
        if timestamp != 0 {
        if var timestamp = timestamp {
            if timestamp > 140000000000 {
                timestamp = timestamp / 1000
            }
        model.time = NSDate(timeIntervalSince1970: Double(timestamp)).chatTimePassed()
        }
        }
        return model
    }
    
    class func creatMessageFromMeByVoice(voice:NSData) -> UUChatModel{
        let model = UUChatModel()
        model.messageType = .Voice
        model.voice = voice
        model.VoiceSecond = "5"
        model.configMeBaseInfo()
        return model
    }
    
    private func configMeBaseInfo() {
        self.from = .Me
        self.userName = "Daniel"
        self.timestamp = Int(NSDate().timeIntervalSince1970)
        self.time =  NSDate().toString()
        self.headImage = UIImage(named: "headImage")
    }
    
    class func creatRandomArray(count count:Int) -> [UUChatModel] {
        var array = [UUChatModel]()
        for _ in 0...(count) {
            let model:UUChatModel = UUChatModel()
            model.messageType = .Text
            model.from = random()%2==0 ? .Me:.Other
            model.userName = model.from == .Me ? "Daniel":"Sister"
            model.time = random()%2==1 ? NSDate.init(timeIntervalSince1970: NSTimeInterval(random()%1000)).description : ""
            model.headImage = UIImage(named: "headImage")
            model.text = UUChatModel.randomStr()
            array.append(model)
        }
        return array
    }
    
    class func randomStr() -> String {
        let str:NSMutableString = "A scroll view tracks the movements of fingers and adjusts the origin accordingly. The view that is showing its content “through” the scroll view draws that portion of itself based on the new origin, which is pinned to an offset in the content view. The scroll view itself does no drawing except for displaying vertical and horizontal scroll indicators. The scroll view must know the size of the content view so it knows when to stop scrolling; by default, it “bounces” back when scrolling exceeds the bounds of the content"
        let index: Int = random()%100 + 5
        return str.substringToIndex(index)
    }
}


