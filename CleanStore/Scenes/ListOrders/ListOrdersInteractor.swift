//
//  ListOrdersInteractor.swift
//  CleanStore
//
//  Created by Waratnan Suriyasorn on 4/8/2559 BE.
//  Copyright (c) 2559 M Warat. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol ListOrdersInteractorInput
{
  func fetchOrders(request: ListOrders_FetchOrders_Request)
}

protocol ListOrdersInteractorOutput
{
  func presentFetchedOrders(response: ListOrders_FetchOrders_Response)
}

class ListOrdersInteractor: ListOrdersInteractorInput
{
  var output: ListOrdersInteractorOutput!
  var worker = OrdersWorker()
  
  func fetchOrders(request: ListOrders_FetchOrders_Request) {
    worker.fetchOrders { (orders) in
      let response = ListOrders_FetchOrders_Response(orders: orders)
      self.output.presentFetchedOrders(response)
    }
  }
}