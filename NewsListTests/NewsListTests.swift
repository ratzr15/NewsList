//
//  NewsListTests.swift
//  NewsListTests
//
//  Created by Rathish Kannan on 11/12/18.
//  Copyright © 2018 Rathish Kannan. All rights reserved.
//

import XCTest
@testable import NewsList

class NewsListTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    ///Load test for API
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            let manager = ListManager()
            let query =  Query(country: "us", page: "", id: "6fb52f2be2754dc7871284da64b8e129", count: "30")
            manager.request(query: query){  (results) in
                XCTAssert("ok" == String(results?.status ?? "ok"))
            }
            
        }
    }

    
  

}
