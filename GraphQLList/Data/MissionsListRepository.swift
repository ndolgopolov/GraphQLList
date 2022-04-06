//
//  MissionsListRepository.swift
//  GraphQLList
//
//  Created by Nikolay Dolgopolov on 04.04.2022.
//

import Foundation
protocol MissionsListRepository {
    func get(sort: String?,
             order: String?,
             limit: Int?,
             offset: Int?,
             _ complection: @escaping (Result<[MissionsListQuery.Data.Launch], Error>) -> Void)
}

final class ListRepository: MissionsListRepository {
    private let dataSource: NetworkService
    init(dataSource: NetworkService) {
        self.dataSource = dataSource
    }
    
    func get(sort: String?,
             order: String?,
             limit: Int?,
             offset: Int?,
             _ complection: @escaping (Result<[MissionsListQuery.Data.Launch], Error>) -> Void) {
            dataSource.apollo.fetch(query: MissionsListQuery(sort: sort,
                                                         order: order,
                                                         limit: limit,
                                                         offset: offset)) { result in
            switch result {
            case .success(let queryResult):
                // unwrap [Launch?]
                guard let data = queryResult.data,
                      let launches = data.launches?.compactMap({ $0 }) else {
                    // TODO handle error
                    return
                }
                complection(.success(launches))
            case .failure(let error):
                complection(.failure(error))
            }
            
        }
        
    }
    
}
