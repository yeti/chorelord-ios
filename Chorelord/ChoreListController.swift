//
//  ChoreListController.swift
//  Chorelord
//
//  Created by Anya on 2/18/16.
//  Copyright © 2016 Yeti LLC. All rights reserved.
//

import UIKit

let choresName = ["Water Roof Plants", "Clean Sink, Coffee area & Countertops", "Change bathroom & kitchen towels / Stock TP", "Chorelord", "Take out kitchen & office trash", "Garage Cleanliness / Break down boxes", "Water Roof Plants", "Conference, Bathroom & Roof trash", "Front of office: sweep, pick up trash, water plants", "Empty Dishwasher", "Clean out Fridge, Clear kitchen clutter (put away snacks, etc)", "Office Clutter, Clean Conference Room", "Sweep the office / kitchen", "Take out compost"]

let names = ["Baylee", "Alex", "Anya", "Ellie", "Lee", "Dean", "Tony", "Rudy", "Tim", "Evan", "America", "Geoff", "Mike", "Jon"]

class ChoreListController: UITableViewController {
  let choreCells:[ChoreTableViewCell] = []
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.reorderList(names, start: "2016-02-01", end: "2016-02-15", interval: 7)
    tableView.registerNib(UINib(nibName: "ChoreTableViewCell", bundle: nil), forCellReuseIdentifier: "ChoreTableViewCell")
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return choresName.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("ChoreTableViewCell", forIndexPath: indexPath) as! ChoreTableViewCell
    cell.choreName.text = choresName[indexPath.row]
    cell.username.text = names[indexPath.row]
    return cell
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
    let unit:NSCalendarUnit = NSCalendarUnit.Day
    let components = calendar.components(unit, fromDate: self.formatDate(start), toDate: self.formatDate(end), options: NSCalendarOptions(rawValue: 0))
    print(components.day)
    return components.day
  }
  
  /**
  * Reorder the list based on the cycle
  **/
  func reorderList(nameList: [String], start: String, end: String, interval: Int) -> [String]{
    var newList = nameList
    let dayDifference = self.calcDayDiff(start, end: end)
    let cycleNumber = dayDifference/interval // always floor
    if (cycleNumber > 0) {
      for _ in 1...cycleNumber {
        let first = newList.removeFirst()
        newList.append(first)
        print(newList)
      }
    }
    return newList
  }
}
