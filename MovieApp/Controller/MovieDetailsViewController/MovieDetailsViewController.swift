//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by Ahtasham Ansari on 16/07/21.
//

import UIKit

/**View controller Used to display movie details*/
class MovieDetailsViewController: UIViewController {

    /**UIImageView Used to  display movie poster*/
    @IBOutlet weak var posterImageView: UIImageView!
    /**UIView Used to  show movie poster*/
    @IBOutlet weak var posterView: UIView!
    /**UIView Used to  show movie rating*/
    @IBOutlet var ratingView: UIView!
    /**UITableView Used to  show movie details*/
    @IBOutlet weak var tableView: UITableView!
    /**UILabel Used to  display movie rating*/
    @IBOutlet weak var ratingTitleLabel: UILabel!
    /**UIPickerView Used to  show and select movie rating*/
    @IBOutlet weak var pickerView: UIPickerView!
    /**UIPickerView Used to  select movie rating*/
    @IBOutlet weak var ratingButton: UIButton!
    /**UIProgressView Used to  show movie rating*/
    @IBOutlet weak var ratingProgressView: ProgressView!
    
    /**MovieList object  Used to  display movie details*/
    var movieDetails:MovieList?
    
    /**ViewModel object  Used to  fetch movie  details*/
    lazy var viewModel: MovieDetailsViewModel = {
        let viewModel = MovieDetailsViewModel()
        return viewModel
    }()
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialSetup()
        setMovieDetails()
        //ratingProgressView.progress = 0.86
    }
    
    //MARK: - Private Mathod Used for initial setup
    private func initialSetup() {
        self.title = viewModel.navigationTitle 
        tableView.tableHeaderView = posterView
        tableView.tableFooterView = ratingView
        tableView.register(UINib(nibName: String (describing: MovieDetailsTableViewCell.self), bundle: Bundle.main), forCellReuseIdentifier: Constants.CellIdentifiers.movieDetailsCell)
        tableView.dataSource = self
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.isHidden = true
        pickerView.layer.borderWidth = 1.0
        pickerView.layer.borderColor = UIColor.gray.cgColor
        ratingProgressView.progressTintColor = Constants.ColorPalette.lightYellowColor
        viewModel.reloadDetailsViewClosure = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        viewModel.movieDetails(with: movieDetails)
    }
    
    //MARK: - private Mathod Used set poster image
    private func setMovieDetails() {
        let avgRating = viewModel.IMDBAverageValue(with: movieDetails?.imdbRating)
        ratingProgressView.progress = avgRating
        //ratingTitleLabel.text = "IMDB: \(movieDetails?.imdbRating ?? "")/10"
        ratingTitleLabel.text = "IMDB:"
        if let movie = movieDetails, let imageUrl = URL(string: movie.poster ?? "") {
            self.posterImageView.setImage(url: imageUrl)
        }
    }
    
    //MARK: - Custom Mathod Used set rating
    func setRatingData(with rating: Ratings?) {
        //ratingTitleLabel.text = "\(rating?.source ?? ""): \(rating?.value ?? "")"
        ratingTitleLabel.text = "\(rating?.source ?? ""):"
        let avgRating = viewModel.getRatingAverageValue(with: rating)
        ratingProgressView.progress = avgRating
        pickerView.isHidden = true
    }
    
    //MARK: - UIButton action used to show and select rating
    @IBAction func ratingButtonAction(_ sender: Any) {
        if pickerView.isHidden {
            pickerView.isHidden = false
        } else {
            pickerView.isHidden = true
        }
       
    }
    
}

//MARK: - UITableView DataSource Mathod
extension MovieDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.movieDetailsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.movieDetailsCell, for: indexPath) as? MovieDetailsTableViewCell else {
            return MovieDetailsTableViewCell()
        }
        let details = viewModel.getMovieDetails(with: indexPath.row)
        cell.configureCell(with: details)
        return cell
    }
}
