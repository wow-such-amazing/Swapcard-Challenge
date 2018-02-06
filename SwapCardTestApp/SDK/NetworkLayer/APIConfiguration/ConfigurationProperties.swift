//
//  ConfigurationProperties.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 06.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import Foundation

struct Endpoint {
    var url: String
}

protocol FieldValueStruct {
    var field: String { get set }
    var value: String { get set }
}

struct HTTPHeader: FieldValueStruct {
    var field: String
    var value: String
    
    init(field: String, value: String) {
        self.field = field
        self.value = value
    }
}
struct HTTPBody: FieldValueStruct {
    var field: String
    var value: String
    
    init(field: String, value: String) {
        self.field = field
        self.value = value
    }
}
struct RequestParameter: FieldValueStruct {
    var field: String
    var value: String
    
    init(field: String, value: String) {
        self.field = field
        self.value = value
    }
}
