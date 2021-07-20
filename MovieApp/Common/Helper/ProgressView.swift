//
//  ProgressView.swift
//  MovieApp
//
//  Created by Ahtasham Ansari on 19/07/21.
//

import UIKit

class ProgressView: UIProgressView {
    override func layoutSubviews() {
        super.layoutSubviews()
        let maskLayerPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.frame.height / 2)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskLayerPath.cgPath
        layer.mask = maskLayer
    }
}
