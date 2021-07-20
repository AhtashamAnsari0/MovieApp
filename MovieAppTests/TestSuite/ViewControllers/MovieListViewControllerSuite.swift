//
//  MovieListViewControllerSuite.swift
//  MovieAppTests
//
//  Created by Ahtasham Ansari on 19/07/21.
//

import XCTest
@testable import MovieApp

class MovieListViewControllerSuite: XCTestCase {
    var movieViewController: MovieListViewController!

    override func setUp() {
        self.movieViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieListViewController") as? MovieListViewController
        _ = self.movieViewController.view
    }
    
    // MARK: Nil Checks
    func testTableDataSourceViewDataSource(){
        XCTAssertNotNil(self.movieViewController.tableView.dataSource)
    }

    func testTableDataSourceViewDelegate() {
        XCTAssertNotNil(self.movieViewController.tableView.delegate)
    }
    
    func testSearchBarDataSourceViewDelegate() {
        XCTAssertNotNil(self.movieViewController.searchBar.delegate)
    }

    // MARK: Number of items Checks
    func testViewNumberOfSections() {
        XCTAssertEqual(self.movieViewController.tableView.numberOfSections, 1)
    }
    
    func testViewNumberOfItems() {
        XCTAssertEqual(self.movieViewController.tableView.numberOfRows(inSection: 0), 4)
    }
    
    //Navigation Title
    func testCellNavigationTitle() {
        XCTAssertEqual(self.movieViewController.viewModel.navigationTitle, "Movies")
    }

}
