//
//  ShowOrderModels.swift
//  CleanStore
//
//  Created by Waratnan Suriyasorn on 4/11/2559 BE.
//  Copyright (c) 2559 M Warat. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

struct ShowOrderRequest
{
}

struct ShowOrderResponse
{
  var order: Order
}

struct ShowOrderViewModel
{
  struct DisplayedOrder
  {
    var id: String
    var date: String
    var email: String
    var name: String
    var total: String
  }
  var displayedOrder: DisplayedOrder
}
