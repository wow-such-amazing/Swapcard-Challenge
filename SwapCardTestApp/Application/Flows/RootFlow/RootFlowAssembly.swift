//
//  RootFlowAssembly.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 03.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import EasyDi

final class RootFlowAssembly: Assembly {
    func usersFlowController(with maintainer: RootFlowController) -> UsersFlowController {
        return define(init: UsersFlowController()) {
            $0.maintainer = maintainer
            return $0
        }
    }
}
