//
//  User.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/3/24.
//  Copyright © 2016年 caisiyi. All rights reserved.
//

import Foundation


// 沙盒文档路径
let kSandDocumentPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last!

// 保存用户信息的路径
let filePath = "\(kSandDocumentPath)/UserInfo.data"

class UserAccount:NSObject , NSCoding{
    var nickname:String?
    var password:String?
    var LastLoginTime:String?
    var token:String?
    var iconImage:String?
    var name:String?
    var phone:String?
    var price:Int?
    var discount:Int?
    var sex:String?
    var department:String?
    var address:String?
    var sign:String?
    var worknumber:String?
    static var shareUser: UserAccount = {
        if let account = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) {
            return account as! UserAccount
        }
        return UserAccount()
    }()
    class func  LoadUserInfo(){
        let query = AVQuery(className: "UserList")
        query.whereKey("userName", equalTo: UserAccount.shareUser.name!)
        query.getFirstObjectInBackgroundWithBlock { (groupObject, error) in
            UserAccount.shareUser.nickname = groupObject.objectForKey("userNickName") as? String
            UserAccount.shareUser.sex = groupObject.objectForKey("userSex") as? String
            UserAccount.shareUser.department = groupObject.objectForKey("userDepartment") as? String
            UserAccount.shareUser.iconImage = groupObject.objectForKey("userImage") as? String
            UserAccount.shareUser.sign = groupObject.objectForKey("userSign") as? String
            UserAccount.shareUser.worknumber = groupObject.objectForKey("userWorkNumber")as? String
            UserAccount.shareUser.iconImage = groupObject.objectForKey("userImage")as?String
            UserAccount.shareUser.saveUserAccount()
        }
    }
    class func ChangeUserInfo(value:AnyObject,key:String){
        let query = AVQuery(className: "UserList")
        query.whereKey("userName", equalTo: UserAccount.shareUser.name!)
        let groupObject = query.getFirstObject()
        groupObject.setObject(value, forKey: key)
        groupObject.saveInBackground()
        UserAccount.shareUser.setValue(value, forKey: key)
        UserAccount.shareUser.saveUserAccount()

    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    override func setValue(value: AnyObject?, forKey key: String) {
    
        super.setValue(value, forKey: key)
    }
    // 防止外界初始化
    override init() {}
    
    func saveUserAccount() {
        NSKeyedArchiver.archiveRootObject(self, toFile: filePath)
    }
    /**
     *  归档、解档
     */
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(nickname, forKey: "nickname")
        aCoder.encodeObject(password, forKey: "password")
        aCoder.encodeObject(LastLoginTime, forKey: "LastLoginTime")
        aCoder.encodeObject(token, forKey: "token")
        aCoder.encodeObject(iconImage, forKey: "iconImage")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(phone, forKey: "phone")
        aCoder.encodeObject(price, forKey: "price")
        aCoder.encodeObject(sex, forKey: "sex")
        aCoder.encodeObject(discount, forKey: "discount")
        aCoder.encodeObject(department, forKey: "department")
        aCoder.encodeObject(address, forKey: "address")
        aCoder.encodeObject(sign, forKey: "sign")
        aCoder.encodeObject(worknumber, forKey: "worknumber")
    }
    required init?(coder aDecoder: NSCoder) {
        nickname = aDecoder.decodeObjectForKey("username") as? String
        password = aDecoder.decodeObjectForKey("password") as? String
        LastLoginTime = aDecoder.decodeObjectForKey("LastLoginTime") as? String
        token = aDecoder.decodeObjectForKey("token") as? String
        iconImage = aDecoder.decodeObjectForKey("iconImage") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        phone = aDecoder.decodeObjectForKey("phone") as? String
        price = aDecoder.decodeObjectForKey("price") as? Int
        sex = aDecoder.decodeObjectForKey("sex") as? String
        discount = aDecoder.decodeObjectForKey("discount") as? Int
        department = aDecoder.decodeObjectForKey("department") as? String
        address = aDecoder.decodeObjectForKey("address") as? String
        sign = aDecoder.decodeObjectForKey("sign") as? String
        
        worknumber = aDecoder.decodeObjectForKey("worknumber") as? String
    }
}
