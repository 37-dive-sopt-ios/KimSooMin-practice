//
//  WelcomeViewController.swift
//  sopt-ios-seminar01
//
//  Created by mandoo on 10/17/25.
//

import Foundation
import UIKit

final class WelcomeViewController: UIViewController {
    
    private let dangeuniImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 126, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "dangeuni")
        return imageView
    }()
    
    private let greetingLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 153, y: 295, width: 95, height: 60))
        label.text = "???님\n반가워요!"
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .head1
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
    }
    
    private func setLayout() {
        [dangeuniImage,
         greetingLabel]
            .forEach {
                self.view.addSubview($0)
            }
    }
    
}
