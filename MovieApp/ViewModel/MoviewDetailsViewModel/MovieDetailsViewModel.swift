//
//  MovieDetailsViewModel.swift
//  MovieApp
//
//  Created by Ahtasham Ansari on 17/07/21.
//

import Foundation

/**ViewModel  for movie details  module that communicates to movie list    */
struct MovieDetailsViewModel {
    
    /**Closure  variable  Used to to notify to MovieListViewController to reload view*/
    var reloadDetailsViewClosure: (() -> Void)?
    /**MovieDetailModel type array  used to store  movie details */
    var movieDetailsData:[MovieDetailModel]?
    
    /**mutating  Mathod set movie details to model  */
    mutating func movieDetails(with movie: MovieList?) {
        
        movieDetailsData = [MovieDetailModel(title: "Title", value: movie?.title ?? ""), MovieDetailModel(title: "Plot", value: movie?.plot ?? ""),MovieDetailModel(title: "Cast & crew,", value: "Director: \(movie?.director ?? "")\nActor: \(movie?.actors ?? "") \nWriter: \(movie?.writer ?? "")"), MovieDetailModel(title: "Released Date", value: movie?.released ?? ""), MovieDetailModel(title: "Genre", value: movie?.genre ?? "")]
        
        reloadDetailsViewClosure?()
    }
    
    /**Custom Mathod used to get movie details count */
    func movieDetailsCount()-> Int {
        movieDetailsData?.count ?? 0
    }
    /**Custom Mathod used to get movie details */
    func getMovieDetails(with index: Int) -> MovieDetailModel? {
        movieDetailsData?[index]
    }
    
    /**Custom Mathod used to get total movie rating  count*/
    func getRatingCount(from movie:MovieList?)-> Int {
        movie?.ratings?.count ?? 0
    }
    
    /**Custom Mathod used to get movie rating */
    func getRatingValue(from movie: MovieList?, at index: Int)-> Ratings? {
        movie?.ratings?[index]
    }
}
/**Model  used  for movie details  */
struct MovieDetailModel {
    var title: String
    var value:String
    init(title: String, value: String) {
        self.title = title
        self.value = value
    }
}
