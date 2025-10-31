//
//  ScrollViewController.swift
//  sopt-ios-seminar01
//
//  Created by mandoo on 10/31/25.
//

import SnapKit
import UIKit

class ScrollViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private let red: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let orange: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    private let yellow: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private let green: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private let blue: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private let purple: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    private func setLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [red, orange, yellow, green, blue, purple].forEach {
            contentView.addSubview($0)
        }
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        red.snp.makeConstraints {
            $0.top.leading.equalTo(contentView)
            $0.height.equalTo(300)
            $0.width.equalTo(view.frame.width * 0.5)
        }
        orange.snp.makeConstraints {
            $0.top.trailing.equalTo(contentView)
            $0.height.equalTo(300)
            $0.width.equalTo(view.frame.width * 0.5)
        }
        yellow.snp.makeConstraints {
            $0.top.equalTo(red.snp.bottom)
            $0.leading.equalTo(red.snp.leading)
            $0.height.equalTo(300)
            $0.width.equalTo(red.snp.width)
        }
        green.snp.makeConstraints {
            $0.top.equalTo(orange.snp.bottom)
            $0.leading.equalTo(orange.snp.leading)
            $0.trailing.equalTo(orange.snp.trailing)
            $0.height.equalTo(300)
            $0.width.equalTo(view.frame.width * 0.5)
        }
        
        blue.snp.makeConstraints {
            $0.top.equalTo(yellow.snp.bottom)
            $0.leading.equalTo(yellow.snp.leading)
            $0.height.equalTo(300)
            $0.width.equalTo(view.frame.width * 0.5)
        }
        
        purple.snp.makeConstraints {
            $0.top.equalTo(green.snp.bottom)
            $0.trailing.equalTo(green)
            $0.height.equalTo(300)
            $0.width.equalTo(view.frame.width * 0.5)
            $0.bottom.equalTo(contentView)
        }
        
    }
}
