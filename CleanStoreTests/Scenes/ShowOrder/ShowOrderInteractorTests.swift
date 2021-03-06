//
//  ShowOrderInteractorTests.swift
//  CleanStore
//
//  Created by Waratnan Suriyasorn on 4/11/2559 BE.
//  Copyright (c) 2559 M Warat. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

@testable import CleanStore
import XCTest

class ShowOrderInteractorTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: ShowOrderInteractor!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupShowOrderInteractor()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupShowOrderInteractor()
  {
    sut = ShowOrderInteractor()
  }
  
  // MARK: Test doubles
  class ShowOrderInteractorOutputSpy: ShowOrderInteractor {
    var getOrderCalled = false
    
    override func getOrder(request: ShowOrderRequest) {
      getOrderCalled = true
    }
  }
  
  // MARK: Tests
  
  func testGetOrderShouldCall()
  {
    // Given
    let showOrderInteractorOutputSpy = ShowOrderInteractorOutputSpy()
    
    // When
    let request = ShowOrderRequest()
    showOrderInteractorOutputSpy.getOrder(request)
    
    // Then
    XCTAssert(showOrderInteractorOutputSpy.getOrderCalled, "getOrder() should should call to get order")
    
    
    
  }
}
