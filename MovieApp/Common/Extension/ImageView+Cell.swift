//
//  ImageView+Cell.swift
//  MovieApp
//
//  Created by Ahtasham Ansari on 16/07/21.
//

import UIKit
import AlamofireImage

//MARK:- UIImageView extension used to set image from url.
extension UIImageView {
    func setImage(url: URL) {
        self.af.setImage(withURL: url, imageTransition: .crossDissolve(0.1))
    }
}

//MARK:- NSObject extension used to return Self Instance Extension
extension NSObject{
    var ClassName:String {
        return String(describing: type(of: self))
    }
}

//MARK:- Array extension used remove duplicate value.
extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
