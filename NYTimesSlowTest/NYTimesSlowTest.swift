//
//  NYTimesSlowTest.swift
//  NYTimesSlowTest
//
//  Created by Vineet Singh on 18/11/20.
//

import XCTest
@testable import NYTimes

class NYTimesSlowTest: XCTestCase {

    var sut: URLSession!
    
    override func setUp() {
      super.setUp()
      sut = URLSession(configuration: .default)
    }
    
    override func tearDown() {
      sut = nil
      super.tearDown()
    }
    
    // Asynchronous test: success fast, failure slow
    func testValidCallToNYTimesGetsHTTPStatusCode200() {
      // given
      let url = URL(string: EndPoint.popularArticles.url)
      // 1
      let promise = expectation(description: "Status code: 200")
      
      // when
      let dataTask = sut.dataTask(with: url!) { data, response, error in
        // then
        if let error = error {
          XCTFail("Error: \(error.localizedDescription)")
          return
        } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
          if statusCode == 200 {
            // 2
            promise.fulfill()
          } else {
            XCTFail("Status code: \(statusCode)")
          }
        }
      }
      dataTask.resume()
      // 3
      wait(for: [promise], timeout: 5)
    }
    
    // Asynchronous test: faster fail
    func testCallToNYTimesCompletes() {
      // given
      let url = URL(string: EndPoint.popularArticles.url)
      // 1
      let promise = expectation(description: "Completion handler invoked")
      var statusCode: Int?
      var responseError: Error?
      
      // when
      let dataTask = sut.dataTask(with: url!) { data, response, error in
        statusCode = (response as? HTTPURLResponse)?.statusCode
        responseError = error
        // 2
        promise.fulfill()
      }
      dataTask.resume()
      // 3
      wait(for: [promise], timeout: 5)
      
      // then
      XCTAssertNil(responseError)
      XCTAssertEqual(statusCode, 200)
    }
}
