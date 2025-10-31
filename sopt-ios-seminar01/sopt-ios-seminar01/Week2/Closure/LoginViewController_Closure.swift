//
//  LoginViewController_Closure.swift
//  sopt-ios-seminar01
//
//  Created by mandoo on 10/31/25.
//

import UIKit

final class LoginViewController_Closure: UIViewController {
    
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
        passwordField.clearButtonMode = .whileEditing
        
        return passwordField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 33, y: 445, width: 335, height: 57))
        button.backgroundColor = .primaryOrange
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .subhead1
        button.layer.cornerRadius = 6
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private let showPasswordSwitch: UISwitch = {
        let toggle = UISwitch(frame: CGRect(x: 300, y: 400, width: 0, height: 0))
        toggle.isOn = false
        toggle.onTintColor = .primaryOrange
        toggle.thumbTintColor = .white
        return toggle
    }()
    
    private let showPasswordLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 210, y: 403, width: 100, height: 20))
        label.text = "비밀번호 표시"
        label.font = .subhead4
        label.textColor = .grey300
        return label
    }()
    
    // 스위치 버튼 눌렸을 때
    @objc
    private func showPasswordSwitchDidChange(_ sender: UISwitch) {
        passwordTextField.isSecureTextEntry = !sender.isOn
    }
    
    // 화면 전환 - 모달
    private func presentToWelcomeVC() {
        let vc = WelcomeViewController_Closure()
        vc.modalPresentationStyle = .formSheet
        vc.id = idTextField.text
        self.present(vc, animated: true)
    }
    
    // 화면 전환 - 네비게이션
    private func pushToWelcomeVC(){
        let vc = WelcomeViewController_Closure()
        vc.id = idTextField.text
        
        // completionHandler 정의하기!
       vc.completionHandler = { [weak self] message in
            
            guard let self = self else { return }
            
            self.sloganLabel.text = message
            self.idTextField.text = ""
            self.passwordTextField.text = ""
            self.loginButton.setTitle("다시 로그인하기", for: .normal)
        }
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
        showPasswordSwitch.addTarget(self, action: #selector(showPasswordSwitchDidChange(_:)), for: .valueChanged)
        
    }
    
    private func setLayout() {
        [sloganLabel,
         idTextField,
         passwordTextField,
         loginButton,
         showPasswordLabel,
         showPasswordSwitch]
            .forEach {
                self.view.addSubview($0)
            }
    }
}
