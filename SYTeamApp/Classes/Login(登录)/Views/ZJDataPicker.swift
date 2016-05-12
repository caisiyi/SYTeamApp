//
//  ZJDataPicker.swift
//  Login_Demo
//
//  Created by MAC on 16/4/9.
//  Copyright © 2016年 MAC. All rights reserved.
//

import UIKit

class ZJDataPicker: UIDatePicker {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.datePickerMode = .Date
        self.locale = NSLocale(localeIdentifier: "zh_CN")
        self.addTarget(self, action: "dateChanged:", forControlEvents: .ValueChanged)
//        let date = NSDate.createNSDateFromString("2016-03-01")
    }
    func dateChanged(datePicker : UIDatePicker){
        //更新提醒时间文本框
        let formatter = NSDateFormatter()
        //日期样式
        formatter.dateFormat = "yyyy年MM月dd日"
        print(formatter.stringFromDate(datePicker.date))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
//extension NSDate {
//    
//    class func createNSDateFromString(str:String?,template:String = "yyyy-MM-dd")->NSDate?{
//        let dateFormatter = NSDateFormatter()
//        dateFormatter.dateFormat = template
//        dateFormatter.locale = NSLocale(localeIdentifier: "ch_zn")
//        if str == nil {
//            return nil
//        }
//        return dateFormatter.dateFromString(str!)
//}
//}