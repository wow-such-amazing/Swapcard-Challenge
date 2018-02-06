//
//  LoginItemsFactory.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 05.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import Foundation

final class LoginItemsFactory {
    var login: Login
    
    init(login: Login) {
        self.login = login
    }
    
    func items() -> [Item] {
        var items: [Item] = []
        items.append(TextCellModel(fieldName: Loc.loginUsername, property: login.username))
        items.append(TextCellModel(fieldName: Loc.loginPassword, property: login.password))
        items.append(TextCellModel(fieldName: Loc.loginSalt, property: login.salt))
        items.append(TextCellModel(fieldName: Loc.loginMd5, property: login.md5))
        items.append(TextCellModel(fieldName: Loc.loginSha1, property: login.sha1))
        items.append(TextCellModel(fieldName: Loc.loginSha256, property: login.sha256))
        return items
    }
}
