//
//  RealmProvider.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 06.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import Realm
import RealmSwift

protocol IRealmProvider {
    var realm: Realm? { get }
}

final class RealmProvider: IRealmProvider {
    var realm: Realm? {
        do {
            return try Realm()
        } catch {
            print("[REALM INITIALIZATION ERROR]: \(error.localizedDescription)")
        }
        return nil
    }
}
