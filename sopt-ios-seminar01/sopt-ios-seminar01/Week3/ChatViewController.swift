//
//  ChatViewController.swift
//  sopt-ios-seminar01
//
//  Created by mandoo on 11/1/25.
//

import UIKit
import SnapKit

final class ChatViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    private var chatRooms: [ChatRoomModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUI()
        setLayout()
        setDelegate()
        register()
        loadMockData()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        title = "채팅"
        tableView.separatorStyle = .singleLine
    }
    
    
    private func setLayout() {
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func register(){
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
    }
    
    private func setDelegate(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func loadMockData() {
        chatRooms = ChatRoomModel.mockData
        tableView.reloadData()
    }
}
// MARK: - UITableViewDelegate

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(chatRooms[indexPath.row].name) 채팅방 선택됨")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

// MARK: - UITableViewDataSource

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatRooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as? ChatTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(chatRoom: chatRooms[indexPath.row])
        return cell
    }
}
