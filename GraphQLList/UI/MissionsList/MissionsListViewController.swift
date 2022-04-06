//
//  MissionsListViewController.swift
//  GraphQLList
//
//  Created by Nikolay Dolgopolov on 04.04.2022.
//

import UIKit

final class MissionsListViewController: UIViewController {
    
    private lazy var tableAdapter: MissionsListTableAdapter = MissionsListTableAdapter()
    var presenter: MissionsListPresenterInput?
    
    override func loadView() {
        let view = MissionsListView(frame: .zero)
        tableAdapter.connect(tableView: view.tableView)
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadList()
    }
}


extension MissionsListViewController: MissionsListPresenterOutput {
    func presentList(_ launches: [MissionsListQuery.Data.Launch]) {
        tableAdapter.addItems(launches)
    }
    
    func presentError(_ error: Error) {
        
    }
    
    
}
