//
//  APIConfiguration.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 05.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var endpoint: Endpoint { get }
    var path: [String] { get }
    var parameters: [RequestParameter] { get }
    var headers: [HTTPHeader] { get }
    var httpBody: [HTTPBody] { get }
    var method: HTTPMethod { get }
}

enum APIConfigurationError: Error {
    case failedToCreateUrlFromString(String)
}

extension APIConfiguration {
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        // Endpoint
        var urlString = self.endpoint.url
        
        // Path
        let path = self.path.joined(separator: "/")
        urlString += path
        
        // Parameters
        let parametersArray = self.parameters.map { $0.field + "=" + $0.value }
        let parameters = parametersArray.joined(separator: "?")
        urlString += "?" + parameters
        
        // URL
        guard let url = URL(string: urlString) else {
            throw APIConfigurationError.failedToCreateUrlFromString(urlString)
        }
        
        // URLRequest
        var urlRequest = URLRequest(url: url)
        
        
        // HTTP Method
        urlRequest.httpMethod = self.method.rawValue
        
        // Headers
        for header in self.headers {
            urlRequest.setValue(header.value, forHTTPHeaderField: header.field)
        }
        
        // httpBody
        var httpBody: [String: String] = [:]
        self.httpBody.forEach { httpBody[$0.field] = $0.value }
        do {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: httpBody, options: [])
        } catch {
            print(AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error)))
        }
        
        return urlRequest
    }
}
