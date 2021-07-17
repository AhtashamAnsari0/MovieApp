//
//  MovieDetailsTableViewCell.swift
//  MovieApp
//
//  Created by Ahtasham Ansari on 17/07/21.
//

import UIKit

/**UITableView Cell Used to display  the  movie details*/
class MovieDetailsTableViewCell: UITableViewCell {

    /**UILabel Used to  display movie option*/
    @IBOutlet weak var titleLabel: UILabel!
    /**UILabel Used to  display movie details*/
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK:Custom Mathod used to configure cell
    func configureCell(with movieDetails: MovieDetailModel?) {
        titleLabel.text = "\(movieDetails?.title ?? ""):"
        descriptionLabel.text = movieDetails?.value ?? ""
    }
    
}
