//
//  MissionListBuilder.swift
//  GraphQLList
//
//  Created by Nikolay Dolgopolov on 05.04.2022.
//

import UIKit

protocol ModuleBuilder: AnyObject {
    func build() -> UIViewController
}

final class MissionsListBuilder: ModuleBuilder {
    func build() -> UIViewController {
        let viewModel = MissionListViewModel(listUseCase: LoadMissionsListUseCase(listRepository: ListRepository(dataSource: NetworkService())))
        let viewController = MissionsListViewController()
        let presenter = MissionsListPresenter(view: viewController,
                                              viewModel: viewModel)
        viewModel.presenter = presenter
        viewController.presenter = presenter
        
        return viewController
    }
}
