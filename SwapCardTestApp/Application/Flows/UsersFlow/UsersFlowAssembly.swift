//
//  UsersFlowAssembly.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 03.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import EasyDi

final class UsersFlowAssembly: Assembly, StoryboardModuleInitializer {
    lazy var servicesAssembly: ServicesAssembly = self.context.assembly()
    
    func usersModule(with maintainer: UsersFlowController) -> UsersModule {
        return define(init: self.initialize(vc: UsersModule.self, in: "Modules")) {
            $0.title = Loc.usersList
            $0.randomUserService = self.servicesAssembly.randomUserService
            $0.maintainer = maintainer
            $0.viewModel = self.usersModuleViewModel()
            $0.viewModel.delegate = $0
            return $0
        }
    }
    
    func usersModuleViewModel() -> UsersModuleViewModel {
        return define(init: UsersModuleViewModel()) {
            $0.randomUserService = self.servicesAssembly.randomUserService
            return $0
        }
    }
    
    func userModule(with maintainer: UsersFlowController, user: RandomUser) -> UserModule {
        return define(init: self.initialize(vc: UserModule.self, in: "Modules")) {
            $0.viewModel = self.userModuleViewModel(user: user)
            $0.viewModel.delegate = $0
            return $0 
        }
    }
    
    func userModuleViewModel(user: RandomUser) -> UserModuleViewModel {
        return define(init: UserModuleViewModel(user)) {
            $0.imageService = self.servicesAssembly.imageService
            return $0
        }
    }
}
