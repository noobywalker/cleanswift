//
//  ListOrdersViewControllerOutputSpy.swift
//  CleanStore
//
//  Created by Waratnan Suriyasorn on 4/8/2559 BE.
//  Copyright © 2559 M Warat. All rights reserved.
//

import UIKit

class ListOrdersViewControllerOutputSpy: ListOrdersViewControllerOutput
{
  // MARK: Method call expectations
  var fetchOrdersCalled = false
  
  // MARK: Spied methods
  func fetchOrders(request: ListOrders_FetchOrders_Request) {
    fetchOrdersCalled = true
  }
}

