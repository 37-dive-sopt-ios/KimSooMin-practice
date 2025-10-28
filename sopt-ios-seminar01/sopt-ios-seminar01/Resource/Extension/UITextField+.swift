//
//  UITextField+.swift
//  sopt-ios-seminar01
//
//  Created by mandoo on 10/17/25.
//

import UIKit

extension UITextField {
    func addLeftPadding(_ width: CGFloat = 20) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    
    func addRightPadding(_ width: CGFloat = 20) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.rightView = paddingView
        self.rightViewMode = ViewMode.always
    }
}

//나연이 최고🤍
