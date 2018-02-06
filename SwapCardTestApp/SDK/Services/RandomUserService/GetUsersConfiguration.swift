//
//  GetUsersConfiguration.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 03.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import Alamofire

struct GetUsersConfiguration: APIConfiguration {
    init(parameters: [RequestParameter]) {
        self.endpoint = Endpoint(url: "https://randomuser.me/")
        self.path = ["api"]
        self.parameters = parameters
        self.headers = []
        self.httpBody = []
        self.method = .get
    }
    
    // MARK: APIConfiguration
    var endpoint: Endpoint
    var path: [String]
    var parameters: [RequestParameter]
    var headers: [HTTPHeader]
    var httpBody: [HTTPBody]
    var method: HTTPMethod
}
