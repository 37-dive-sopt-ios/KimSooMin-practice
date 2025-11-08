//
//  LoginViewController_AutoLayout.swift
//  sopt-ios-seminar01
//
//  Created by mandoo on 11/1/25.
//

import UIKit
import SnapKit
import Then

final class LoginViewController_AutoLayout_MVC: UIViewController {
    
    private let rootView = LoginView_MVC()
    
    public override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAddTarget()
    }
    
    private func setAddTarget() {
        rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        rootView.showPasswordSwitch.addTarget(self, action: #selector(showPasswordSwitchDidChange(_:)), for: .valueChanged)
    }
    
    @objc
    private func loginButtonDidTap() {
        pushToWelcomeVC()
    }
    
    private func pushToWelcomeVC() {
//        let welcomeViewController = WelcomeViewController_MVC()
//        welcomeViewController.id = rootView.idTextField.text
//        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    // 스위치 버튼 눌렸을 때
    @objc
    private func showPasswordSwitchDidChange(_ sender: UISwitch) {
        rootView.passwordTextField.isSecureTextEntry = !sender.isOn
    }
    
    
}
