//
//  SetupViewController.swift
//  Chorelord
//
//  Created by Anya on 2/18/16.
//  Copyright © 2016 Yeti LLC. All rights reserved.
//

import UIKit

enum TextFieldTags: Int {
  case GroupNameTag = 0, IntervalTag
}

class SetupViewController: UIViewController, UITextFieldDelegate {
  var tempGroupName: String?
  var tempStartDate: NSDate?
  var tempInterval: Int?
  
  // MARK: Properties
  
  @IBOutlet weak var groupNameTextField: UITextField!
  @IBOutlet weak var intervalTextField: UITextField!
  @IBOutlet weak var dateButton: UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let tap = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
    self.view.addGestureRecognizer(tap)
    
    // Do any additional setup after loading the view, typically from a nib.
    groupNameTextField.delegate = self
    intervalTextField.delegate = self
    let datePicker = UIDatePicker()
    updateDate(datePicker)
  }
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    dismissKeyboard()
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
    if let textValue = textField.text {
      switch (textField.tag) {
        case TextFieldTags.GroupNameTag.rawValue:
          tempGroupName = textValue
          break
        case TextFieldTags.IntervalTag.rawValue:
          tempInterval = Int(textValue)
          break
        default:
          break
      }
    }
    textField.resignFirstResponder()
  }
  
  func dismissKeyboard() {
    view.endEditing(true)
  }
  
  // MARK: Actions
  @IBAction func addButton(sender: UIButton) {
    let storyboard = UIStoryboard(name: "ChoreList", bundle: nil)
    let controller = storyboard.instantiateViewControllerWithIdentifier("List") as! ChoreListViewController
    controller.updateChoreList(self.tempInterval!, date: self.tempStartDate!)
    presentViewController(controller, animated: true, completion: nil)

  }

  
  @IBAction func setUpDate(sender: UITextField) {
    dismissKeyboard()
    let picker = UIDatePicker()
    picker.datePickerMode = UIDatePickerMode.Date
    picker.setDate(tempStartDate!, animated: false)
    picker.addTarget(self, action: "updateDate:", forControlEvents: UIControlEvents.ValueChanged)
    let pickerSize: CGSize = picker.sizeThatFits(CGSizeZero)
    picker.frame = CGRectMake(0.0, 250, pickerSize.width, 450)
    self.view.addSubview(picker)
  }
  

  /**
  * Convert date objects into string and updates the button and temporary start date field
  **/
  func updateDate(date: UIDatePicker) {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
    dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
    tempStartDate = date.date
    dateButton.setTitle(dateFormatter.stringFromDate(date.date), forState: UIControlState.Normal)
    date.hidden = true
  }
  
  /**
   * Format string date into NSDate
   **/
  func stringToDate(date: String) -> NSDate {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "MMMM dd, yyyy" // ex: February 25, 2016
    let formatted: NSDate = dateFormatter.dateFromString(date)!
    return formatted
  }

}

