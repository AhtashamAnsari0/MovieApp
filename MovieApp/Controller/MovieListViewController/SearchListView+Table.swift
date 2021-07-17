//
//  SearchListView+Table.swift
//  MovieApp
//
//  Created by Ahtasham Ansari on 17/07/21.
//

import UIKit

//MARK: - UITableView DataSource Delegate Mathod
extension MovieListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isSearchActive ? viewModel.serchedMovieCount() : viewModel.getMovieOptionListCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if isSearchActive {
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.moviePosterCell, for: indexPath) as? MovieTableViewCell else {
                return MovieTableViewCell()
            }
            let movie = viewModel.searchedMovie(with: indexPath.row)
            cell.configureCell(with: movie)
            return cell
            
        } else {
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.movieListCell, for: indexPath) as? TitleTableViewCell else {
                return TitleTableViewCell()
            }
            cell.titleLabel.text = viewModel.getMovieOptionList()[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isSearchActive {
            pushToMovieDetailsViewController(with: viewModel.searchedMovie(with: indexPath.row))
        } else {
            pushToOptionViewController(with: viewModel.getMovieOptionList()[indexPath.row])
        }
    }
}
