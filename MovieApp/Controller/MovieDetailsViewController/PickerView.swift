//
//  PickerView.swift
//  MovieApp
//
//  Created by Ahtasham Ansari on 17/07/21.
//

import UIKit

//MARK: - UIPickerView UIPickerViewDataSource  UIPickerViewDelegate Mathod
extension MovieDetailsViewController: UIPickerViewDataSource,UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let rating = viewModel.getRatingValue(from: movieDetails, at: row)
        setRatingData(with: rating)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        viewModel.getRatingCount(from: movieDetails)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "test"
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let rating = viewModel.getRatingValue(from: movieDetails, at: row)
        let label = (view as? UILabel) ?? UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .center
        label.text = rating?.source ?? ""
        return label
    }
}
