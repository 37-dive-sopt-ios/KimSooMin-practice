//
//  LoginViewController.swift
//  sopt-ios-seminar01
//
//  Created by mandoo on 10/17/25.
//

import Foundation
import UIKit

final class LoginViewController: UIViewController {
    
    private let sloganLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 47, y: 163, width: 307, height: 70))
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .subhead1
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 33, y: 276, width: 335, height: 52))
        textField.placeholder = "아이디"
        textField.backgroundColor = .grey200
        textField.layer.cornerRadius = 3
        textField.font = .subhead4
        textField.addLeftPadding()
        
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
    }
    
    private func setLayout() {
        [sloganLabel,
        idTextField]
            .forEach {
            self.view.addSubview($0)
        }
    }
}
