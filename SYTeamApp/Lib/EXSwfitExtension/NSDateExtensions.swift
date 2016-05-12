//
//  NSDateExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 15/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//
import UIKit
struct Formatter {
    static var fmt = NSDateFormatter()
}
extension NSDate {
    
    /// EZSwiftExtensions
    public convenience init?(fromString string: String, format: String) {
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        if let date = formatter.dateFromString(string) {
            self.init(timeInterval: 0, sinceDate: date)
        } else {
            return nil
        }
    }
    class var defaultFormatter:NSDateFormatter {
        
        Formatter.fmt.locale = NSLocale(localeIdentifier: "en")
        return Formatter.fmt
        
    }
    ///  返回日期描述字符串
    ///
    ///     格式如下
    ///     -   刚刚(一分钟内)
    ///     -   X分钟前(一小时内)
    ///     -   X小时前(当天)
    ///     -   昨天 HH:mm(昨天)
    ///     -   MM-dd HH:mm(一年内)
    ///     -   yyyy-MM-dd HH:mm(更早期)
    func timePassed() -> String {
        
        // 在ios中处理日期使用calendar
        let calendar = NSCalendar.currentCalendar()
        
        // 判断是否是今天
        if calendar.isDateInToday(self) {
            
            // 获取self和当前日期相差的秒数
            let delta = Int(NSDate().timeIntervalSinceDate(self))
            
            if delta < 60 {
                return "刚刚"
            }
            
            if delta < 60 * 60 {
                return "\(delta / 60) 分钟前"
            }
            return "\(delta / 3600) 小时前"
        }
        
        var fmtString = "HH:mm"
        
        // 判断是否是昨天
        if calendar.isDateInYesterday(self) {
            
            fmtString = "昨天 \(fmtString)"
            
        } else {
            
            // 比较年份
            let result = calendar.compareDate(self, toDate: NSDate(), toUnitGranularity: NSCalendarUnit.Year)
            
            if result == NSComparisonResult.OrderedSame {
                
                // 同一年
                fmtString = "MM-dd \(fmtString)"
                
            } else {
                
                // 更早期
                fmtString = "yyyy-MM-dd \(fmtString)"
            }
        }
        
        
        
        NSDate.defaultFormatter.dateFormat = fmtString
        
        return NSDate.defaultFormatter.stringFromDate(self)
    }
    func chatTimePassed() -> String {
        
        // 在ios中处理日期使用calendar
        let calendar = NSCalendar.currentCalendar()
        
        var fmtString = "HH:mm"
        
        // 判断是否是今天
//        if calendar.isDateInToday(self) {
//            
//            // 获取self和当前日期相差的秒数
//            let delta = Int(NSDate().timeIntervalSinceDate(self))
//            if delta < 60 {
//                return ""
//            }
        
//            if delta < 60 * 60 {
//                return "\(delta / 60) 分钟前"
//            }
//            return "\(delta / 3600) 小时前"
//        }
        
      
        
        // 判断是否是昨天
        if calendar.isDateInYesterday(self) {
            
            fmtString = "昨天 \(fmtString)"
            
        } else {
            
            // 比较年份
            let result = calendar.compareDate(self, toDate: NSDate(), toUnitGranularity: NSCalendarUnit.Year)
            
            if result == NSComparisonResult.OrderedSame {
                
                // 同一年
                fmtString = "MM-dd \(fmtString)"
                
            } else {
                
                // 更早期
                fmtString = "yyyy-MM-dd \(fmtString)"
            }
        }
        
        
        
        NSDate.defaultFormatter.dateFormat = fmtString
        
        return NSDate.defaultFormatter.stringFromDate(self)
    }
    /// EZSwiftExtensions
    public func toString(dateStyle dateStyle: NSDateFormatterStyle = .MediumStyle, timeStyle: NSDateFormatterStyle = .MediumStyle) -> String {
        let formatter = NSDateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        return formatter.stringFromDate(self)
    }
    
    /// EZSwiftExtensions
    public func toString(format format: String) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        return formatter.stringFromDate(self)
    }
    
    /// EZSwiftExtensions
    public func daysInBetweenDate(date: NSDate) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff/86400)
        return diff
    }
    
    /// EZSwiftExtensions
    public func hoursInBetweenDate(date: NSDate) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff/3600)
        return diff
    }
    
    /// EZSwiftExtensions
    public func minutesInBetweenDate(date: NSDate) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff/60)
        return diff
    }
    
    /// EZSwiftExtensions
    public func secondsInBetweenDate(date: NSDate) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff)
        return diff
    }
    
//    /// EZSwiftExtensions
//    public func timePassed() -> String {
//        let date = NSDate()
//        let calendar = NSCalendar.currentCalendar()
//        let components = calendar.components([.Year, .Month, .Day, .Hour, .Minute, .Second], fromDate: self, toDate: date, options: [])
//        var str: String
//
//        if components.year >= 1 {
//            components.year == 1 ? (str = "year") : (str = "years")
//            return "\(components.year) \(str) ago"
//        } else if components.month >= 1 {
//            components.month == 1 ? (str = "month") : (str = "months")
//            return "\(components.month) \(str) ago"
//        } else if components.day >= 1 {
//            components.day == 1 ? (str = "day") : (str = "days")
//            return "\(components.day) \(str) ago"
//        } else if components.hour >= 1 {
//            components.hour == 1 ? (str = "hour") : (str = "hours")
//            return "\(components.hour) \(str) ago"
//        } else if components.minute >= 1 {
//            components.minute == 1 ? (str = "minute") : (str = "minutes")
//            return "\(components.minute) \(str) ago"
//        } else if components.second == 0 {
//            return "Just now"
//        } else {
//            return "\(components.second) seconds ago"
//        }
//    }
    
}

extension NSDate: Comparable {}

public func ==(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.isEqualToDate(rhs)
}

public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == .OrderedAscending
}


