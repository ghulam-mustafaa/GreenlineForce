//
//  UIStoryboard.swift
//  GreenLine
//
//  Created by BrainX Technologies IOS 4 on 31/07/2022.
//

import UIKit

extension UIStoryboard {
    enum Name: String {
        case Main
        case People
        case Chats
    }
}

extension Date {
    func formatDate(toFormat: String = "MMM yyyy") -> String {
        let dateFormator = DateFormatter()
        dateFormator.dateFormat = toFormat
        let resultDate = dateFormator.string(from: self)
        return resultDate
    }
    
    struct Formatter {
        static let iso8601: DateFormatter = {
            let formatter = DateFormatter()
//            formatter.calendar = Calendar(identifier: Calendar.Identifier.iso8601)
//            formatter.locale = Locale(identifier: "en_US_POSIX")
//            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            formatter.dateFormat = "yyyy-MM-dd'T'00:00:00.000"
            return formatter
        }()
        static let birthdate: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss"
            return formatter
        }()
        static let birthday: DateFormatter = {
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: Calendar.Identifier.iso8601)
            formatter.dateFormat = "dd MMM yyyy"
            return formatter
        }()
    }
    
    var iso8601: String { return Formatter.iso8601.string(from: self) }
    var birthdayString: String { return Formatter.birthday.string(from: self) }
    var sendBirthdayString: String { return Formatter.birthdate.string(from: self) }
    
    var startOfMonth: Date? {
            return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: self))
        }
        
        func firstDayOfWeek() -> Date {
            var c = Calendar(identifier: .iso8601)
            let date = c.date(from: c.dateComponents([.weekOfYear, .yearForWeekOfYear], from: self)) ?? Date()
            return date
        }
        
        func endOfMonth() -> Date? {
            return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth ?? Date())
        }
        
        static func dates(from fromDate: Date, to toDate: Date) -> [Date] {
            var dates: [Date] = []
            var date = fromDate
            
            while date <= toDate {
                dates.append(date)
                guard let newDate = Calendar.current.date(byAdding: .day, value: 1, to: date) else { break }
                date = newDate
            }
            return dates
        }
        
        var lastDayOfWeek: Date? {
            let startOfWeek = firstDayOfWeek()
            let end = Calendar.current.date(byAdding: DateComponents(day: 6), to: startOfWeek)
            return end
        }
        
        func toLocalTime() -> Date {
            let timezone    = TimeZone.current
            let seconds     = TimeInterval(timezone.secondsFromGMT(for: self))
            return Date(timeInterval: seconds, since: self)
        }
    
    
}
