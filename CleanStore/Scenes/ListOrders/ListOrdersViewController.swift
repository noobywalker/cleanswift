//
//  ListOrdersViewController.swift
//  CleanStore
//
//  Created by Waratnan Suriyasorn on 4/8/2559 BE.
//  Copyright (c) 2559 M Warat. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol ListOrdersViewControllerInput
{
  func displaySomething(viewModel: ListOrdersViewModel)
}

protocol ListOrdersViewControllerOutput
{
  func fetchOrders(request: ListOrders_FetchOrders_Request)
}

class ListOrdersViewController: UITableViewController, ListOrdersViewControllerInput
{
  var output: ListOrdersViewControllerOutput!
  var router: ListOrdersRouter!
  
  // MARK: Object lifecycle
  
  override func awakeFromNib()
  {
    super.awakeFromNib()
    ListOrdersConfigurator.sharedInstance.configure(self)
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    fetchOrdersOnload()
  }
  
  // MARK: Event handling
  
  func fetchOrdersOnload()
  {
    // NOTE: Ask the Interactor to do some work
    
    let request = ListOrders_FetchOrders_Request()
    output.fetchOrders(request)
  }
  
  // MARK: Display logic
  
  func displaySomething(viewModel: ListOrdersViewModel)
  {
    // NOTE: Display the result from the Presenter
    
    // nameTextField.text = viewModel.name
  }
  
  func displayFetchedOrders(viewModel: ListOrders_FetchOrders_ViewModel) {
    
  }
}
