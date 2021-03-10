//
//  MoyaProvider.swift
//  GitHubStarWatchdog
//
//  Created by Anton Potapov on 09.03.2021.
//

import Foundation
import Promises
import Moya
import Alamofire

public extension MoyaProvider {
    
    func request<Resource: Decodable>(_ target: Target, decoder: JSONDecoder = .default) -> Promise<Resource> {
        requestData(target).then { data -> Resource in
            do {
//                print(data.prettyPrintedJSON)
                let resource = try decoder.decode(Resource.self, from: data)
                return resource
            } catch {
                print(error)
                throw error
            }
        }
    }

    func requestData(_ target: Target) -> Promise<Data> {
        wrap { _ = self.request(target, completion: $0) }
            .then(handleResult)
            .catch { error in
                print(error)
            }
    }

    func send(_ target: Target) -> Promise<Void> {
        requestData(target).then { _ in }
    }
    
    private func handleResult(_ result: Result<Moya.Response, MoyaError>) throws -> Data {
        switch result {
        case .success(let response):
            return try handleSuccessResponse(response)
        case .failure(let error):
            print(error)
            throw error
        }
    }
    
    private func handleSuccessResponse(_ response: Moya.Response) throws -> Data {
        if let serverError = try? JSONDecoder().decode(ServerError.self, from: response.data) {
            throw serverError
        }
        return response.data
    }
}
