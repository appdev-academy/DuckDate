//
//  NSDate.swift
//  App Dev Academy
//
//  Created by App Dev Academy on 09.05.2016
//  Copyright © 2016 App Dev Academy. All rights reserved.
//

import Foundation

/**
    Class for setting first day of the week
*/
public class DuckDate {
    
    /**
        Weekday enum Monday-Sunday
    */
    public enum Weekday: Int {
        case Monday = 2
        case Tuesday = 3
        case Wednesday = 4
        case Thursday = 5
        case Friday = 6
        case Saturday = 7
        case Sunday = 1
    }
    
    /**
        First day of the week, be default is Monday
    */
    public static var firstDayOfTheWeek: Weekday = .Monday
}

public extension NSCalendar {
    /**
        Returns Gregorian NSCalendar instance
    */
    public class var gregorianCalendar: NSCalendar {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        calendar.firstWeekday = DuckDate.firstDayOfTheWeek.rawValue
        return calendar
    }
}

/**
    NSDate extension with handy helpers to work with dates
    WARNING: This library works only with Gregorian calendar
*/
public extension NSDate {
    /**
        Enumeration of available date components
    */
    internal enum DateComponent {
        case Day
        case Week
        case Month
        case Year
    }
    
    // MARK: - NSDate to String
    
    /**
        String representation of date with format "dd"
    */
    public var dayNumberString: String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.stringFromDate(self)
    }
    
    /**
        String representation of date with format "yyyy"
    */
    public var yearString: String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.stringFromDate(self)
    }
    
    /**
        String representation of date with format "MM"
    */
    public var monthNumberString: String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM"
        return dateFormatter.stringFromDate(self)
    }
    
    /**
        String representation of date with format "LLLL"
    */
    public var monthName: String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "LLLL"
        return dateFormatter.stringFromDate(self)
    }
    
    /**
        String representation of date with format "yyyy-MM-dd"
    */
    public var shortDateString: String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.stringFromDate(self)
    }
    
    // MARK: - NSCalendarUnit
    
    /**
        Get NSDate at the start of calendar unit
     
        - parameter calendarUnit: NSCalendarUnit object
    */
    public func startOfCalendarUnit(calendarUnit: NSCalendarUnit) -> NSDate {
        var startDate: NSDate?
        NSCalendar.gregorianCalendar.rangeOfUnit(calendarUnit, startDate: &startDate, interval: nil, forDate: self)
        return startDate!
    }
    
    /**
        Get NSDate at the end of calendar unit
     
        - parameter calendarUnit: NSCalendarUnit object
    */
    public func endOfCalendarUnit(calendarUnit: NSCalendarUnit) -> NSDate {
        var startDate: NSDate?
        var timeInterval: NSTimeInterval = 0
        NSCalendar.gregorianCalendar.rangeOfUnit(calendarUnit, startDate: &startDate, interval: &timeInterval, forDate: self)
        return startDate!.dateByAddingTimeInterval(timeInterval)
    }
    
    /**
        Add date component to current date
     
        - parameter component: DateComponent to add (e.g. week)
        - parameter count: number of DateComponents to add (e.g 3 weeks)
    */
    internal func addDateComponent(component: DateComponent, count: Int) -> NSDate {
        let calendar = NSCalendar.gregorianCalendar
        let components = NSDateComponents()
        
        switch component {
            case .Day:
                components.day = count
            case .Week:
                components.weekOfYear = count
            case .Month:
                components.month = count
            case .Year:
                components.year = count
        }
        
        return calendar.dateByAddingComponents(components, toDate: self, options: [])!
    }
    
    // MARK: - Add or remove DateComponent
    
    /**
        One day after current date
    */
    public var plusOneDay: NSDate {
        get {
            return self.addDateComponent(.Day, count: 1)
        }
    }
    
    /**
        Increase current date by multiple days
     
        - parameter numberOfDays: Number of days to increase current date
    */
    public func plusDays(numberOfDays: Int) -> NSDate {
        return self.addDateComponent(.Day, count: numberOfDays)
    }
    
    /**
        One day before current date
    */
    public var minusOneDay: NSDate {
        get {
            return self.addDateComponent(.Day, count: -1)
        }
    }
    
    /**
        Decrease current date by multiple days
     
        - parameter numberOfDays: Number of days to decrease current date
    */
    public func minusDays(numberOfDays: Int) -> NSDate {
        return self.addDateComponent(.Day, count: -numberOfDays)
    }
    
    /**
        One week after current date
    */
    public var plusOneWeek: NSDate {
        get {
            return self.addDateComponent(.Week, count: 1)
        }
    }
    
    /**
        Increase current date by multiple weeks
     
        - parameter numberOfWeeks: Number of weeks to increase current date
    */
    public func plusWeeks(numberOfWeeks: Int) -> NSDate {
        return self.addDateComponent(.Week, count: numberOfWeeks)
    }
    
    /**
        One week before current date
    */
    public var minusOneWeek: NSDate {
        get {
            return self.addDateComponent(.Week, count: -1)
        }
    }
    
    /**
        Decrease current date by multiple weeks
     
        - parameter numberOfWeeks: Number of weeks to decrease current date
    */
    public func minusWeeks(numberOfWeeks: Int) -> NSDate {
        return self.addDateComponent(.Week, count: -numberOfWeeks)
    }
    
    /**
        One month after current date
    */
    public var plusOneMonth: NSDate {
        get {
            return self.addDateComponent(.Month, count: 1)
        }
    }
    
    /**
        Increase current date by multiple months
     
        - parameter numberOfMonths: Number of months to increase current date
    */
    public func plusMonths(numberOfMonths: Int) -> NSDate {
        return self.addDateComponent(.Month, count: numberOfMonths)
    }
    
    /**
        One month before current date
    */
    public var minusOneMonth: NSDate {
        get {
            return self.addDateComponent(.Month, count: -1)
        }
    }
    
    /**
        Decrease current date by multiple months
     
        - parameter numberOfMonths: Number of months to decrease current date
    */
    public func minusMonths(numberOfMonths: Int) -> NSDate {
        return self.addDateComponent(.Month, count: -numberOfMonths)
    }
    
    /**
        One year after current date
    */
    public var plusOneYear: NSDate {
        get {
            return self.addDateComponent(.Year, count: 1)
        }
    }
    
    /**
        Increase current date by multiple years
     
        - parameter numberOfYears: Number of years to increase current date
    */
    public func plusYears(numberOfYears: Int) -> NSDate {
        return self.addDateComponent(.Year, count: numberOfYears)
    }
    
    /**
        One year before current date
    */
    public var minusOneYear: NSDate {
        get {
            return self.addDateComponent(.Year, count: -1)
        }
    }
    
    /**
        Decrease current date by multiple years
     
        - parameter numberOfYears: Number of years to decrease current date
    */
    public func minusYears(numberOfYears: Int) -> NSDate {
        return self.addDateComponent(.Year, count: -numberOfYears)
    }
    
    // MARK: - Start/end of the day, week, month, year
    
    /**
        Date at the start of the day
    */
    public var startOfDay: NSDate {
        get {
            return self.startOfCalendarUnit(.Day)
        }
    }
    
    /**
        Date at the end of the day
    */
    public var endOfDay: NSDate {
        get {
            return self.endOfCalendarUnit(.Day)
        }
    }
    
    /**
        Date at the start of the week
    */
    public var startOfWeek: NSDate {
        get {
            return self.startOfCalendarUnit(.WeekOfYear)
        }
    }
    
    /**
        Date at the end of the week
    */
    public var endOfWeek: NSDate {
        get {
            return self.endOfCalendarUnit(.WeekOfYear)
        }
    }
    
    /**
        Date at the start of the month
    */
    public var startOfMonth: NSDate {
        get {
            return self.startOfCalendarUnit(.Month)
        }
    }
    
    /**
        Date at the end of the month
    */
    public var endOfMonth: NSDate {
        get {
            return self.endOfCalendarUnit(.Month)
        }
    }
    
    /**
        Date at the start of the year
    */
    public var startOfYear: NSDate {
        get {
            return self.startOfCalendarUnit(.Year)
        }
    }
    
    /**
        Date at the end of the year
    */
    public var endOfYear: NSDate {
        get {
            return self.endOfCalendarUnit(.Year)
        }
    }
    
    // MARK: - Dates comparison
    
    /**
        Check if current date comes after date
     
        - parameter date: NSDate object to compare
    */
    public func isAfterDate(date: NSDate) -> Bool {
        return self.compare(date) == NSComparisonResult.OrderedDescending
    }
    
    /**
        Check if current date comes before date
     
        - parameter date: NSDate object to compare
    */
    public func isBeforeDate(date: NSDate) -> Bool {
        return self.compare(date) == NSComparisonResult.OrderedAscending
    }
    
    /**
        Check if current date is equal to date
     
        - parameter date: NSDate object to compare
    */
    public func equalToDate(date: NSDate) -> Bool {
        return self.compare(date) == NSComparisonResult.OrderedSame
    }
    
    // MARK: - Components between dates
    
    /**
        Number of days since date
     
        - parameter date: NSDate object to compare
    */
    public func daysSinceDate(date: NSDate) -> Int {
        let components = NSCalendar.gregorianCalendar.components(NSCalendarUnit.Day, fromDate: date, toDate: self, options: [])
        return components.day
    }
    
    /**
        Number of days before date
     
        - parameter date: NSDate object to compare
    */
    public func daysBeforeDate(date: NSDate) -> Int {
        let components = NSCalendar.gregorianCalendar.components(NSCalendarUnit.Day, fromDate: self, toDate: date, options: [])
        return components.day
    }
    
    /**
        Number of weeks since date
     
        - parameter date: NSDate object to compare
    */
    public func weeksSinceDate(date: NSDate) -> Int {
        let components = NSCalendar.gregorianCalendar.components(NSCalendarUnit.WeekOfYear, fromDate: date, toDate: self, options: [])
        return components.weekOfYear
    }
    
    /**
        Number of weeks before date
     
        - parameter date: NSDate object to compare
    */
    public func weeksBeforeDate(date: NSDate) -> Int {
        let components = NSCalendar.gregorianCalendar.components(NSCalendarUnit.WeekOfYear, fromDate: self, toDate: date, options: [])
        return components.weekOfYear
    }
    
    /**
        Number of months since date
     
        - parameter date: NSDate object to compare
    */
    public func monthsSinceDate(date: NSDate) -> Int {
        let components = NSCalendar.gregorianCalendar.components(NSCalendarUnit.Month, fromDate: date, toDate: self, options: [])
        return components.month
    }
    
    /**
        Number of months before date
     
        - parameter date: NSDate object to compare
    */
    public func monthsBeforeDate(date: NSDate) -> Int {
        let components = NSCalendar.gregorianCalendar.components(NSCalendarUnit.Month, fromDate: self, toDate: date, options: [])
        return components.month
    }
    
    /**
        Number of years since date
     
        - parameter date: NSDate object to compare
    */
    public func yearsSinceDate(date: NSDate) -> Int {
        let components = NSCalendar.gregorianCalendar.components(NSCalendarUnit.Year, fromDate: date, toDate: self, options: [])
        return components.year
    }
    
    /**
        Number of years before date
     
        - parameter date: NSDate object to compare
    */
    public func yearsBeforeDate(date: NSDate) -> Int {
        let components = NSCalendar.gregorianCalendar.components(NSCalendarUnit.Year, fromDate: self, toDate: date, options: [])
        return components.year
    }
}