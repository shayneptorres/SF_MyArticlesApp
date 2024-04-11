//
//  APIClient.swift
//  SF_MyArticlesApp
//
//  Created by Shayne Torres on 4/11/24.
//

import Foundation

enum APIClientError: Error {
    case genericError
}

class APIClient<T> {
    func fetchData() async throws -> Result<[T], Error> { return .failure(APIClientError.genericError) }
}
