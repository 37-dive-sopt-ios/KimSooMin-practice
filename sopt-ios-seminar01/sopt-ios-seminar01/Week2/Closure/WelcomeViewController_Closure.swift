//
//  WelcomeViewController_Closure.swift
//  sopt-ios-seminar01
//
//  Created by mandoo on 10/31/25.
//

import UIKit

final class WelcomeViewController_Closure: UIViewController {
    var id: String?
    var completionHandler: ((String) -> Void)?
    
    private let dangeuniImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 126, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "dangeuni")
        return imageView
    }()
    
    private let greetingLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 153, y: 295, width: 95, height: 60))
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .head1
        label.textAlignment = .center
        return label
    }()
    
    lazy var goMainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 33, y: 426, width: 335, height: 57))
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
        let button = UIButton(frame: CGRect(x: 33, y: 498, width: 335, height: 57))
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
    private func backToLoginButtonDidTap() {
        let nickname = id ?? "알 수 없는 사용자"
        
        completionHandler?("\(nickname)님이 다시 로그인 버튼을 눌렀어요!")
        
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
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
    }
    
}

