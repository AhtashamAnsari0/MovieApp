//
//  ViewController.swift
//  MovieApp
//
//  Created by Ahtasham Ansari on 16/07/21.
//

import UIKit

/**View controller Used to display movie options*/
class MovieListViewController: UIViewController {

    /**UITableView Used to  show movie options*/
    @IBOutlet weak var tableView: UITableView!
    /**UISearchBar Used to  search  the movie */
    @IBOutlet weak var searchBar: UISearchBar!
    /**Bool variable  Used to to check search enable or disable */
    var isSearchActive = false
    
    /**ViewModel   Used to  fetch movie  list*/
    lazy var viewModel: MovieListViewModel = {
        let viewModel = MovieListViewModel()
        return viewModel
    }()
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialSetup()
    }

    //MARK: - Private Mathod Used for initial setup
    private func initialSetup() {
        self.title = "Movies"
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        tableView.register(UINib(nibName: String (describing: MovieTableViewCell.self), bundle: Bundle.main), forCellReuseIdentifier: Constants.CellIdentifiers.moviePosterCell)
       tableView.register(UINib(nibName: String (describing: TitleTableViewCell.self), bundle: Bundle.main), forCellReuseIdentifier: Constants.CellIdentifiers.movieListCell)
        
        viewModel.reloadTableViewClosure = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        viewModel.fetchMovieList()
    }

    //MARK: - Custom Mathod Used to  push the controller
    func pushToOptionViewController(with option:String) {
        guard let optionViewController = CommonRedirection.sharedInstance.getOptionsListViewController() else {
            return
        }
        optionViewController.optionType = option
        optionViewController.viewModal = viewModel
        self.navigationController?.pushViewController(optionViewController, animated: true)
    }
    
    func pushToMovieDetailsViewController(with movie: MovieList?) {
        guard let movieDetailsViewController = CommonRedirection.sharedInstance.getMovieDetailsViewController() else {
            return
        }
        movieDetailsViewController.movieDetails = movie
        self.navigationController?.pushViewController(movieDetailsViewController, animated: true)
    }
    
}


//MARK:- Extension UISearchBar Delegate Mathod
extension MovieListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        isSearchActive = searchText.isEmpty ? false : true
        viewModel.searchMovieWithSearchOption(isSearchActive: isSearchActive, searchOption: searchText)
    }
}

