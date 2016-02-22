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
  
  init(choreNames: [String], employeeNames: [String]) {
    self.choreNames = choreNames
    self.employeeNames = employeeNames
  }
  
  /**
   * Format string date into NSDate
   **/
  func formatDate(date: String) -> NSDate {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd" // ex: 2015-02-01
    let formatted: NSDate = dateFormatter.dateFromString(date)!
    return formatted
  }
  
  /**
   * Calculate the day difference between 2 dates
   **/
  func calcDayDiff(start: String, end: String) -> Int {
    let calendar = NSCalendar.currentCalendar()
    let unit: NSCalendarUnit = NSCalendarUnit.Day
    let components = calendar.components(unit, fromDate: self.formatDate(start), toDate: self.formatDate(end), options: NSCalendarOptions(rawValue: 0))
    return components.day
  }
  
  /**
   * Reorder the list based on the cycle
   **/
  func reorderList(nameList: [String], start: String, end: String, interval: Int) -> [String] {
    var newList = nameList
    let dayDifference = calcDayDiff(start, end: end)
    let cycleNumber = dayDifference/interval // always floor
    if (cycleNumber > 0) {
      for _ in 1...cycleNumber {
        let first = newList.removeFirst()
        newList.append(first)
      }
    }
    print(newList)
    return newList
  }
  
}