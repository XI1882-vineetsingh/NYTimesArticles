//
//  NYTimesTests.swift
//  NYTimesTests
//
//  Created by Vineet Singh on 13/11/20.
//

import XCTest
@testable import NYTimes

class NYTimesTests: XCTestCase {

    var sut: String!
    
    override func setUp() {
      super.setUp()
      sut = "wrong URL"
    }
    
    override func tearDown() {
      sut = nil
      super.tearDown()
    }
    
    func testImageCaching(){
        
        let image = sut.returnImageCache()
        
        XCTAssertEqual(image, nil)
        
    }

}
