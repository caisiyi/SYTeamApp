//
//  Vote.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/4/10.
//  Copyright © 2016年 caisiyi. All rights reserved.
//
typealias VotesBlock = (result:[VoteInfo]?,error:String?)->()
class VoteItem: NSObject {
    var itemsIndex:Int?
    var itemsContent:String?
}
class VoteInfo:NSObject {
    
    var username:String?
    var userImage:String?
    var voteId:String?
    var voteDate:String?
    var voteState:Bool?
    var isVoted:Bool?
    var voteDes:String?
    var ismorechoice:Bool?
    var voteTitle:String?
    var voteimage:UIImage?
    var voteItems:[VoteItem] = [VoteItem(),VoteItem()]
    
    class func loadVote(completion:VotesBlock){
                var votelist:[VoteInfo] = []
                let query = AVQuery(className: "VoteList")
                query.findObjectsInBackgroundWithBlock { (array, error) in
                    if error == nil {
                    array.forEach({ (object) in
                        let vote = VoteInfo()
                       
                        vote.isVoted =  object.objectForKey("IsVoted") as? Bool
                        if let date = object.objectForKey("createdAt") as? NSDate {
                        vote.voteDate = date.toString()
                        }
                        vote.voteTitle =  object.objectForKey("VoteName") as? String
                        vote.voteDes =  object.objectForKey("VoteDes") as? String
                        if let items =  object.objectForKey("VoteItem") as? NSArray {
                            vote.voteItems.removeAll()
                            for i in 0..<items.count {
                                let voteitem = VoteItem()
                                voteitem.itemsIndex = i
                                voteitem.itemsContent = items[i] as? String
                                vote.voteItems.append(voteitem)
                            }
                        }
                        vote.username =  object.objectForKey("UserName") as? String
                        vote.userImage =  object.objectForKey("UserImage") as? String
                        vote.voteState = object.objectForKey("VoteState") as? Bool
                        vote.ismorechoice = object.objectForKey("IsOneChoice") as? Bool
                        votelist.append(vote)
                    })
                        votelist = votelist.reverse()
                        completion(result:  votelist,error:  nil)
                    }else{
                        
                        completion(result:  nil,error:  nil)
                    }
                }
        
        
        
    }
    class func addVoteInfo(voteInfo:VoteInfo,completion:(result:Bool)->Void){
        let object = AVObject(className: "VoteList")
        object.setObject(voteInfo.isVoted ?? false, forKey: "IsVoted")
        object.setObject(voteInfo.voteTitle, forKey: "VoteName")
        object.setObject(voteInfo.voteDes, forKey: "VoteDes")
        let items = NSMutableArray()
        voteInfo.voteItems.forEach { (item) in
            items.addObject(item.itemsContent ?? "")
        }
        object.setObject(items, forKey: "VoteItem")
        object.setObject(voteInfo.username, forKey: "UserName")
        object.setObject(voteInfo.userImage, forKey: "UserImage")
        object.setObject(voteInfo.voteState ?? true, forKey: "VoteState")
        object.setObject(voteInfo.ismorechoice ?? true, forKey: "IsOneChoice")
        object.saveInBackgroundWithBlock { (bool, error) in
            completion(result: bool)
        }
    }
    
    class func changeGroupInfo(group:DDGroup,value:AnyObject,key:String){
        let group = AVObject(outDataWithClassName: "GroupList",objectId: group.objectId)
        group.setObject(value, forKey: key)
        group.saveInBackground()
    }
    
}