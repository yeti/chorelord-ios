//
//  ChoreTableViewCell.swift
//  Chorelord
//
//  Created by Anya on 2/18/16.
//  Copyright © 2016 Yeti LLC. All rights reserved.
//

import UIKit

class ChoreTableViewCell: UITableViewCell {


  @IBOutlet weak var choreName: UILabel!
  @IBOutlet weak var username: UILabel!
  @IBOutlet weak var choreImage: UIImageView!
  
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }
  
}
