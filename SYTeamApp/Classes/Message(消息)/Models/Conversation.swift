//
//  Message.swift
//  SYTeamApp
//
//  Created by 蔡斯仪 on 16/4/7.
//  Copyright © 2016年 caisiyi. All rights reserved.
//


class Conversation: NSObject {
    var Id:Int = 0
    var isGruop:Bool = false
    var fromId:Int = 0
    var fromName:String = "标题"
    var icon:String = ""
    var unReadCount:Int = 1
    var lastTime:String = "2016-3-3 3:33"
    var laseMessage:String = "最后的内容"
}