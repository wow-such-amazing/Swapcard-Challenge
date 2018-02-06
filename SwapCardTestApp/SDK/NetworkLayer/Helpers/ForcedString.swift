//
//  ForcedString.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 02.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import Foundation

struct ForcedString<T: CodingKey>: Decodable {
    var value: String
    
    init(container: KeyedDecodingContainer<T>, key: T) {
        if let value = try? container.decode(String.self, forKey: key) {
            self.value = value
        }
        else if let value = try? container.decode(Int.self, forKey: key) {
            self.value = String(describing: value)
        }
        else if let value = try? container.decode(Bool.self, forKey: key) {
            self.value = String(describing: value)
        }
        else if let value = try? container.decode(Float.self, forKey: key) {
            self.value = String(describing: value)
        }
        else if let value = try? container.decode(Double.self, forKey: key) {
            self.value = String(describing: value)
        }
        else {
            fatalError("unable to create forced string value")
        }
    }
}
