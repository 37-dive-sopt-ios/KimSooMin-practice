//
//  UIView+.swift
//  sopt-ios-seminar01
//
//  Created by mandoo on 11/1/25.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
