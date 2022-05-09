//
//  Date+Extension.swift
//  Awasthi027
//
//  Created by Ashish Awasthi on 12/12/21.
//

import Foundation

extension Date {
    /// date formatter class
    private static let genericFormatter = Date.databaseISO8601FormatterFactory()
    /// local time zone abbrevation
    private static func localTimeZoneAbbreviation() -> String {
        return TimeZone.current.abbreviation() ?? ""
    }
    /// formate date to local fomate
    private static func databaseISO8601FormatterFactory() -> DateFormatter {
        let formatter = DateFormatter()
        let calendar = Calendar.init(identifier: .gregorian)
        formatter.calendar = calendar
        formatter.timeZone = TimeZone.current
        formatter.locale = NSLocale.current
        return formatter
    }
    /// convert timestamp to date
   public static func dateFromTimeStamp(_ timeStamp: TimeInterval) ->Date? {
        let date = Date(timeIntervalSince1970: timeStamp)
        let formatter = Date.genericFormatter
        formatter.dateFormat = "hh:mm a MMMM dd, yyyy"
        return formatter.date(from: formatter.string(from: date))
    }
    /// get string date in format 10:00 am Janbuary 01, 2022
    var timeDate: String {
        let formatter = Date.genericFormatter
        formatter.dateFormat = "hh:mm a MMMM dd, yyyy"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        return formatter.string(from: self)
    }
    /// get short time format in month 10:00 am Jan, 01
    var shortMonthTime: String {
        let formatter = Date.genericFormatter
        formatter.dateFormat = "hh:mm a MMM dd"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        return formatter.string(from: self)
    }
    /// get string date in format 10:00 am Janbuary 01, 2022
    var recordTime: String {
        let formatter = Date.genericFormatter
        formatter.dateFormat = "hh:mm a MMMM dd, yyyy"
        return formatter.string(from: self)
    }
    /// get string date in format 10:00 am Janbuary 01, 2022
    static func dateFromString(_ date: String) ->Date? {
        let formatter = Date.genericFormatter
        formatter.dateFormat = "hh:mm a MMMM dd, yyyy"
        return formatter.date(from: date)
    }
    /// get previous date
    var isPreviousDate: Bool {
        let timeLeft =  Calendar.current.dateComponents([.day, .hour, .minute,.second], from: Date(), to: self)
        if let day = timeLeft.day, let hour = timeLeft.hour, let minute = timeLeft.minute, day < 0 || hour < 0 || minute < 0 {
            return true
        }
        return false
    }
    // get remaing days from date
    var remaingTimeForEvent: String {
        // Change the seconds to days, hours, minutes and seconds
        let timeLeft =  Calendar.current.dateComponents([.day, .hour, .minute,.second], from: Date(), to: self)
        var timeLeftStr = ""
        // Display Countdown
        guard let hour = timeLeft.hour,let minute = timeLeft.minute,let second = timeLeft.second else {
            return timeLeftStr
        }
        if let day = timeLeft.day, day <= 0, minute <= 0, hour <= 0 {
            return "\(abs(day))d \(abs(hour))h \(abs(minute))m ago"
        }
        if let day = timeLeft.day, day > 0 {
            timeLeftStr = "\(day)d \(hour)h \(minute)m \(second)s"
        } else {
            timeLeftStr = "\(hour)h \(minute)m \(second)s"
        }
        return timeLeftStr
    }
    /// is time cross status true/false
    func isTimeCross(_ mins: Int, date: Date) ->Bool {
        let timeLeft =  Calendar.current.dateComponents([.day, .hour, .minute,.second], from: date, to: self)
        // Display Countdown
        guard let minute = timeLeft.minute, minute > mins else {
            return false
        }
        return true
    }
    /// date expire status true/false
    var isDateExpire: Bool {
        // Change the seconds to days, hours, minutes and seconds
        let timeLeft =  Calendar.current.dateComponents([.day, .hour, .minute,.second], from: Date(), to: self)
        // Display Countdown
        guard let days = timeLeft.day, let hour = timeLeft.hour,let minute = timeLeft.minute,let second = timeLeft.second else {
            return false
        }
        if days < 0, hour < 0,minute < 0, second < 0  {
            return true
        }
        return false
    }
    ///
    var versionDate: String {
        let formatter = Date.genericFormatter
        formatter.dateFormat = "ddMMyyyy"
        return formatter.string(from: self)
    }
    
    var dateInMonthDayYear: String {
        let formatter = Date.genericFormatter
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
    /// get past years date 
    func dateBeforeYear(_ year: Int) -> Date? {
        return Calendar.current.date(byAdding: .year, value: -year, to: self)
    }
}
