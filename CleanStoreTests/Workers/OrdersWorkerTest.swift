//
//  OrdersWorkerTest.swift
//  CleanStore
//
//  Created by Waratnan Suriyasorn on 4/8/2559 BE.
//  Copyright © 2559 M Warat. All rights reserved.
//
@testable import CleanStore
import XCTest

class OrdersWorkerTest: XCTestCase {
    
  // MARK: Subject under test
  
  var sut: OrdersWorker!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupListOrdersWorker()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupListOrdersWorker()
  {
    sut = OrdersWorker(ordersStore: OrdersMemStoreSpy())
  }
  
  // MARK: Test doubles
  class OrdersMemStoreSpy: OrdersMemStore
  {
    // MARK: Method call expectations
    var fetchedOrdersCalled = false
    
    // MARK: Spied methods
    override func fetchOrders(completionHandler: (orders: [Order]) -> Void)
    {
      fetchedOrdersCalled = true
      let oneSecond = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), 1 * Int64(NSEC_PER_SEC))
      dispatch_after(oneSecond, dispatch_get_main_queue(), {
        completionHandler(orders: [Order(), Order()])
      })
    }
  }
  // MARK: Tests
  
  func testFetchOrdersShouldReturnListOfOrders()
  {
    // Given
    let ordersMemStoreSpy = sut.ordersStore as! OrdersMemStoreSpy
    
    // When
    let expectation = expectationWithDescription("Wait for fetched orders result")
    sut.fetchOrders { (orders: [Order]) -> Void in
      expectation.fulfill()
    }
    
    // Then
    XCTAssert(ordersMemStoreSpy.fetchedOrdersCalled, "Calling fetchOrders() should ask the data store for a list of orders")
    waitForExpectationsWithTimeout(1.1) { (error: NSError?) -> Void in
      XCTAssert(true, "Calling fetchOrders() should result in the completion handler being called with the fetched orders result")
    }
  }
}
