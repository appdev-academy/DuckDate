//
//  AppDelegate.swift
//  DuckDate_macOS
//
//  Created by Yura Voevodin on 13.09.16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Cocoa
import DuckDate

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        print("=================================================")
        
        let currentDate = NSDate()
        print("Current date: ", currentDate)
        print("Start of day: ", currentDate.startOfDay)
        print("End of day: ", currentDate.endOfDay)
        print("Start of week: ", currentDate.startOfWeek)
        print("End of week: ", currentDate.endOfWeek)
        print("Start of month: ", currentDate.startOfMonth)
        print("End of month: ", currentDate.endOfMonth)
        
        let components = NSDateComponents()
        components.day = 27
        components.month = 2
        components.year = 1992
        
        let calendar = NSCalendar.gregorianCalendar
        
        if let myBirthday = calendar.dateFromComponents(components) {
            print("=================================================")
            
            print("Birthday:", myBirthday)
            
            print("Days since:", currentDate.daysSinceDate(myBirthday))
            print("Days before:", myBirthday.daysBeforeDate(currentDate))
            print("Weeks since:", currentDate.weeksSinceDate(myBirthday))
            print("Weeks before:", myBirthday.weeksBeforeDate(currentDate))
            print("Months since:", currentDate.monthsSinceDate(myBirthday))
            print("Months before:", myBirthday.monthsBeforeDate(currentDate))
            print("Years since:", currentDate.yearsSinceDate(myBirthday))
            print("Years before:", myBirthday.yearsBeforeDate(currentDate))
        }
        
        print("=================================================")
        
        DuckDate.firstDayOfTheWeek = .Monday
        var daysSinceStartOfTheWeek = NSDate().startOfWeek.daysBeforeDate(NSDate())
        print("Days since start of the week (Monday):", daysSinceStartOfTheWeek)
        
        print("=================================================")
        
        DuckDate.firstDayOfTheWeek = .Sunday
        daysSinceStartOfTheWeek = NSDate().startOfWeek.daysBeforeDate(NSDate())
        print("Days since start of the week (Sunday):", daysSinceStartOfTheWeek)
        
        print("=================================================")
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
}