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
    
    var navigationTitle: String {
        return "Movies Details"
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
    
    /**Custom Mathod used to get average IMDB rating */
    func IMDBAverageValue(with rating: String?)-> Float {
        let ratingValue = (Float(rating ?? "0.0") ?? 0.0) / 10
        return ratingValue
    }
    
    /** Custom Mathod used to get average rating value */
    func getRatingAverageValue(with rating:Ratings?)->Float {
        var ratingValue:Float = 0.0
        switch rating?.source {
        case "Internet Movie Database":
            ratingValue = internetMovieDatabaseAverageValue(with: rating?.value)
        case "Rotten Tomatoes":
            ratingValue = rottenTomatoesAverageValue(with: rating?.value)
        case "Metacritic":
            ratingValue = metacriticAverageValue(with: rating?.value)
        default:
            print("default")
        }
        return ratingValue
    }
    
    /** Custom Mathod used to get IMDB average rating value */
    func internetMovieDatabaseAverageValue(with rating: String?)-> Float {
        let splitString = rating?.components(separatedBy: "/")
        var ratingValue = "0.0"
        if splitString?.count ?? 0 > 0 {
            ratingValue = splitString?[0] ?? "0.0"
        }
        let rating = (Float(ratingValue) ?? 0.0) / 10
        return rating
    }
    
    /** Custom Mathod used to get RottenTomatoes average rating value */
    func rottenTomatoesAverageValue(with rating: String?)-> Float {
        let ratingValue = String(rating?.dropLast() ?? "00")
        let rating = (Float(ratingValue) ?? 00) / 100
        return rating
    }
    
    /** Custom Mathod used to get Metacritic average rating value */
     func metacriticAverageValue(with rating: String?)-> Float {
        let splitString = rating?.components(separatedBy: "/")
        var ratingValue = "00"
        
        if splitString?.count ?? 0 > 0 {
            ratingValue = splitString?[0] ?? "00"
        }
        let rating = (Float(ratingValue) ?? 00) / 100
        return rating
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
