//
//  ShowOrderConfigurator.swift
//  CleanStore
//
//  Created by Waratnan Suriyasorn on 4/11/2559 BE.
//  Copyright (c) 2559 M Warat. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension ShowOrderViewController: ShowOrderPresenterOutput
{
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
  {
    router.passDataToNextScene(segue)
  }
}

extension ShowOrderInteractor: ShowOrderViewControllerOutput
{
}

extension ShowOrderPresenter: ShowOrderInteractorOutput
{
}

class ShowOrderConfigurator
{
  // MARK: Object lifecycle
  
  class var sharedInstance: ShowOrderConfigurator
  {
    struct Static {
      static var instance: ShowOrderConfigurator?
      static var token: dispatch_once_t = 0
    }
    
    dispatch_once(&Static.token) {
      Static.instance = ShowOrderConfigurator()
    }
    
    return Static.instance!
  }
  
  // MARK: Configuration
  
  func configure(viewController: ShowOrderViewController)
  {
    let router = ShowOrderRouter()
    router.viewController = viewController
    
    let presenter = ShowOrderPresenter()
    presenter.output = viewController
    
    let interactor = ShowOrderInteractor()
    interactor.output = presenter
    
    viewController.output = interactor
    viewController.router = router
  }
}