//
//  OptionView.swift
//  MovieApp
//
//  Created by Ahtasham Ansari on 17/07/21.
//

import UIKit

enum sectionState {
    case collapsed
    case expanded
}

/**UIView  Used to display  the movie options */
class OptionView: UITableViewHeaderFooterView {
   
    /**UILabel Used to  display movie option*/
    @IBOutlet weak var optionTitleLabel: UILabel!
    /**UILabel Used to  separate the option*/
    @IBOutlet weak var separatorLabel: UILabel!
    /**String  Used to  reuse*/
    static let reuseIdentifier: String = String(describing: self)
    var index = 0
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    var showSeparator = false {
        didSet {
            switch showSeparator {
            case true:
                separatorLabel.isHidden = false
            case false:
                separatorLabel.isHidden = true
            }
        }
    }
    
    var state:sectionState = .collapsed {
        didSet {
            switch state {
            case .collapsed:
                optionTitleLabel.font = UIFont.systemFont(ofSize: 16)
                
            case .expanded:
                optionTitleLabel.font = UIFont.boldSystemFont(ofSize: 16)
            }
        }
    }
}
