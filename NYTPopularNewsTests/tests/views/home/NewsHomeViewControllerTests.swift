//
//  NewsHomeViewControllerTests.swift
//  NYTPopularNews
//
//  Created by android on 8/9/17.
//  Copyright © 2017 com.mohamedrias.pocs.nytpopularnews. All rights reserved.
//

import XCTest
@testable import NYTPopularNews

class NewsHomeViewControllerTests: XCTestCase {
    
    var systemUnderTest: NewsHomeViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        systemUnderTest = NewsHomeViewController.getInstance()
        let _ = systemUnderTest.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        systemUnderTest = nil
    }
    
    func testSUT_ConformsToNewsHomeViewProtocol() {
        XCTAssertTrue(systemUnderTest is NewsHomeView)
    }
    
    func testSUT_ConformsToArticleTableViewDelegateProtocol() {
        XCTAssertTrue(systemUnderTest is ArticleTableViewDelegate)
    }
    
    func testSUT_TableViewIsNotNilAfterViewDidLoad() {
        XCTAssertNotNil(systemUnderTest.articlesTableView)
    }
    
    func testSUT_ShouldSetTableViewDataSource() {
        XCTAssertNotNil(systemUnderTest.articlesTableView.tableView.dataSource)
    }
    
    func testSUT_ShouldSetTableViewDelegate() {
        XCTAssertNotNil(systemUnderTest.articlesTableView.tableView.dataSource)
    }
    
    func testSUT_ConformsToTableViewDelegateProtocol() {
        
        XCTAssert(systemUnderTest.articlesTableView.conformsToProtocol(UITableViewDelegate))
        
        XCTAssert(systemUnderTest.articlesTableView.respondsToSelector(#selector(systemUnderTest.articlesTableView.tableView(_:didSelectRowAtIndexPath:))))
    }
    
}
