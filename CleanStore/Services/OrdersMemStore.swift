//
//  OrdersMemStore.swift
//  CleanStore
//
//  Created by Waratnan Suriyasorn on 4/8/2559 BE.
//  Copyright © 2559 M Warat. All rights reserved.
//

import UIKit

class OrdersMemStore: OrdersStoreProtocol
{
  // MARK: Data
  let orders = [Order(id: "abc123", date: NSDate(), email: "amy.apple@clean-swift.com", firstName: "Amy", lastName: "Apple", total: NSDecimalNumber(string: "1.23"))]
  
  func fetchOrders(completionHandler: (orders: [Order]) -> Void)
  {
    completionHandler(orders: orders)
  }
}
