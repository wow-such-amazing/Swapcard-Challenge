//
//  ServicesAssembly.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 03.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import EasyDi

final class ServicesAssembly: Assembly {
    var randomUserService: IRandomUserService {
        return define(init: RandomUserService()) {
            $0.realmProvider = self.realmProvider
            return $0
        }
    }
    
    var imageService: IImageService {
        return define(init: ImageService())
    }
    
    var realmProvider: IRealmProvider {
        return define(init: RealmProvider())
    }
}
