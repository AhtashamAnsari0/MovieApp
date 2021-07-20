//
//  MovieDetailsViewModelSuite.swift
//  MovieAppTests
//
//  Created by Ahtasham Ansari on 19/07/21.
//

import XCTest
@testable import MovieApp


class MovieDetailsViewModelSuite: XCTestCase {
    
    var movieListViewModel: MovieListViewModel?
    var movieDetailsViewModel: MovieDetailsViewModel?
    var movieList: [MovieList]?


    override func setUp() {
        movieListViewModel = MovieListViewModel()
        movieDetailsViewModel = MovieDetailsViewModel()
        movieList = movieListViewModel?.getMovieList()
        movieDetailsViewModel?.movieDetails(with: movieList?[0])
    }

    func testViewDidLoad() {
        //Given
        let totalCount = 5
        //When
        let count = movieDetailsViewModel?.movieDetailsCount()
        //Then
        XCTAssertEqual(count, totalCount, "Error in response data")
    }
    
    func testRatingCount() {
        //Given
        let totalCount = 3
        //When
        let count = movieDetailsViewModel?.getRatingCount(from: movieList?[0])
        //Then
        XCTAssertEqual(count, totalCount, "Error in response data")
    }
    
    func testNavigationTitle() {
        //Given
        let navigationTitle = "Movies Details"
        //When
        let returnedNavigationTitle = movieDetailsViewModel?.navigationTitle
        //Then
        XCTAssertEqual(navigationTitle, returnedNavigationTitle)
    }
    
    // Test rating average value
    
    func testIMDBRatingValue() {
        //Given
        let ratingValue: Float = 0.7
        //When
        let count = movieDetailsViewModel?.IMDBAverageValue(with: "7.0")
        //Then
        XCTAssertEqual(count, ratingValue, "Error in response data")
    }
    
    func testRottenTomatoesAverageRatingValue() {
        //Given
        let ratingValue: Float = 0.84
        //When
        let count = movieDetailsViewModel?.rottenTomatoesAverageValue(with: "84%")
        //Then
        XCTAssertEqual(count, ratingValue, "Error in response data")
    }
    
    func testMetacriticAverageRatingValue() {
        //Given
        let ratingValue: Float = 0.73
        //When
        let count = movieDetailsViewModel?.metacriticAverageValue(with: "73/100")
        //Then
        XCTAssertEqual(count, ratingValue, "Error in response data")
    }
}
