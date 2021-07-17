//
//  MovieTableViewCell.swift
//  MovieApp
//
//  Created by Ahtasham Ansari on 16/07/21.
//

import UIKit

/**UITableView Cell Used to display  search movie*/
class MovieTableViewCell: UITableViewCell {

    /**UIImageView Used to  display movie poster*/
    @IBOutlet weak var posterImageView: UIImageView!
    /**UILabel Used to  display movie title*/
    @IBOutlet weak var titleLabel: UILabel!
    /**UILabel Used to  display movie language*/
    @IBOutlet weak var languageLabel: UILabel!
    /**UILabel Used to  display movie year*/
    @IBOutlet weak var yearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    // MARK:Custom Mathod used to configure cell
    func configureCell(with movie: MovieList?) {
        titleLabel.text = "Title: \(movie?.title ?? "")"
        languageLabel.text = "Language: \(movie?.language ?? "")"
        yearLabel.text = "Year: \(movie?.year ?? "")"
        if let objMovie = movie, let imageUrl = URL(string: objMovie.poster ?? "") {
            self.posterImageView.setImage(url: imageUrl)
        }
    }
    
}
