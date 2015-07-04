//
//  PMNOnboardingViewController.swift
//  PuzzleMeNot
//
//  Created by Claire Davis on 7/4/15.
//  Copyright (c) 2015 DavisGames. All rights reserved.
//
//  This is the parent view controller for managing pager screens
//  pager screens allow you to smoothly navigate left and right
//  between a series of view controllers
//  this is ideal for the onboarding screens as indicated

import UIKit

class PMNOnboardingViewController: PMNBaseViewController, UIPageViewControllerDataSource {
  
  var index : Int = 0
  var pageController : UIPageViewController!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    pageController = UIPageViewController(transitionStyle: UIPageViewControllerTransitionStyle.Scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options: nil)
    pageController.dataSource = self;
    pageController.view.frame = view.bounds
    
    var initialVC = PMNOnboardingGamesViewController()
    pageController.setViewControllers([initialVC], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
    
    self.addChildViewController(pageController)
    view.addSubview(pageController.view)
    pageController.didMoveToParentViewController(self)
  }
  
// MARK: UIPageViewControllerDataSource Methods
// you can learn more about these by hitting option + click on the 
// UIPageViewControllerDataSource declaration at the top of this file
  
  func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
    
    var nextIndex = indexForViewController(viewController) + 1
    return (nextIndex == 4) ? nil : viewControllerForIndex(nextIndex)
  }
  
  func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
    
    var previousIndex = indexForViewController(viewController) - 1
    return (previousIndex == -1) ? nil : viewControllerForIndex(previousIndex)
  }
  
  func indexForViewController(viewController: UIViewController) -> Int {
    if (viewController.isKindOfClass(PMNOnboardingGamesViewController)) {
      return 0
    } else if (viewController.isKindOfClass(PMNOnboardingSettingViewController)) {
      return 1
    } else if (viewController.isKindOfClass(PMNOnboardingAccountViewController)) {
      return 2
    } else if (viewController.isKindOfClass(PMNOnboardingAchievementsViewController)) {
      return 3
    }
    
    // this is a fail case, will cause application crash
    // if the developer wishes to handle this more gracefully then do so
    return -1
  }
  
  func viewControllerForIndex(index: Int) -> UIViewController {
    switch index {
    case 0:
      return PMNOnboardingGamesViewController()
    case 1:
      return PMNOnboardingSettingViewController()
    case 2:
      return PMNOnboardingAccountViewController()
    default:
      return PMNOnboardingAchievementsViewController()
    }
  }
  
  func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
    // total count for the paging dots
    return 4;
  }
  
  func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
    // starting index for the pager dots
    return 0;
  }
  
}
