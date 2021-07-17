//
//  JsonParser.swift
//  MovieApp
//
//  Created by Ahtasham Ansari on 16/07/21.
//

import Foundation

/**JsonParser Used to parse json file  to model*/
class JsonParser {
    static let sharedInstance = JsonParser()
    private init() {}

    /**Custom Mathod used to parse json*/
    func getMovieList()->[MovieList]? {
        if let path = Bundle.main.path(forResource: "movies", ofType: "json") {
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let movieList = try JSONDecoder().decode([MovieList].self, from: jsonData)
                return movieList
            } catch let error {
                print(error.localizedDescription)
            }
        }
        return []
    }
}
