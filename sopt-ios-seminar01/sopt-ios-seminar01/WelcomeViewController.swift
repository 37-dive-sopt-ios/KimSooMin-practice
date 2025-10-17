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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
    }
    
    private func setLayout() {
        [dangeuniImage]
            .forEach {
                self.view.addSubview($0)
            }
    }
    
}
