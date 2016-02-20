//
//  SetupController.swift
//  Chorelord
//
//  Created by Anya on 2/18/16.
//  Copyright © 2016 Yeti LLC. All rights reserved.
//

import UIKit

class SetupController: UIViewController, UITextFieldDelegate {
  
  // MARK: Properties
  
  @IBOutlet weak var choreTextField: UITextField!
  @IBOutlet weak var choreLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    choreTextField.delegate = self
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
    let controller = storyboard.instantiateViewControllerWithIdentifier("List") as UIViewController
    presentViewController(controller, animated: true, completion: nil)
  }
  


}

