//
//  ConvertDateTime.swift
//  ExtensionDate
//
//  Created by Vu Quang Nam on 26/04/2022.
//

import Foundation

public extension Date {
    
    func timeAgoDisplayInLotus() -> String {
        
        let calendar = Calendar.current
        let minuteAgo = calendar.date(byAdding: .minute, value: -1, to: Date())!
        let hourAgo = calendar.date(byAdding: .hour, value: -1, to: Date())!
        let dayAgo = calendar.date(byAdding: .day, value: -1, to: Date())!
        let weekAgo = calendar.date(byAdding: .day, value: -7, to: Date())!
        let monthAgo = calendar.date(byAdding: .month, value: -1, to: Date())!
        
        if minuteAgo < self {
            let diff = Calendar.current.dateComponents([.second], from: self, to: Date()).second ?? 0
            var time = ""
            if (diff > 0) {
                time = "\(diff) giây trước"
            } else if (diff == 0) {
                time = "vừa xong"
            } else {
                time = ""
            }
            return time
        } else if hourAgo < self {
            let diff = Calendar.current.dateComponents([.minute], from: self, to: Date()).minute ?? 0
            return "\(diff) phút trước"
        } else if dayAgo < self {
            let diff = Calendar.current.dateComponents([.hour], from: self, to: Date()).hour ?? 0
            return "\(diff) giờ trước"
        } else if weekAgo < self {
            let diff = Calendar.current.dateComponents([.day], from: self, to: Date()).day ?? 0
            return "\(diff) ngày trước"
        }else if monthAgo < self {
            let diff = Calendar.current.dateComponents([.weekOfYear], from: self, to: Date()).weekOfYear ?? 0
            return "\(diff) tuần trước"
        }
//        let diff = Calendar.current.dateComponents([.weekOfYear], from: self, to: Date()).weekOfYear ?? 0
//        return "\(diff) tuần trước"
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        let day = df.string(from: self)
        return day
    }
    
    /// Returns the amount of years from another date
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    
    
    func toString()->String {
        let dayStr = self.dayLotus < 10 ? "0\(self.dayLotus)" : "\(self.dayLotus)"
        let monthStr = self.monthLotus < 10 ? "0\(self.monthLotus)" : "\(self.monthLotus)"
        return dayStr + "/" + monthStr + "/" + String(self.yearLotus)
    }
    
    func plusSeconds(_ s: UInt) -> Date {
        return self.addComponentsToDate(seconds: Int(s), minutes: 0, hours: 0, days: 0, weeks: 0, months: 0, years: 0)
    }
    
    func minusSeconds(_ s: UInt) -> Date {
        return self.addComponentsToDate(seconds: -Int(s), minutes: 0, hours: 0, days: 0, weeks: 0, months: 0, years: 0)
    }
    
    func plusMinutes(_ m: UInt) -> Date {
        return self.addComponentsToDate(seconds: 0, minutes: Int(m), hours: 0, days: 0, weeks: 0, months: 0, years: 0)
    }
    
    func minusMinutes(_ m: UInt) -> Date {
        return self.addComponentsToDate(seconds: 0, minutes: -Int(m), hours: 0, days: 0, weeks: 0, months: 0, years: 0)
    }
    
    func plusHours(_ h: UInt) -> Date {
        return self.addComponentsToDate(seconds: 0, minutes: 0, hours: Int(h), days: 0, weeks: 0, months: 0, years: 0)
    }
    
    func minusHours(_ h: UInt) -> Date {
        return self.addComponentsToDate(seconds: 0, minutes: 0, hours: -Int(h), days: 0, weeks: 0, months: 0, years: 0)
    }
    
    func plusDays(_ d: UInt) -> Date {
        return self.addComponentsToDate(seconds: 0, minutes: 0, hours: 0, days: Int(d), weeks: 0, months: 0, years: 0)
    }
    
    func minusDays(_ d: UInt) -> Date {
        return self.addComponentsToDate(seconds: 0, minutes: 0, hours: 0, days: -Int(d), weeks: 0, months: 0, years: 0)
    }
    
    func plusWeeks(_ w: UInt) -> Date {
        return self.addComponentsToDate(seconds: 0, minutes: 0, hours: 0, days: 0, weeks: Int(w), months: 0, years: 0)
    }
    
    func minusWeeks(_ w: UInt) -> Date {
        return self.addComponentsToDate(seconds: 0, minutes: 0, hours: 0, days: 0, weeks: -Int(w), months: 0, years: 0)
    }
    
    func plusMonths(_ m: UInt) -> Date {
        return self.addComponentsToDate(seconds: 0, minutes: 0, hours: 0, days: 0, weeks: 0, months: Int(m), years: 0)
    }
    
    func minusMonths(_ m: UInt) -> Date {
        return self.addComponentsToDate(seconds: 0, minutes: 0, hours: 0, days: 0, weeks: 0, months: -Int(m), years: 0)
    }
    
    func plusYears(_ y: UInt) -> Date {
        return self.addComponentsToDate(seconds: 0, minutes: 0, hours: 0, days: 0, weeks: 0, months: 0, years: Int(y))
    }
    
    func minusYears(_ y: UInt) -> Date {
        return self.addComponentsToDate(seconds: 0, minutes: 0, hours: 0, days: 0, weeks: 0, months: 0, years: -Int(y))
    }
    
    fileprivate func addComponentsToDate(seconds sec: Int, minutes min: Int, hours hrs: Int, days d: Int, weeks wks: Int, months mts: Int, years yrs: Int) -> Date {
        var dc: DateComponents = DateComponents()
        dc.second = sec
        dc.minute = min
        dc.hour = hrs
        dc.day = d
        dc.weekOfYear = wks
        dc.month = mts
        dc.year = yrs
        return (Calendar.current as NSCalendar).date(byAdding: dc, to: self, options: [])!
    }
    
    func midnightUTCDate() -> Date {
        var dc: DateComponents = (Calendar.current as NSCalendar).components([.year, .month, .day], from: self)
        dc.hour = 0
        dc.minute = 0
        dc.second = 0
        dc.nanosecond = 0
        (dc as NSDateComponents).timeZone = TimeZone(secondsFromGMT: 0)
        
        return Calendar.current.date(from: dc)!
    }
    
    static func secondsBetween(date1 d1:Date, date2 d2:Date) -> Int {
        let dc = (Calendar.current as NSCalendar).components(NSCalendar.Unit.second, from: d1, to: d2, options:[])
        return dc.second!
    }
    
    static func minutesBetween(date1 d1: Date, date2 d2: Date) -> Int {
        let dc = (Calendar.current as NSCalendar).components(NSCalendar.Unit.minute, from: d1, to: d2, options: [])
        return dc.minute!
    }
    
    static func hoursBetween(date1 d1: Date, date2 d2: Date) -> Int {
        let dc = (Calendar.current as NSCalendar).components(NSCalendar.Unit.hour, from: d1, to: d2, options: [])
        return dc.hour!
    }
    
    static func daysBetween(date1 d1: Date, date2 d2: Date) -> Int {
        let dc = (Calendar.current as NSCalendar).components(NSCalendar.Unit.day, from: d1, to: d2, options: [])
        return dc.day!
    }
    
    static func weeksBetween(date1 d1: Date, date2 d2: Date) -> Int {
        let dc = (Calendar.current as NSCalendar).components(NSCalendar.Unit.weekOfYear, from: d1, to: d2, options: [])
        return dc.weekOfYear!
    }
    
    static func monthsBetween(date1 d1: Date, date2 d2: Date) -> Int {
        let dc = (Calendar.current as NSCalendar).components(NSCalendar.Unit.month, from: d1, to: d2, options: [])
        return dc.month!
    }
    
    static func yearsBetween(date1 d1: Date, date2 d2: Date) -> Int {
        let dc = (Calendar.current as NSCalendar).components(NSCalendar.Unit.year, from: d1, to: d2, options: [])
        return dc.year!
    }
    
    //MARK- Comparison Methods
    
    func isAfter(_ date: Date) -> Bool {
        return (self.compare(date) == .orderedDescending)
    }
    
    func isBefore(_ date: Date) -> Bool {
        return (self.compare(date) == .orderedAscending)
    }
    
    //MARK- Computed Properties
    
    var dayLotus: UInt {
        if #available(iOS 8.0, *) {
            return UInt((Calendar.current as NSCalendar).component(.day, from: self))
        } else {
            // Fallback on earlier versions
            let flags: NSCalendar.Unit = NSCalendar.Unit.day
            let date = Date()
            let components = (Calendar.current as NSCalendar).components(flags, from: date)
            return UInt(components.day!)
        }
    }
    
    var monthLotus: UInt {
        if #available(iOS 8.0, *) {
            return UInt((Calendar.current as NSCalendar).component(.month, from: self))
        } else {
            // Fallback on earlier versions
            let flags: NSCalendar.Unit = NSCalendar.Unit.month
            let date = Date()
            let components = (Calendar.current as NSCalendar).components(flags, from: date)
            return UInt(components.month!)
        }
    }
    
    var yearLotus: UInt {
        if #available(iOS 8.0, *) {
            return UInt((Calendar.current as NSCalendar).component(.year, from: self))
        } else {
            // Fallback on earlier versions
            let flags: NSCalendar.Unit = NSCalendar.Unit.year
            let date = Date()
            let components = (Calendar.current as NSCalendar).components(flags, from: date)
            return UInt(components.year!)
        }
    }
    
    var hourLotus: UInt {
        if #available(iOS 8.0, *) {
            return UInt((Calendar.current as NSCalendar).component(.hour, from: self))
        } else {
            // Fallback on earlier versions
            let flags: NSCalendar.Unit = NSCalendar.Unit.hour
            let date = Date()
            let components = (Calendar.current as NSCalendar).components(flags, from: date)
            return UInt(components.hour!)
        }
    }
    
    var minuteLotus: UInt {
        if #available(iOS 8.0, *) {
            return UInt((Calendar.current as NSCalendar).component(.minute, from: self))
        } else {
            // Fallback on earlier versions
            let flags: NSCalendar.Unit = NSCalendar.Unit.minute
            let date = Date()
            let components = (Calendar.current as NSCalendar).components(flags, from: date)
            return UInt(components.minute!)
        }
    }
    
    var secondLotus: UInt {
        if #available(iOS 8.0, *) {
            return UInt((Calendar.current as NSCalendar).component(.second, from: self))
        } else {
            // Fallback on earlier versions
            let flags: NSCalendar.Unit = NSCalendar.Unit.second
            let date = Date()
            let components = (Calendar.current as NSCalendar).components(flags, from: date)
            return UInt(components.second!)
        }
    }
}

