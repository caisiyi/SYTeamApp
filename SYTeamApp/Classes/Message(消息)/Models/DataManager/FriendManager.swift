//
//  FriendManager.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/4/13.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

typealias FriendManagerBlock = (result:[AnyObject]?,error:EMError?)->()
private var FriendInstance = FriendManager()
class FriendManager: NSObject{
    class var instance:FriendManager{
        return FriendInstance
    }
    func GetFriendsList(completion:FriendManagerBlock){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            if let array = EMClient.sharedClient().contactManager.getContacts() {
                if array.count > 0 {
                    completion(result:array , error: nil)
                }else{
                    if let array = EMClient.sharedClient().contactManager.getContactsFromServerWithError(nil) {
                        if array.count > 0 {
                            completion(result:array, error: nil)
                        }else{
                            completion(result: nil, error: nil)
                        }
                    }else{
                        completion(result: nil, error: nil)
                    }
                }
            }else{
                completion(result: nil, error: nil)
            }
        }
    }
}