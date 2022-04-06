//
//  MissionListViewModel.swift
//  GraphQLList
//
//  Created by Nikolay Dolgopolov on 04.04.2022.
//

import Foundation
import Apollo
import ApolloWebSocket
protocol MissionListViewModelOutput: AnyObject {
    func presentList(_ launches: [MissionsListQuery.Data.Launch])
    func presentError(_ error: Error)
}

protocol MissionListViewModelInput: AnyObject {
    func loadList()
}


final class MissionListViewModel {
    private let listUseCase: LoadMissionsListUseCase
    weak var presenter: MissionListViewModelOutput?
    var title: String = Constants.title
    
    init(listUseCase: LoadMissionsListUseCase) {
        self.listUseCase = listUseCase
    }
}

private extension MissionListViewModel {
    enum Constants {
        static let title = "Missions list"
    }
}


extension MissionListViewModel: MissionListViewModelInput {
    
    func loadList() {
        listUseCase.invoke(sort: nil, order: nil, limit: 50, offset: nil) {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let launches):
                self.presenter?.presentList(launches)
            case.failure(let error):
                self.presenter?.presentError(error)
            }
        }
    }
}
