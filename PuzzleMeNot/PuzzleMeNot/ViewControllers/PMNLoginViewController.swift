//
//  PMNLoginViewController.swift
//  PuzzleMeNot
//
//  Created by Claire Davis on 7/4/15.
//  Copyright (c) 2015 DavisGames. All rights reserved.
//

import UIKit

class PMNLoginViewController: PMNBaseViewController, UITextFieldDelegate {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.purpleColor()
    
    var nameTextField = UITextField()
    nameTextField.setTranslatesAutoresizingMaskIntoConstraints(false)
    nameTextField.backgroundColor = UIColor.whiteColor()
    nameTextField.textColor = UIColor.blackColor()
    nameTextField.placeholder = "Name"
    nameTextField.textAlignment = NSTextAlignment.Center
    nameTextField.returnKeyType = UIReturnKeyType.Done
    nameTextField.delegate = self;
    view.addSubview(nameTextField)
    view.centerViews([nameTextField])
    
    var button = UIButton()
    button.setTranslatesAutoresizingMaskIntoConstraints(false)
    button.setTitle("Login", forState: UIControlState.Normal)
    button.backgroundColor = UIColor.blackColor()
    button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    button.addTarget(self, action: Selector("login"), forControlEvents: UIControlEvents.TouchUpInside)
    view.addSubview(button)
    
    view.centerViewsHorizontally([button])
    view.addVisualConstraints(["V:[button(40)]-30-|", "H:[button(150)]", "V:[field(40)]", "H:[field(220)]"], options: NSLayoutFormatOptions(0), metrics: nil, views: ["button" : button, "field" : nameTextField])
  }
  
  // for now this just succeeds but eventually we will want it to
  // be able to actually hit something to log a user in and then store their session
  // or something of that sort
  func login() {
    PMNRootViewController.sharedInstance.transitionToBody()
  }
  
  // allows text field to dismiss keyboard when return key is pressed
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}
