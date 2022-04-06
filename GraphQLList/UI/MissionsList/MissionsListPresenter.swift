//
//  MissionsListPresenter.swift
//  GraphQLList
//
//  Created by Nikolay Dolgopolov on 04.04.2022.
//

import Foundation
protocol MissionsListPresenterOutput: AnyObject {
    func presentList(_ launches: [MissionsListQuery.Data.Launch])
    func presentError(_ error: Error)
}

protocol MissionsListPresenterInput: AnyObject {
    func openDetail()
    func loadList()
}

final class MissionsListPresenter {
    private weak var view: MissionsListPresenterOutput?
    private let viewModel: MissionListViewModelInput
    init(view: MissionsListPresenterOutput,
         viewModel: MissionListViewModelInput) {
        self.view = view
        self.viewModel = viewModel
    }
}

extension MissionsListPresenter: MissionsListPresenterInput {
    func openDetail() {
        
    }
    
    func loadList() {
        viewModel.loadList()
    }
}

extension MissionsListPresenter: MissionListViewModelOutput {
    func presentList(_ launches: [MissionsListQuery.Data.Launch]) {
        view?.presentList(launches)
    }
    
    func presentError(_ error: Error) {
        view?.presentError(error)
    }
}
