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
  func displayFetchedOrders(viewModel: ListOrders_FetchOrders_ViewModel)
}

protocol ListOrdersViewControllerOutput
{
  func fetchOrders(request: ListOrders_FetchOrders_Request)
  var orders: [Order]? { get }
}

class ListOrdersViewController: UITableViewController, ListOrdersViewControllerInput
{
  var output: ListOrdersViewControllerOutput!
  var router: ListOrdersRouter!
  var displayedOrders: [ListOrders_FetchOrders_ViewModel.DisplayedOrder] = []
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
  func displayFetchedOrders(viewModel: ListOrders_FetchOrders_ViewModel) {
    displayedOrders = viewModel.displayedOrders
    tableView.reloadData()
  }
  
  // MARK: Tableview delegate
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int
  {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return displayedOrders.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
  {
    let displayedOrder = displayedOrders[indexPath.row]
    var cell = tableView.dequeueReusableCellWithIdentifier("OrderTableViewCell")
    if cell == nil {
      cell = UITableViewCell(style: .Value1, reuseIdentifier: "OrderTableViewCell")
    }
    cell?.textLabel?.text = displayedOrder.date
    cell?.detailTextLabel?.text = displayedOrder.total
    return cell!
  }
}
