//
//  ChoreListController.swift
//  Chorelord
//
//  Created by Anya on 2/18/16.
//  Copyright © 2016 Yeti LLC. All rights reserved.
//

import UIKit

class ChoreListController: UITableViewController {
  let chores = ["chore1", "chore2"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.registerNib(UINib(nibName: "ChoreTableViewCell", bundle: nil), forCellReuseIdentifier: "ChoreTableViewCell")
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return chores.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("ChoreTableViewCell", forIndexPath: indexPath) as! ChoreTableViewCell
    cell.choreName.text = chores[indexPath.row]
    return cell
  }
}
