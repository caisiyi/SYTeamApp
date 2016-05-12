//
//  PulicGroupManager.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/3/24.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

private var GroupInstance = GroupManager()

typealias GroupManagerGroupsBlock = (result:[EMGroup]?,error:EMError?)->()
typealias GroupManagerGroupBlock = (result:EMGroup?,error:EMError?)->()

class GroupManager: NSObject{
    class var instance:GroupManager{
            return GroupInstance
    }
    func GetGroupList(completion:GroupManagerGroupsBlock){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
           
            if let array = EMClient.sharedClient().groupManager.getAllGroups() {
                if array.count > 0 {
                    completion(result:array as! [EMGroup], error: nil)
                }else{
                    if let array = EMClient.sharedClient().groupManager.getMyGroupsFromServerWithError(nil) {
                        if array.count > 0 {
                            completion(result:array as! [EMGroup], error: nil)
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
    func GetGroupInfo(groupId:String,completion:GroupManagerGroupBlock){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            var error:EMError?
            let group = EMClient.sharedClient().groupManager.fetchGroupInfo(groupId, includeMembersList: true, error: &error)
            if error == nil {
                completion(result: group, error: nil)
            }else{
                completion(result: nil, error: error)
            }
        }
    }
    func CreatGroup(subject:String,description:String,completion:GroupManagerGroupBlock){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            var error:EMError?
            let style = EMGroupOptions()
            style.style = EMGroupStylePublicOpenJoin
            style.maxUsersCount = 200
            let group = EMClient.sharedClient().groupManager.createGroupWithSubject(subject, description: description, invitees: ["xiaocai2","xiaocai3"], message: subject, setting: style, error: &error)
            if error == nil {
                completion(result: group, error: nil)
            }else{
                completion(result: nil, error: error)
            }
        }
    }

}
