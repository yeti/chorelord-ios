//
//  ChoreList.swift
//  Chorelord
//
//  Created by Anya on 2/22/16.
//  Copyright © 2016 Yeti LLC. All rights reserved.
//

import Foundation

class ChoreList {
  var listName: String?
  var choreNames: [String]
  var employeeNames: [String]
  var startDate: NSDate
  var interval: Int?
  
  init(choreNames: [String], employeeNames: [String]) {
    self.choreNames = choreNames
    self.employeeNames = employeeNames
    self.startDate = NSDate() // automatically sets as today's date
  }
  
  init(listName: String, choreNames: [String], employeeNames: [String], startDate: NSDate, interval: Int?) {
    self.listName = listName
    self.choreNames = choreNames
    self.employeeNames = employeeNames
    self.startDate = startDate
    self.interval = interval
  }
  
  /**
   * Calculate the day difference between 2 dates
   **/
  func calcDayDiff(start: NSDate) -> Int {
    let calendar = NSCalendar.currentCalendar()
    let todaysDate: NSDate = NSDate()
    let unit: NSCalendarUnit = NSCalendarUnit.Day
    let components = calendar.components(unit, fromDate: start, toDate: todaysDate, options: NSCalendarOptions(rawValue: 0))
    return components.day
  }
  
  /**
   * Reorder the list based on the cycle
   **/
  func reorderList() {
    var newList = employeeNames
    if let interval = self.interval {
      let dayDifference = calcDayDiff(startDate)
      let cycleNumber = dayDifference/interval // always floor
      if (cycleNumber > 0) {
        for _ in 1...cycleNumber {
          let first = newList.removeFirst()
          newList.append(first)
        }
        employeeNames = newList
      } else {
        print("The cycle hasn't started yet")
      }
      print(newList)
    }
  }
}