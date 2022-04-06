//
//  LoadMissionsListUseCase.swift
//  GraphQLList
//
//  Created by Nikolay Dolgopolov on 04.04.2022.
//

import Foundation

final class LoadMissionsListUseCase {
    private let listRepository: MissionsListRepository
    init(listRepository: MissionsListRepository) {
        self.listRepository = listRepository
    }
        
    func invoke(sort: String?,
                order: String?,
                limit: Int?,
                offset: Int?,
                _ complection: @escaping (Result<[MissionsListQuery.Data.Launch], Error>) -> Void) {

        listRepository.get(sort: sort,
                           order: order,
                           limit: limit,
                           offset: offset) { result in
            DispatchQueue.main.async {
                complection(result)
            }
        }
    }
}
