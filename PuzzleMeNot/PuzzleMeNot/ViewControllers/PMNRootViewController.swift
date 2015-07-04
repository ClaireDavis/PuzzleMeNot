//
//  PMNRootViewController.swift
//  PuzzleMeNot
//
//  Created by Claire Davis on 7/4/15.
//  Copyright (c) 2015 DavisGames. All rights reserved.
//

import UIKit

// three available states for the app:
// logged out, we are displaying the logged out view
// logged in, we are showing the primary view of the app
// onboarding, we are showing the onboarding slides
private enum PMNAppState {
  case LoggedOut
  case LoggedIn
  case Onboarding
}

class PMNRootViewController: UIViewController {
  
  // shared instance is how we will refer to singletons throughout the app
  // a singleton is a single instance that is available to all of the application
  // https://en.wikipedia.org/wiki/Singleton_pattern
  static let sharedInstance = PMNRootViewController()
  private var appState = PMNAppState.Onboarding
  private var appStateVC : UIViewController?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initializeAppState()
  }
  
  // transitions from current app location to logged out state
  func transitionToLogin() {
    updateWithAppState(PMNAppState.LoggedOut)
  }
  
  // transitions from current app location to logged in
  func transitionToBody() {
    updateWithAppState(PMNAppState.LoggedIn)
  }
  
  // for now we start with the app state always being onboarding
  // eventually we will need the app state to have onboarding only
  // if the user has never hit the app before, otherwise they are 
  // directed straight to login. if the user is already logged in
  // then they should go straight to the logged in state after
  // reauthenticating via a token or something
  private func initializeAppState() {
    appState = PMNAppState.Onboarding
    addNew(PMNOnboardingViewController())
  }
  
  // updates the app state and calls the appropriate transitions
  private func updateWithAppState(state: PMNAppState) {
    let oldState = appState
    // if the old state is not equal to the new state, then we need to handle transition
    if (oldState != state) {
      var newVC : UIViewController
      switch state {
      case .LoggedOut:
        newVC = PMNLoginViewController()
        break
      case .LoggedIn:
        newVC = PMNBodyViewController()
        break
      case .Onboarding:
        newVC = PMNOnboardingViewController()
        break
      }
      
      let oldVC = appStateVC
      oldVC?.view.contentScaleFactor = UIScreen.mainScreen().scale
      oldVC?.view.layer.shouldRasterize = true
      
      addNew(newVC)
      
      UIView.animateWithDuration(0.5, animations: { () -> Void in
        oldVC?.view.alpha = 0.0
      }, completion: { (_) -> Void in
        self.removeOld(oldVC!)
      })
    }
  }
  
  // sets the new vc as the current state vc
  private func addNew(vc : UIViewController) {
    appStateVC = vc
    self.addChildViewController(vc)
    vc.view.frame = view.bounds
    view.insertSubview(vc.view, atIndex: 0)
    vc.didMoveToParentViewController(self)
  }
  
  // removes the curent vc as the curent state vc
  private func removeOld(vc : UIViewController) {
    vc.willMoveToParentViewController(nil)
    vc.view.removeFromSuperview()
    vc.removeFromParentViewController()
  }
}
