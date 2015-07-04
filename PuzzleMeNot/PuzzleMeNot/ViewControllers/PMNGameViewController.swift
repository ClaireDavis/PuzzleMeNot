//
//  PMNGameViewController.swift
//  PuzzleMeNot
//
//  Created by Claire Davis on 7/4/15.
//  Copyright (c) 2015 DavisGames. All rights reserved.
//

import UIKit

class PMNGameViewController: PMNBaseViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.blueColor()
    
    var centerLabel = UILabel()
    centerLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
    centerLabel.text = "Games Placeholder"
    view.addSubview(centerLabel)
    view.centerViews([centerLabel])
  }
  
}
