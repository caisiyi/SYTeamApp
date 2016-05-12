
//  MessageManager.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/3/24.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

private var ConversationInstance = ConversationManager()

typealias ConversationManagerBlock = (result:[EMConversation]?,error:String?)->()
typealias ConversationManagerMessageBlock = (result:[EMMessage]?,error:String?)->()
protocol ConversationManagerDelegate {
    func GetMessagesAction(aMessages: AnyObject!)
}
class ConversationManager: NSObject,EMClientDelegate,EMChatManagerDelegate{
    class var instance:ConversationManager{
        return ConversationInstance
    }
    var convenienceID:String?
    var delegate:ConversationManagerDelegate?
    override init() {
        super.init()
        EMClient.sharedClient().chatManager.addDelegate(self, delegateQueue: nil)
        EMClient.sharedClient().addDelegate(self, delegateQueue: nil)

    }
    func GetConversation(completion:ConversationManagerBlock){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            if var array = EMClient.sharedClient().chatManager.getAllConversations() {
                if array.count > 0 {
                    array = array.filter({ (object) -> Bool in
                        let conversation = object as! EMConversation
                        if conversation.conversationId == "admin"{
                            return false
                        }
                        return true
                    })
                    completion(result:array as! [EMConversation], error: nil)
                }else{
                completion(result: nil, error: nil)
                }
            }else{
                completion(result: nil, error: nil)
            }  
        }
    }
    func CreatConversation(){
        
            EMClient.sharedClient().chatManager.getConversation("xiaocai", type: EMConversationTypeChat, createIfNotExist: true)
    }
    func GetConversationMessage(conversationID:String,type:EMConversationType = EMConversationTypeChat,completion:ConversationManagerMessageBlock){
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            if let array = EMClient.sharedClient().chatManager.getConversation(conversationID, type: type, createIfNotExist: true).loadMoreMessagesFromId("", limit: 20) {
                if array.count > 0 {
                    completion(result:array as! [EMMessage], error: nil)
                }else{
                    completion(result: nil, error: nil)
                }
            }else{
                completion(result: nil, error: nil)
            }
        }
        //        EMClient.sharedClient().chatManager.getConversation("admin", type: EMConversationTypeChat, createIfNotExist: true)
        
        
    }
    func RemoveConversation(conversationID:String,deleteMessages:Bool = false){
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            EMClient.sharedClient().chatManager.deleteConversation(conversationID, deleteMessages: deleteMessages)
        }
        
        
    }
    func GetAdminConversationMessage(messageId:String = "",completion:ConversationManagerMessageBlock){
     
       dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
        if var array = EMClient.sharedClient().chatManager.getConversation("admin", type: EMConversationTypeChat, createIfNotExist: true).loadMoreMessagesFromId(messageId, limit: 20) {
            if array.count > 0 {
                array = array.reverse() 
                completion(result:array as! [EMMessage], error: nil)
            }else{
                completion(result: nil, error: nil)
            }
        }else{
            completion(result: nil, error: nil)
        }
        }
//        EMClient.sharedClient().chatManager.getConversation("admin", type: EMConversationTypeChat, createIfNotExist: true)
        
       
    }
    func SentMessages(conversationID:String,type:EMChatType = EMChatTypeChat,content:String)->EMMessage{
        let body = EMTextMessageBody(text: content)
        let message = EMMessage.init(conversationID: conversationID, from: EMClient.sharedClient().currentUsername, to: conversationID, body: body, ext: nil)
        message.chatType = type
        
        EMClient.sharedClient().chatManager.asyncSendMessage(message, progress: { (i) in
            
            }) { (message, error) in
        }
        return message
    }
    func SentMessages(conversationID:String,type:EMChatType = EMChatTypeChat,Image:UIImage)->EMMessage{
        let body = EMImageMessageBody(data: UIImageJPEGRepresentation(Image,0.8), thumbnailData: UIImageJPEGRepresentation(Image,0.7))
        let message = EMMessage.init(conversationID: conversationID, from: EMClient.sharedClient().currentUsername, to: conversationID, body: body, ext: nil)
        message.chatType = type
        EMClient.sharedClient().chatManager.asyncSendMessage(message, progress: { (i) in
            
        }) { (message, error) in
        }
        return message
    }
    func didReceiveMessages(aMessages: [AnyObject]!) {
        aMessages.forEach { (message) in
            let message = message as! EMMessage
            if self.convenienceID == message.conversationId{
                self.delegate?.GetMessagesAction(message)
            }
        }
    }
    func didReceiveCmdMessages(aCmdMessages: [AnyObject]!) {
//        aCmdMessages.forEach { (message) in
//            let message = message as! EMMessage
//            if self.convenienceID == message.conversationId{
//                self.delegate?.GetMessagesAction(aCmdMessages)
//            }
//        }
    }
    
    func didReceiveOfflineMessages(offlineMessages: [AnyObject]!) {
        offlineMessages.forEach { (message) in
            let message = message as! EMMessage
            if self.convenienceID == message.conversationId{
                self.delegate?.GetMessagesAction(message)
            }
        }
    }
}
