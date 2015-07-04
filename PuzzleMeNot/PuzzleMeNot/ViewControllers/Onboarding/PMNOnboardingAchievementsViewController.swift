//
//  PMNOnboardingAchievementsViewController.swift
//  PuzzleMeNot
//
//  Created by Claire Davis on 7/4/15.
//  Copyright (c) 2015 DavisGames. All rights reserved.
//

import UIKit

class PMNOnboardingAchievementsViewController: PMNBaseViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.redColor()
    
    var centerLabel = UILabel()
    centerLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
    centerLabel.text = "Achievements Explanation"
    view.addSubview(centerLabel)
    view.centerViews([centerLabel])
    
    var button = UIButton()
    button.setTranslatesAutoresizingMaskIntoConstraints(false)
    button.setTitle("Let's Go!", forState: UIControlState.Normal)
    button.backgroundColor = UIColor.blackColor()
    button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    button.addTarget(self, action: Selector("dismissSelf"), forControlEvents: UIControlEvents.TouchUpInside)
    view.addSubview(button)
    
    view.centerViewsHorizontally([button])
    view.addVisualConstraints(["V:[button(40)]-30-|", "H:[button(150)]"], options: NSLayoutFormatOptions(0), metrics: nil, views: ["button" : button])
  }
  
  func dismissSelf() {
    PMNRootViewController.sharedInstance.transitionToLogin()
  }
  
}
