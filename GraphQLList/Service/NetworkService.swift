//
//  NetworkService.swift
//  GraphQLList
//
//  Created by Nikolay Dolgopolov on 04.04.2022.
//

import Foundation
import Apollo

final class NetworkService {
    private(set) lazy var apollo: ApolloClient = {
        return ApolloClient(url: URL(string: "https://api.spacex.land/graphql")!)
    }()
}
