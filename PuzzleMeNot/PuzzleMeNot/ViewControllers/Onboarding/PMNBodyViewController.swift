//
//  PMNBodyViewController.swift
//  PuzzleMeNot
//
//  Created by Claire Davis on 7/4/15.
//  Copyright (c) 2015 DavisGames. All rights reserved.
//

import UIKit

class PMNBodyViewController: UITabBarController {
  
  static let sharedInstance = PMNRootViewController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // create tab bar initial vcs to occupy it
    // currently just throwing in items and such as placeholders but
    // in the final version this will all be custom images, etc.
    
    var accountVC = PMNAccountViewController()
    accountVC.tabBarItem = UITabBarItem(title: "Account", image: UIImage?(), tag: 1)
    
    var achievementsVC = PMNAchievementsViewController()
    achievementsVC.tabBarItem = UITabBarItem(title: "Achieve", image: UIImage?(), tag: 2)
    
    var gamesVC = PMNGameViewController()
    gamesVC.tabBarItem = UITabBarItem(title: "Games", image: UIImage?(), tag: 3)
    
    var settingsVC = PMNSettingsViewController()
    settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage?(), tag: 4)
    
    self.viewControllers = [accountVC, achievementsVC, gamesVC, settingsVC]
    self.selectedIndex = 0
  }
}
