//
//  ListOrdersInteractorOutputSpy.swift
//  CleanStore
//
//  Created by Waratnan Suriyasorn on 4/8/2559 BE.
//  Copyright © 2559 M Warat. All rights reserved.
//

import UIKit

class ListOrdersInteractorOutputSpy: ListOrdersInteractorOutput
{
  // MARK: Method call expectations
  var presentFetchedOrdersCalled = false
  
  // MARK: Spied methods
  func presentFetchedOrders(response: ListOrders_FetchOrders_Response)
  {
    presentFetchedOrdersCalled = true
  }
}