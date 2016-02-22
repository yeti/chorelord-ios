//
//  ChoreListViewController.swift
//  Chorelord
//
//  Created by Anya on 2/18/16.
//  Copyright © 2016 Yeti LLC. All rights reserved.
//

import UIKit

let choreNames = ["Water Roof Plants", "Clean Sink, Coffee area & Countertops", "Change bathroom & kitchen towels / Stock TP", "Chorelord", "Take out kitchen & office trash", "Garage Cleanliness / Break down boxes", "Water Roof Plants", "Conference, Bathroom & Roof trash", "Front of office: sweep, pick up trash, water plants", "Empty Dishwasher", "Clean out Fridge, Clear kitchen clutter (put away snacks, etc)", "Office Clutter, Clean Conference Room", "Sweep the office / kitchen", "Take out compost"]

let employeeNames = ["Baylee", "Alex", "Anya", "Ellie", "Lee", "Dean", "Tony", "Rudy", "Tim", "Evan", "America", "Geoff", "Mike", "Jon"]

class ChoreListViewController: UITableViewController {
  
  var choreList = ChoreList(choreNames: choreNames, employeeNames: employeeNames)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    choreList.reorderList(employeeNames, start: "2016-02-01", end: "2016-02-15", interval: 7) // this is doing nothing right now, just for testing purposes
    tableView.registerNib(UINib(nibName: "ChoreTableViewCell", bundle: nil), forCellReuseIdentifier: "ChoreTableViewCell")
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return choreNames.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("ChoreTableViewCell", forIndexPath: indexPath) as! ChoreTableViewCell
    cell.choreName.text = choreNames[indexPath.row]
    cell.username.text = employeeNames[indexPath.row]
    return cell
  }
  
  }
