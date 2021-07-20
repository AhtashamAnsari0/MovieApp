//
//  MovieDetailsViewControllerSuite.swift
//  MovieAppTests
//
//  Created by Ahtasham Ansari on 19/07/21.
//

import XCTest
@testable import MovieApp

class MovieDetailsViewControllerSuite: XCTestCase {
    var movieDetailsViewController: MovieDetailsViewController!

    override func setUp() {
        self.movieDetailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController
        _ = self.movieDetailsViewController.view
    }
    
    // MARK: Nil Checks
    func testTableDataSourceViewDataSource(){
        XCTAssertNotNil(self.movieDetailsViewController.tableView.dataSource)
    }

    func testTableDataSourceViewDelegate() {
        XCTAssertNil(self.movieDetailsViewController.tableView.delegate)
    }
    
    func testPickerDataSourceViewDataSource(){
        XCTAssertNotNil(self.movieDetailsViewController.pickerView.dataSource)
    }

    func testPickerDataSourceViewDelegate() {
        XCTAssertNotNil(self.movieDetailsViewController.pickerView.delegate)
    }
    
    // MARK: Number of items Checks
    func testViewNumberOfSections() {
        XCTAssertEqual(self.movieDetailsViewController.tableView.numberOfSections, 1)
    }
    
    func testViewNumberOfComponents() {
        XCTAssertEqual(self.movieDetailsViewController.pickerView.numberOfComponents, 1)
    }
    
    //Navigation Title
    func testCellNavigationTitle() {
        XCTAssertEqual(self.movieDetailsViewController.viewModel.navigationTitle, "Movies Details")
    }
}
