//
//  WelcomeViewController_AutoLayout.swift
//  sopt-ios-seminar01
//
//  Created by mandoo on 10/31/25.
//

import UIKit
import SnapKit

final class WelcomeViewController_AutoLayout: UIViewController {
    var id: String?
    
    private let dangeuniImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dangeuni")
        return imageView
    }()
    
    private let greetingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .head1
        label.textAlignment = .center
        return label
    }()
    
    lazy var goMainButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .primaryOrange
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .subhead1
        button.layer.cornerRadius = 6
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        return button
    }()
    
    lazy var reLoginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .grey200
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(.grey300, for: .normal)
        button.titleLabel?.font = .subhead1
        button.layer.cornerRadius = 6
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    // '다시로그인' 버튼 눌렸을 때
    @objc
    public func backToLoginButtonDidTap() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        }
        else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    // 입력받은 id 값 바인딩
    private func bindID() {
        if let id = id {
            if id == "" {
                self.greetingLabel.text = "반가워요!"
            }
            else {
                self.greetingLabel.text = "\(id)님\n반가워요!"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
        bindID()
    }
    
    private func setLayout() {
        [dangeuniImage,
         greetingLabel,
         goMainButton,
         reLoginButton]
            .forEach {
                self.view.addSubview($0)
            }
        dangeuniImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(87)
            $0.width.height.equalTo(150)
        }
        
        greetingLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(dangeuniImage.snp.bottom).offset(58)
            $0.width.equalTo(95)
            $0.height.equalTo(60)
        }
        
        goMainButton.snp.makeConstraints {
            $0.top.equalTo(greetingLabel.snp.bottom).offset(73)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(58)
        }
        
        reLoginButton.snp.makeConstraints {
            $0.top.equalTo(goMainButton.snp.bottom).offset(14)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(58)
        }
    }
    
}
