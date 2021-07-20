//
//  MovieListViewModelSuite.swift
//  MovieAppTests
//
//  Created by Ahtasham Ansari on 19/07/21.
//

import XCTest
@testable import MovieApp

class MovieListViewModelSuite: XCTestCase {

    var movieListViewModel : MovieListViewModel?
    
    override func setUp() {
        movieListViewModel = MovieListViewModel()
        movieListViewModel?.fetchMovieList()
    }

    func testViewDidLoad() {
        //Given
        let totalCount = 4
        //When
        let count = movieListViewModel?.getMovieOptionListCount()
        //Then
        XCTAssertEqual(count, totalCount, "Error in response data")
    }
    
    /** test movie list count */
    func testMovieListCount() {
        //Given
        let totalCount = 19
        //When
        let count = movieListViewModel?.getMovieListCount()
        //Then
        XCTAssertEqual(count, totalCount, "Error in response data")
    }
    
    func testNavigationTitle() {
        //Given
        let navigationTitle = "Movies"
        //When
        let returnedNavigationTitle = movieListViewModel?.navigationTitle
        //Then
        XCTAssertEqual(navigationTitle, returnedNavigationTitle)
    }
    
}
