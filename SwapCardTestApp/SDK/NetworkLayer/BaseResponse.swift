//
//  BaseResponse.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 03.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import Foundation

struct BaseResponse<T: Decodable> {
    var results: T
    var info: BaseResponseInfo
}

extension BaseResponse: Decodable {
    enum CodingKeys: CodingKey {
        case results
        case info
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.info = try container.decode(BaseResponseInfo.self, forKey: .info)
        self.results = try container.decode(T.self, forKey: .results)
    }
}

struct BaseResponseInfo {
    var seed: String
    var results: Int
    var page: Int
    var version: String
}

extension BaseResponseInfo: Decodable {
    enum CodingKeys: CodingKey {
        case seed
        case results
        case page
        case version
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.seed = try container.decode(String.self, forKey: .seed)
        self.results = try container.decode(Int.self, forKey: .results)
        self.page = try container.decode(Int.self, forKey: .page)
        self.version = try container.decode(String.self, forKey: .version)
    }
}
