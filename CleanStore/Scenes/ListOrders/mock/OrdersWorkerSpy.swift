//
//  OrdersWorkerSpy.swift
//  CleanStore
//
//  Created by Waratnan Suriyasorn on 4/8/2559 BE.
//  Copyright © 2559 M Warat. All rights reserved.
//

import UIKit

class OrdersWorkerSpy: OrdersWorker
{
  // MARK: Method call expectations
  var fetchOrdersCalled = false
  
  // MARK: Spied methods
  override func fetchOrders(completionHandler: (orders: [Order]) -> Void)
  {
    fetchOrdersCalled = true
    completionHandler(orders: [])
  }
}