//
//  NewsHomeDelegateTests.swift
//  NYTPopularNews
//
//  Created by android on 8/9/17.
//  Copyright © 2017 com.mohamedrias.pocs.nytpopularnews. All rights reserved.
//

import XCTest
@testable import NYTPopularNews

class NewsHomeDelegateTests: XCTestCase {
    
    var systemUnderTest: NewsHomeDelegateImpl!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let baseView = NewsHomeViewController.getInstance()
        systemUnderTest = NewsHomeDelegateImpl(view: baseView)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSUT_ConformsToNewsHomeDelegateProtocol() {
        XCTAssert(systemUnderTest is NewsHomeDelegate)
    }
    
    func testSUT_ViewNotNilAfterIntialization() {
        XCTAssertNotNil(systemUnderTest.view)
    }
    
    func testSUT_ConformsToNewsHomeViewProtocol() {
        XCTAssert(systemUnderTest.view is NewsHomeView)
    }
    
}
