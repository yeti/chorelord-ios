//
//  ChoreList.swift
//  Chorelord
//
//  Created by Anya on 2/22/16.
//  Copyright © 2016 Yeti LLC. All rights reserved.
//

import Foundation

class ChoreList {
  var choreNames: [String]
  var employeeNames: [String]
  var startDate: String?
  var interval: Int?
  
  init(choreNames: [String], employeeNames: [String]) {
    self.choreNames = choreNames
    self.employeeNames = employeeNames
  }
  
  init(choreNames: [String], employeeNames: [String], startDate: String, interval: Int?) {
    self.choreNames = choreNames
    self.employeeNames = employeeNames
    self.startDate = startDate
    self.interval = interval
  }
  
  /**
   * Format string date into NSDate
   **/
  func formatDate(date: String) -> NSDate {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "MMMM dd, yyyy" // ex: February 25, 2016
    let formatted: NSDate = dateFormatter.dateFromString(date)!
    return formatted
  }
  
  /**
   * Calculate the day difference between 2 dates
   **/
  func calcDayDiff(start: String) -> Int {
    let calendar = NSCalendar.currentCalendar()
    let todaysDate: NSDate = NSDate()
    let unit: NSCalendarUnit = NSCalendarUnit.Day
    let components = calendar.components(unit, fromDate: self.formatDate(start), toDate: todaysDate, options: NSCalendarOptions(rawValue: 0))
    return components.day
  }
  
  /**
   * Reorder the list based on the cycle
   **/
  func reorderList() {
    var newList = employeeNames
    if let interval = self.interval {
      let dayDifference = calcDayDiff(startDate!)
      let cycleNumber = dayDifference/interval // always floor
      if (cycleNumber > 0) {
        for _ in 1...cycleNumber {
          let first = newList.removeFirst()
          newList.append(first)
        }
        employeeNames = newList
      } else {
        print("interval is nil")
      }
      print(newList)
    }
  }
}