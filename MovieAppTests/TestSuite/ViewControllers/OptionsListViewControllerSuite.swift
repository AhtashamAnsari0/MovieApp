//
//  OptionsListViewControllerSuite.swift
//  MovieAppTests
//
//  Created by Ahtasham Ansari on 19/07/21.
//

import XCTest
@testable import MovieApp

class OptionsListViewControllerSuite: XCTestCase {
    var optionListViewController: OptionsListViewController!

    override func setUp() {
        
        self.optionListViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OptionsListViewController") as? OptionsListViewController
        _ = self.optionListViewController.view
    }
    
    // MARK: Nil Checks
    func testTableDataSourceViewDataSource(){
        XCTAssertNotNil(self.optionListViewController.tableView.dataSource)
    }

    func testTableDataSourceViewDelegate() {
        XCTAssertNotNil(self.optionListViewController.tableView.delegate)
    }

    // MARK: Number of items Checks
    func testViewNumberOfSections() {
        XCTAssertEqual(self.optionListViewController.tableView.numberOfSections, self.optionListViewController.viewModal?.separateOptionValueCount() ?? 0)
    }
    
}
