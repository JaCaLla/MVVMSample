//
//  ViewController.swift
//  MVVMSample
//
//  Created by Javier Calatrava on 18/1/26.
//

import UIKit
import Combine

class UserListViewController: UIViewController {
    
    private let tableView = UITableView()
    private let viewModel = UserListViewModel()
    private let cellId = "UserCell"
    
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
        viewModel.fetchUsers()
    }
    
    private func setupBindings() {
        viewModel.$users
            .receive(on: RunLoop.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    private func setupUI() {
        title = "Usuarios con Combine"
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
}

// MARK: - TableView DataSource
extension UserListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let user = viewModel.users[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = user.name
        content.secondaryText = user.email
        cell.contentConfiguration = content
        
        return cell
    }
}
