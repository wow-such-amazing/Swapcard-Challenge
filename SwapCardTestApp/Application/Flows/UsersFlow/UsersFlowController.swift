//
//  UsersFlowController.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 03.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import UIKit

protocol UsersFlowControllerDelegate: class {
    // For now this protocol is empty
}

final class UsersFlowController: UINavigationController, UsersModuleDelegate {
    lazy var assembly: UsersFlowAssembly = UsersFlowAssembly.instance()
    weak var maintainer: UsersFlowControllerDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        viewControllers = [self.assembly.usersModule(with: self)]
        self.configureNavigationBar()
    }
    
    func configureNavigationBar() {
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.navigationBar.tintColor = UIColor.white
        self.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    // MARK: UsersModuleDelegate
    func didSelect(user: RandomUser) {
        let userModule = self.assembly.userModule(with: self, user: user)
        self.pushViewController(userModule, animated: true)
    }
}
