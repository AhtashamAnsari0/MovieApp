//
//  OptionsListViewController.swift
//  MovieApp
//
//  Created by Ahtasham Ansari on 17/07/21.
//

import UIKit

/**View controller Used to display movie options*/
class OptionsListViewController: UIViewController {

    /**UITableView Used to  show movie options related value*/
    @IBOutlet weak var tableView: UITableView!
    /**String variable Used to get movie options related value*/
    var optionType:String?
    /**MovieListViewModel variable Used to get movie options related value*/
    var viewModal: MovieListViewModel?
    /**Int private variable Used to expend and collapes the table section*/
    private var expandedSectionHeaderNumber = -2
    /**Int private variable Used to  collapes the table section*/
    private let kNoSectionSelectedNumber = -2
    
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialSetup()
    }
    
    //MARK: - Private Mathod Used for initial setup
    private func initialSetup() {
        
        self.title = optionType ?? ""
        tableView.register(OptionView.nib,forHeaderFooterViewReuseIdentifier:OptionView.reuseIdentifier)
        tableView.register(UINib(nibName: String (describing: MovieTableViewCell.self), bundle: Bundle.main), forCellReuseIdentifier: Constants.CellIdentifiers.moviePosterCell)
        tableView.dataSource = self
        tableView.delegate = self
        viewModal?.reloadOptionsTableViewClosure = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        viewModal?.getSeparateOptionValue(with: optionType ?? "")
    }
    
    //MARK: - Custom Mathod Used to  push the controller
    func pushToMovieDetailsViewController(with movie: MovieList?) {
        guard let movieDetailsViewController = CommonRedirection.sharedInstance.getMovieDetailsViewController() else {
            return
        }
        movieDetailsViewController.movieDetails = movie
        self.navigationController?.pushViewController(movieDetailsViewController, animated: true)
    }

}

//MARK: - UITableView DataSource Delegate Mathod
extension OptionsListViewController: UITableViewDataSource, UITableViewDelegate {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModal?.separateOptionValueCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.expandedSectionHeaderNumber == section) {
            return viewModal?.getMovieListCountWithOption() ?? 0
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.moviePosterCell, for: indexPath) as? MovieTableViewCell else {
            return MovieTableViewCell()
        }
        let movie = viewModal?.getMovieWithOption(with: indexPath.row)
        cell.configureCell(with: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModal?.getMovieWithOption(with: indexPath.row)
        pushToMovieDetailsViewController(with: movie)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: OptionView.reuseIdentifier) as? OptionView else {
            return nil
        }
        view.index = section
        view.optionTitleLabel.text = viewModal?.separateOptionVlaue(with: section)
        let headerTapGesture = UITapGestureRecognizer()
        headerTapGesture.addTarget(self, action: #selector(sectionHeaderWasTouched(_:)))
        view.addGestureRecognizer(headerTapGesture)
        if (self.expandedSectionHeaderNumber == section) {
            view.state = .expanded
            view.showSeparator = false
        }else {
            view.state = .collapsed
            view.showSeparator = true
        }
        return view
    }
    
    //MARK: - Custom Mathod Used to collapes the section
    func tableViewCollapeSection(_ section: Int) {
        self.expandedSectionHeaderNumber = kNoSectionSelectedNumber
        self.tableView.reloadSections(IndexSet(integer:section), with: UITableView.RowAnimation.automatic)
    }

    //MARK: - Custom Mathod Used to expand the section
    func tableViewExpandSection(_ section: Int) {
        self.expandedSectionHeaderNumber = section
        self.tableView.reloadSections(IndexSet(integer:section), with: UITableView.RowAnimation.automatic)
    }

    //MARK: - Section Action Mathod Used to expand and collapes the section
    @objc func sectionHeaderWasTouched(_ sender: UITapGestureRecognizer) {
        guard let headerView = sender.view as? OptionView else {
            return
        }
        viewModal?.getMoviesListWithOption(optionType: optionType ?? "", optionValue: headerView.optionTitleLabel.text ?? "")
        let section = headerView.index
        if (self.expandedSectionHeaderNumber == kNoSectionSelectedNumber) {
            self.expandedSectionHeaderNumber = section
            tableViewExpandSection(section)
            
        } else {
            if (self.expandedSectionHeaderNumber == section) {
                tableViewCollapeSection(section)
            } else {
                tableViewCollapeSection(self.expandedSectionHeaderNumber)
                tableViewExpandSection(section)
            }
        }
        let sectionRect = tableView.rect(forSection: section)
        let origin:CGPoint = tableView.convert(sectionRect.origin, to: tableView)
        tableView.setContentOffset(CGPoint(x: 0.0, y: origin.y - 0.0), animated: true)
                
    }
}
