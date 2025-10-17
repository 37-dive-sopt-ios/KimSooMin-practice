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
    
    private let passwordTextField: UITextField = {
        let passwordField = UITextField(frame: CGRect(x: 33, y: 335, width: 335, height: 52))
        passwordField.placeholder = "비밀번호"
        passwordField.backgroundColor = .grey200
        passwordField.layer.cornerRadius = 3
        passwordField.font = .subhead4
        passwordField.addLeftPadding()
        
        passwordField.isSecureTextEntry = true
        passwordField.textContentType = .none
        
        return passwordField
    }()
    
    private lazy var loginButton: UIButton = {
       let button = UIButton(frame: CGRect(x: 33, y: 422, width: 335, height: 57))
        button.backgroundColor = .primaryOrange
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .subhead1
        button.layer.cornerRadius = 6
        
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    // 화면 전환 - 모달
    private func presentToWelcomeVC() {
        let vc = WelcomeViewController()
        vc.modalPresentationStyle = .formSheet
        vc.id = idTextField.text
        self.present(vc, animated: true)
    }
    
    // 화면 전환 - 네비게이션
    private func pushToWelcomeVC(){
        let vc = WelcomeViewController()
        vc.id = idTextField.text
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // '로그인하기' 버튼 눌렸을 때
    @objc
    private func loginButtonDidTap() {
        //presentToWelcomeVC()
        pushToWelcomeVC()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
    }
    
    private func setLayout() {
        [sloganLabel,
         idTextField,
         passwordTextField,
         loginButton]
            .forEach {
                self.view.addSubview($0)
            }
    }
}
