//
//  UIView+Convenience.swift
//  PuzzleMeNot
//
//  Created by Claire Davis on 7/4/15.
//  Copyright (c) 2015 DavisGames. All rights reserved.
//

import UIKit

extension UIView {
  
  func addVisualConstraints(constraints: [String], options:  NSLayoutFormatOptions, metrics: [NSObject : AnyObject]?, views:  [NSObject : AnyObject]) {
    for constraint in constraints {
      self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(constraint, options: options, metrics: metrics, views: views))
    }
  }
  
  func createVisualConstraints(constraints: [String], options:  NSLayoutFormatOptions, metrics: [NSObject : AnyObject]?, views:  [NSObject : AnyObject]) -> [AnyObject] {
    var createdConstraints : [AnyObject] = []
    for constraint in constraints {
      createdConstraints += NSLayoutConstraint.constraintsWithVisualFormat(constraint, options: options, metrics: metrics, views: views)
    }
    
    return createdConstraints
  }
  
  func centerViews(views: [UIView]) {
    self.centerViewsHorizontally(views)
    self.centerViewsVertically(views)
  }
  
  func centerViewsVertically(views: [UIView]) {
    for view in views {
      self.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0))
    }
  }
  
  func centerViewsHorizontally(views: [UIView]) {
    for view in views {
      self.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0))
    }
  }
  
}
