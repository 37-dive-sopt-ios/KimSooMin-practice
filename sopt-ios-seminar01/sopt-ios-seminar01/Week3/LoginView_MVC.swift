//
//  LoginView.swift
//  sopt-ios-seminar01
//
//  Created by mandoo on 11/1/25.
//

import UIKit
import SnapKit
import Then

final class LoginView_MVC: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        backgroundColor = .white
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("SecondView Error!")
    }
    
    let sloganLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .subhead1
        return label
    }()
    
    let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.backgroundColor = .grey200
        textField.layer.cornerRadius = 3
        textField.font = .subhead4
        textField.addLeftPadding()
        
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = "비밀번호"
        passwordField.backgroundColor = .grey200
        passwordField.layer.cornerRadius = 3
        passwordField.font = .subhead4
        passwordField.addLeftPadding()
        passwordField.isSecureTextEntry = true
        passwordField.textContentType = .none
        passwordField.clearButtonMode = .whileEditing
        
        return passwordField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .primaryOrange
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .subhead1
        button.layer.cornerRadius = 6
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        return button
    }()
    
    let showPasswordSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.isOn = false
        toggle.onTintColor = .primaryOrange
        toggle.thumbTintColor = .white
        return toggle
    }()
    
    let showPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호 표시"
        label.font = .subhead4
        label.textColor = .grey300
        return label
    }()
    
    
    private func setLayout() {
        addSubviews(sloganLabel,
                    idTextField,
                    passwordTextField,
                    loginButton,
                    showPasswordLabel,
                    showPasswordSwitch
                )
        
        sloganLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(163)
        }
        
        idTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(sloganLabel.snp.bottom).offset(71)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(showPasswordSwitch.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(58)
        }
        
        showPasswordSwitch.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        showPasswordLabel.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(23)
            $0.trailing.equalTo(showPasswordSwitch.snp.leading).offset(-15)
        }
    }
}
