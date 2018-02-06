//
//  Result.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 02.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import Foundation

typealias ResultClosure<T> = (Result<T>) -> Void
enum Result <T> {
    case success(T)
    case error(String)
}

typealias EmptyResultClosure = (EmptyResult) -> Void
enum EmptyResult {
    case success
    case error(String)
}
