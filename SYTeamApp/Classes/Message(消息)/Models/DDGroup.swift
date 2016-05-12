//
//  DDGroup.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/4/15.
//  Copyright © 2016年 caisiyi. All rights reserved.
//
typealias DDGroupsBlock = (result:[DDGroup]?,error:String?)->()
class DDGroup:NSObject{
    
    var emGroup:EMGroup!
    var objectId:String!
    var groupName:String!
    var groupMemberCount:Int!
    var groupMemberList:NSArray!
    var groupDesc:String!
    var groupIcon:String!
    
    class func loadGroup(completion:DDGroupsBlock){
        GroupManager.instance.GetGroupList { (result, error) in
            if result != nil {
                var ddGroups:[DDGroup] = []
                result?.forEach({ (group) in
                        let ddGroup = DDGroup()
                        ddGroup.emGroup = group
                        let query = AVQuery(className: "GroupList")
                        query.whereKey("groupId", equalTo: group.groupId)
                        let groupObject = query.getFirstObject()
                        if groupObject != nil {
                            
                        ddGroup.objectId =  groupObject.objectForKey("objectId") as? String
                        ddGroup.groupName =  groupObject.objectForKey("groupName") as? String
                        ddGroup.groupMemberCount =  groupObject.objectForKey("groupMemberCount") as? Int
                        ddGroup.groupMemberList =  groupObject.objectForKey("groupMemberList") as? NSArray
                        ddGroup.groupDesc =  groupObject.objectForKey("groupDesc") as? String
                        ddGroup.groupIcon =  groupObject.objectForKey("groupIcon") as? String
                        }
                        ddGroups.append(ddGroup)
                    
                })
                ddGroups = ddGroups.reverse()
                completion(result: ddGroups,error: nil)
            }
        }
        
    }
    class func changeGroupInfo(group:DDGroup,value:AnyObject,key:String){
            let group = AVObject(outDataWithClassName: "GroupList",objectId: group.objectId)
            group.setObject(value, forKey: key)
            group.saveInBackground()
    }
    
}
