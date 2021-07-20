//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by Ahtasham Ansari on 16/07/21.
//

import Foundation

/**ViewModel  for movie list  module that communicates to json parser layer */
class MovieListViewModel {
    
    /**Closure  variable  Used to to notify to  MovieListViewController to reload view*/
    var reloadTableViewClosure: (() -> Void)?
    /**Closure  variable  Used to to notify to OptionsListViewController to reload view*/
    var reloadOptionsTableViewClosure: (() -> Void)?
    /**MovieList type array  used to store search movie list */
    var movieList: [MovieList]?
    /**MovieList type array  used to store  movie list */
    var movieListWithOption: [MovieList]?
    /**MovieList type array  used to store search movie list */
    var searchMovieList: [MovieList]?
    /**String type array  used to store  movie  option */
    var movieOptionsList = ["Year", "Genre", "Directors", "Actors"]
    /**String type array   used to store  movie related option */
    var separateOptionValue: [String]?
    
    var navigationTitle: String {
        return "Movies"
    }
    
    /**Custom  Mathod used to fetch  movie list  from json */
    func fetchMovieList() {
        if let list =  JsonParser.sharedInstance.getMovieList() {
            movieList = list
        }
    }
    
    /**Custom  Mathod used to get  movie list count*/
    func getMovieListCount()->Int? {
        movieList?.count ?? 0
    }
    
    /**Custom  Mathod used to get  movie List */
    func getMovieList()->[MovieList]? {
        if let list =  JsonParser.sharedInstance.getMovieList() {
           return  list
        }
        return []
    }
    
    /**Custom  Mathod used to get  movie option */
    func getMovieOptionList() -> [String] {
        movieOptionsList
    }
    
    /**Custom  Mathod used to get  movie option count*/
    func getMovieOptionListCount() ->Int {
        movieOptionsList.count
    }
    
    /**Custom  Mathod used to get searched movie  count*/
    func serchedMovieCount()->Int {
        searchMovieList?.count ?? 0
    }
    
    /**Custom  Mathod used to get  search movie */
    func searchedMovie(with index: Int) -> MovieList? {
        searchMovieList?[index]
    }
    
    /**Custom  Mathod used to get  movie related option count*/
    func separateOptionValueCount()->Int {
        separateOptionValue?.count ?? 0
    }
    
    /**Custom  Mathod used to get  movie related option*/
    func separateOptionVlaue(with index:Int)->String {
        separateOptionValue?[index] ?? ""
    }
    
    /**Custom  Mathod used to get  movie  option related value and remove duplicate */
    func getSeparateOptionValue(with option: String) {
        switch option {
        case "Year":
            separateOptionValue = movieList?.compactMap {$0.year}.removingDuplicates()
        case "Genre":
            separateOptionValue = movieList?.compactMap {$0.genre}.removingDuplicates()
            separateOptionValue = seprateDataWithComma(separateOptionList: separateOptionValue).flatMap {$0}.removingDuplicates()
        case "Directors":
            separateOptionValue = movieList?.compactMap {$0.director}.removingDuplicates()
            separateOptionValue = seprateDataWithComma(separateOptionList: separateOptionValue).flatMap {$0}.removingDuplicates()
        case "Actors":
            separateOptionValue = movieList?.compactMap {$0.actors}.removingDuplicates()
            separateOptionValue = seprateDataWithComma(separateOptionList: separateOptionValue).flatMap {$0}.removingDuplicates()
        default:
           print("")
        }
        reloadOptionsTableViewClosure?()
    }
    
    /** Private func used to seperatethe  value  */
    private func seprateDataWithComma(separateOptionList:[String]?)->[[String]] {
        var movieOption = [[String]]()
        for optionValue in separateOptionList ?? [] {
            let optionValue  = optionValue
            let seprateList = optionValue.components(separatedBy: ",")
            movieOption.append(seprateList)
        }
        return movieOption
    }
    
    /**Custom  Mathod used to get  movie list count*/
    func getMovieListCountWithOption()->Int {
        movieListWithOption?.count ?? 0
    }
    
    /**Custom  Mathod used to get  movie with  index*/
    func getMovieWithOption(with index: Int)-> MovieList? {
        movieListWithOption?[index]
    }
    
    /**Custom  Mathod used to filter  movie with  option*/
    func getMoviesListWithOption(optionType: String, optionValue:String) {
        switch optionType {
        case "Year":
            movieListWithOption = self.movieList?.filter{ $0.year?.range(of: optionValue, options: .caseInsensitive) != nil }
        case "Genre":
            movieListWithOption = self.movieList?.filter{ $0.genre?.range(of: optionValue, options: .caseInsensitive) != nil }
        case "Directors":
            movieListWithOption = self.movieList?.filter{ $0.director?.range(of: optionValue, options: .caseInsensitive) != nil }
        case "Actors":
            movieListWithOption = self.movieList?.filter{ $0.actors?.range(of: optionValue, options: .caseInsensitive) != nil }
        default:
           print("")
        }
    }
    
    /**Custom  Mathod used to search movie if search is enable */
    func searchMovieWithSearchOption(isSearchActive:Bool, searchOption:String) {
        if isSearchActive {
            searchMovieWithOption(option: searchOption)
        }
        reloadTableViewClosure?()
    }
    
    /**Private  Mathod used to search movie with search option*/
    private func searchMovieWithOption(option:String) {
        searchMovieList = movieList?.filter {$0.title?.range(of: option, options: .caseInsensitive) != nil || $0.genre?.range(of: option, options: .caseInsensitive) != nil || $0.actors?.range(of: option, options: .caseInsensitive) != nil || $0.director?.range(of: option, options: .caseInsensitive) != nil}
    }
}
