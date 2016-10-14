//
//  NSDate.swift
//  App Dev Academy
//
//  Created by App Dev Academy on 09.05.2016
//  Copyright © 2016 App Dev Academy. All rights reserved.
//

import Foundation

// MARK: - DuckDate class

/// Class for setting first day of the week
open class DuckDate {
  
  /// Weekday enum Monday-Sunday
  public enum Weekday: Int {
    case monday = 2
    case tuesday = 3
    case wednesday = 4
    case thursday = 5
    case friday = 6
    case saturday = 7
    case sunday = 1
  }
  
  /// First day of the week, be default is Monday
  open static var firstDayOfTheWeek: Weekday = .monday
}

// MARK: - Calendar extension

public extension Calendar {
  
  /// Returns Gregorian NSCalendar instance
  public static var gregorianCalendar: Calendar {
    var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    calendar.firstWeekday = DuckDate.firstDayOfTheWeek.rawValue
    return calendar
  }
}

// MARK: - Date extension

/// NSDate extension with handy helpers to work with dates
/// WARNING: This library works only with Gregorian calendar
public extension Date {
  
  /// Enumeration of available date components
  internal enum DateComponent {
    case hour
    case day
    case week
    case month
    case year
  }
  
  // MARK: Date to String
  
  /// String representation of date with format "dd"
  public var dayNumberString: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd"
    return dateFormatter.string(from: self)
  }
  
  /// String representation of date with format "yyyy"
  public var yearString: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy"
    return dateFormatter.string(from: self)
  }
  
  /// String representation of date with format "MM"
  public var monthNumberString: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM"
    return dateFormatter.string(from: self)
  }
  
  /// String representation of date with format "LLLL"
  public var monthName: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "LLLL"
    return dateFormatter.string(from: self)
  }
  
  /// String representation of date with format "yyyy-MM-dd"
  public var shortDateString: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.string(from: self)
  }
  
  // MARK: NSCalendar.Unit
  
  /// Get Date at the start of calendar unit
  ///
  /// - parameter calendarUnit: NSCalendar.Unit value
  ///
  /// - returns: Date
  public func startOfCalendarUnit(_ calendarUnit: NSCalendar.Unit) -> Date {
    var startDate: NSDate?
    (Calendar.gregorianCalendar as NSCalendar).range(of: calendarUnit, start: &startDate, interval: nil, for: self)
    return startDate! as Date
  }
  
  /// Get Date at the end of calendar unit
  ///
  /// - parameter calendarUnit: NSCalendar.Unit value
  ///
  /// - returns: Date
  public func endOfCalendarUnit(_ calendarUnit: NSCalendar.Unit) -> Date {
    var startDate: NSDate?
    var timeInterval: TimeInterval = 0
    (Calendar.gregorianCalendar as NSCalendar).range(of: calendarUnit, start: &startDate, interval: &timeInterval, for: self)
    return startDate!.addingTimeInterval(timeInterval) as Date
  }
  
  /// Add date component to current date
  ///
  /// - parameter component: DateComponent to add (e.g. week)
  /// - parameter count:     number of DateComponents to add (e.g 3 weeks)
  ///
  /// - returns: New date with added component
  internal func addDateComponent(_ component: DateComponent, count: Int) -> Date {
    let calendar = Calendar.gregorianCalendar
    var components = DateComponents()
    
    switch component {
    case .hour:
      components.hour = count
    case .day:
      components.day = count
    case .week:
      components.weekOfYear = count
    case .month:
      components.month = count
    case .year:
      components.year = count
    }
    return (calendar as NSCalendar).date(byAdding: components, to: self, options: [])!
  }
  
  // MARK: Add or remove DateComponent
  
  /// One hour after current date
  public var plusOneHour: Date {
    return self.addDateComponent(.hour, count: 1)
  }
	
  /// Increase current date by multiple hours
  ///
  /// - parameter numberOfHours: Number of hours to increase current date
  ///
  /// - returns: Updated date
  public func plusHours(_ numberOfHours: Int) -> Date {
    return self.addDateComponent(.hour, count: numberOfHours)
  }
  
  /// One hour before current date
  public var minusOneHour: Date {
    return self.addDateComponent(.hour, count: -1)
  }
  
  /// Decrease current date by multiple hours
  ///
  /// - parameter numberOfHours: Number of hours to decrease current date
  ///
  /// - returns: Updated date
  public func minusHours(_ numberOfHours: Int) -> Date {
    return self.addDateComponent(.hour, count: -numberOfHours)
  }
  
  /// One day after current date
  public var plusOneDay: Date {
    return self.addDateComponent(.day, count: 1)
  }
  
  /// Increase current date by multiple days
  ///
  /// - parameter numberOfDays: Number of days to increase current date
  ///
  /// - returns: Updated date
  public func plusDays(_ numberOfDays: Int) -> Date {
    return self.addDateComponent(.day, count: numberOfDays)
  }
  
  /// One day before current date
  public var minusOneDay: Date {
    return self.addDateComponent(.day, count: -1)
  }
  
  /// Decrease current date by multiple days
  ///
  /// - parameter numberOfDays: Number of days to decrease current date
  ///
  /// - returns: Updated date
  public func minusDays(_ numberOfDays: Int) -> Date {
    return self.addDateComponent(.day, count: -numberOfDays)
  }
  
  /// One week after current date
  public var plusOneWeek: Date {
    return self.addDateComponent(.week, count: 1)
  }
  
  /// Increase current date by multiple weeks
  ///
  /// - parameter numberOfWeeks: Number of weeks to increase current date
  ///
  /// - returns: Updated date
  public func plusWeeks(_ numberOfWeeks: Int) -> Date {
    return self.addDateComponent(.week, count: numberOfWeeks)
  }
  
  /// One week before current date
  public var minusOneWeek: Date {
    return self.addDateComponent(.week, count: -1)
  }
  
  /// Decrease current date by multiple weeks
  ///
  /// - parameter numberOfWeeks: Number of weeks to decrease current date
  ///
  /// - returns: Updated date
  public func minusWeeks(_ numberOfWeeks: Int) -> Date {
    return self.addDateComponent(.week, count: -numberOfWeeks)
  }
  
  /// One month after current date
  public var plusOneMonth: Date {
    return self.addDateComponent(.month, count: 1)
  }
  
  /// Increase current date by multiple months
  ///
  /// - parameter numberOfMonths: Number of months to increase current date
  ///
  /// - returns: Updated date
  public func plusMonths(_ numberOfMonths: Int) -> Date {
    return self.addDateComponent(.month, count: numberOfMonths)
  }
  
  /// One month before current date
  public var minusOneMonth: Date {
    return self.addDateComponent(.month, count: -1)
  }
  
  /// Decrease current date by multiple months
  ///
  /// - parameter numberOfMonths: Number of months to decrease current date
  ///
  /// - returns: Updated date
  public func minusMonths(_ numberOfMonths: Int) -> Date {
    return self.addDateComponent(.month, count: -numberOfMonths)
  }
  
  /// One year after current date
  public var plusOneYear: Date {
    return self.addDateComponent(.year, count: 1)
  }
  
  /// Increase current date by multiple years
  ///
  /// - parameter numberOfYears: Number of years to increase current date
  ///
  /// - returns: Updated date
  public func plusYears(_ numberOfYears: Int) -> Date {
    return self.addDateComponent(.year, count: numberOfYears)
  }
  
  /// One year before current date
  public var minusOneYear: Date {
    return self.addDateComponent(.year, count: -1)
  }
  
  /// Decrease current date by multiple years
  ///
  /// - parameter numberOfYears: Number of years to decrease current date
  ///
  /// - returns: Updated date
  public func minusYears(_ numberOfYears: Int) -> Date {
    return self.addDateComponent(.year, count: -numberOfYears)
  }
  
  // MARK: Start/end of the day, week, month, year
  
  /// Date at the start of the day
  public var startOfDay: Date {
    return self.startOfCalendarUnit(.day)
  }
  
  /// Date at the end of the day
  public var endOfDay: Date {
    return self.endOfCalendarUnit(.day)
  }
  
  /// Date at the start of the week
  public var startOfWeek: Date {
    return self.startOfCalendarUnit(.weekOfYear)
  }
  
  /// Date at the end of the week
  public var endOfWeek: Date {
    return self.endOfCalendarUnit(.weekOfYear)
  }

  /// Date at the start of the month
  public var startOfMonth: Date {
    return self.startOfCalendarUnit(.month)
  }

  /// Date at the end of the month
  public var endOfMonth: Date {
    return self.endOfCalendarUnit(.month)
  }
  
  /// Date at the start of the year
  public var startOfYear: Date {
    return self.startOfCalendarUnit(.year)
  }
  
  /// Date at the end of the year
  public var endOfYear: Date {
    return self.endOfCalendarUnit(.year)
  }
  
  // MARK: Dates comparison
  
  /// Check if current date comes after date
  /// The same as `isGreaterThanDate(_:)`
  ///
  /// - parameter date: Date object to compare
  ///
  /// - returns: Bool
  public func isAfterDate(_ date: Date) -> Bool {
    return self.compare(date) == .orderedDescending
  }
  
  /// Check if current date is greater than another date
  /// The same as `isAfterDate(_:)`
  ///
  /// - parameter date: Date object to compare
  ///
  /// - returns: Bool
  public func isGreaterThanDate(_ date: Date) -> Bool {
    return self.isAfterDate(date)
  }
  
  /// Check if current date comes after date or equal
  /// The same as `isGreaterOrEqualToDate(_:)`
  ///
  /// - parameter date: Date object to compare
  ///
  /// - returns: Bool
  public func isOnOrAfterDate(_ date: Date) -> Bool {
    return self.compare(date) == .orderedDescending || self.compare(date) == .orderedSame
  }
  
  /// Check if current date is greater than another date or equal
  /// The same as `isOnOrAfterDate(_:)`
  ///
  /// - parameter date: Date object to compare
  ///
  /// - returns: Bool
  public func isGreaterOrEqualToDate(_ date: Date) -> Bool {
    return self.isOnOrAfterDate(date)
  }
  
  /// Check if current date comes before date
  /// The same as `isLessThanDate(_:)`
  ///
  /// - parameter date: Date object to compare
  ///
  /// - returns: Bool
  public func isBeforeDate(_ date: Date) -> Bool {
    return self.compare(date) == .orderedAscending
  }
  
  /// Check if current date less than another date
  /// The same as `isBeforeDate(_:)`
  ///
  /// - parameter date: Date to compare
  ///
  /// - returns: Bool
  public func isLessThanDate(_ date: Date) -> Bool {
    return self.isBeforeDate(date)
  }
  
  /// Check if current date comes before date or equal
  /// The same as `isLessOrEqualToDate(_:)`
  ///
  /// - parameter date: Date to compare
  ///
  /// - returns: Bool
  public func isOnOrBeforeDate(_ date: Date) -> Bool {
    return self.compare(date) == .orderedAscending || self.compare(date) == .orderedSame
  }
  
  /// Check if current date less than another date of equal
  /// The same as `isOnOrBeforeDate(_:)`
  ///
  /// - parameter date: Date to compare
  ///
  /// - returns: Bool
  public func isLessOrEqualToDate(_ date: Date) -> Bool {
    return self.isOnOrBeforeDate(date)
  }
  
  /// Check if current date is equal to date
  ///
  /// - parameter date: Date object to compare
  ///
  /// - returns: Bool
  public func equalToDate(_ date: Date) -> Bool {
    return self.compare(date) == ComparisonResult.orderedSame
  }
  
  // MARK: Components between dates
  
  /// Number of days since date
  ///
  /// - parameter date: Date object to compare
  ///
  /// - returns: Int
  public func daysSinceDate(_ date: Date) -> Int {
    let components = (Calendar.gregorianCalendar as NSCalendar).components(NSCalendar.Unit.day, from: date, to: self, options: [])
    return components.day!
  }
  
  /// Number of days before date
  ///
  /// - parameter date: Date object to compare
  ///
  /// - returns: Int
  public func daysBeforeDate(_ date: Date) -> Int {
    let components = (Calendar.gregorianCalendar as NSCalendar).components(NSCalendar.Unit.day, from: self, to: date, options: [])
    return components.day!
  }
  
  /// Number of weeks since date
  ///
  /// - parameter date: Date object to compare
  ///
  /// - returns: Int
  public func weeksSinceDate(_ date: Date) -> Int {
    let components = (Calendar.gregorianCalendar as NSCalendar).components(NSCalendar.Unit.weekOfYear, from: date, to: self, options: [])
    return components.weekOfYear!
  }

  /// Number of weeks before date
  ///
  /// - parameter date: Date object to compare
  ///
  /// - returns: Int
  public func weeksBeforeDate(_ date: Date) -> Int {
    let components = (Calendar.gregorianCalendar as NSCalendar).components(NSCalendar.Unit.weekOfYear, from: self, to: date, options: [])
    return components.weekOfYear!
  }
  
  /// Number of months since date
  ///
  /// - parameter date: Date object to compare
  ///
  /// - returns: Int
  public func monthsSinceDate(_ date: Date) -> Int {
    let components = (Calendar.gregorianCalendar as NSCalendar).components(NSCalendar.Unit.month, from: date, to: self, options: [])
    return components.month!
  }
  
  /// Number of months before date
  ///
  /// - parameter date: Date object to compare
  ///
  /// - returns: Int
  public func monthsBeforeDate(_ date: Date) -> Int {
    let components = (Calendar.gregorianCalendar as NSCalendar).components(NSCalendar.Unit.month, from: self, to: date, options: [])
    return components.month!
  }
  
  /// Number of years since date
  ///
  /// - parameter date: Date object to compare
  ///
  /// - returns: Int
  public func yearsSinceDate(_ date: Date) -> Int {
    let components = (Calendar.gregorianCalendar as NSCalendar).components(NSCalendar.Unit.year, from: date, to: self, options: [])
    return components.year!
  }
  
  /// Number of years before date
  ///
  /// - parameter date: Date object to compare
  ///
  /// - returns: Int
  public func yearsBeforeDate(_ date: Date) -> Int {
    let components = (Calendar.gregorianCalendar as NSCalendar).components(NSCalendar.Unit.year, from: self, to: date, options: [])
    return components.year!
  }
}