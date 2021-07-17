//
//  CommonRedirection.swift
//  MovieApp
//
//  Created by Ahtasham Ansari on 17/07/21.
//

import UIKit

class CommonRedirection {
    static let sharedInstance = CommonRedirection()
    private init() {}
    
    func storyBoard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    func getOptionsListViewController() -> OptionsListViewController? {
        return storyBoard().instantiateViewController(withIdentifier: OptionsListViewController().ClassName) as? OptionsListViewController
    }
    
    func getMovieDetailsViewController() -> MovieDetailsViewController? {
        return storyBoard().instantiateViewController(withIdentifier: MovieDetailsViewController().ClassName) as? MovieDetailsViewController
    }
}
