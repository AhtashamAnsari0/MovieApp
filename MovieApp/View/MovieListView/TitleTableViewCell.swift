//
//  TitleTableViewCell.swift
//  MovieApp
//
//  Created by Ahtasham Ansari on 16/07/21.
//

import UIKit

/**UITableView Cell Used to display  the movie options*/
class TitleTableViewCell: UITableViewCell {

    /**UILabel Used to  display movie option*/
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
