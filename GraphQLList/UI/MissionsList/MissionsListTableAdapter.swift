//
//  MissionsListTableAdapter.swift
//  GraphQLList
//
//  Created by Nikolay Dolgopolov on 04.04.2022.
//

import UIKit

protocol MissionsListTableViewModelDelegate: AnyObject {
    func openDetail()
}

final class MissionsListTableAdapter: NSObject {
    private weak var delegate: MissionsListTableViewModelDelegate?
    private weak var tableView: UITableView?
    private var missions: [MissionsListQuery.Data.Launch] = []
    
    func connect(tableView: UITableView) {
        self.tableView = tableView
        tableView.register(MissionViewCell.self, forCellReuseIdentifier: MissionViewCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        refresh()
    }
    
    func refresh() {
        tableView?.reloadData()
    }
    
    func addItems(_ list: [MissionsListQuery.Data.Launch]) {
        self.missions.append(contentsOf: list)
        refresh()
    }
}


extension MissionsListTableAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        missions.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MissionViewCell.reuseIdentifier, for: indexPath) as? MissionViewCell else {
            assertionFailure("MissionViewCell not registered")
            return UITableViewCell()
        }
        cell.updateWith(missions[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
extension MissionsListTableAdapter: UITableViewDelegate {
    
}
