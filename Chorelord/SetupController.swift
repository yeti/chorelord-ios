//
//  SetupViewController.swift
//  Chorelord
//
//  Created by Anya on 2/18/16.
//  Copyright © 2016 Yeti LLC. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController, UITextFieldDelegate {
  
  // MARK: Properties
  
  @IBOutlet weak var choreTextField: UITextField!
  @IBOutlet weak var choreLabel: UILabel!

  @IBOutlet weak var intervalTextField: UITextField!
  @IBOutlet weak var dateButton: UIButton!

  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    choreTextField.delegate = self
    let datePicker = UIDatePicker()
    dateToString(datePicker)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: UITextFieldDelegate
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    // Hide the keyboard
    textField.resignFirstResponder()
    return true
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    choreLabel.text = textField.text
  }
  // MARK: Actions
  @IBAction func addButton(sender: UIButton) {
    let storyboard = UIStoryboard(name: "ChoreList", bundle: nil)
    let controller = storyboard.instantiateViewControllerWithIdentifier("List") as! ChoreListViewController
    if let intervalValue = intervalTextField.text {
      controller.updateChoreList(Int(intervalValue)!, date: dateButton.titleLabel!.text!)
      presentViewController(controller, animated: true, completion: nil)
    }
  }

  
  @IBAction func setUpDate(sender: UITextField) {
    let picker = UIDatePicker()
    picker.datePickerMode = UIDatePickerMode.Date
    picker.addTarget(self, action: "dateToString:", forControlEvents: UIControlEvents.ValueChanged)
    let pickerSize: CGSize = picker.sizeThatFits(CGSizeZero)
    picker.frame = CGRectMake(0.0, 250, pickerSize.width, 450)
    self.view.addSubview(picker)
  
  }
  

  /**
  * Convert date objects into string
  **/
  func dateToString(date: UIDatePicker) {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
    dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
    let strDate = dateFormatter.stringFromDate(date.date)
    self.dateButton.setTitle(strDate, forState: UIControlState.Normal)
    date.hidden = true
  }

}

