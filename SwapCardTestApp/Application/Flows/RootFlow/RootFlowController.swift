//
//  RootFlowController.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 03.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import UIKit
import EasyDi

/*
 This is the root controller of the app - simple UIViewController.
 In this project it is useless.
 But if we will need to replace UsersFlow with AuthenticationFlow, for example,
 then this controller will manage these changes
 */

class RootFlowController: UIViewController, UsersFlowControllerDelegate {
    lazy var assembly: RootFlowAssembly = RootFlowAssembly.instance()
    var childFlowController: UIViewController?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = UIColor.white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let mainFlowController = self.assembly.usersFlowController(with: self)
        self.embed(mainFlowController)
    }
    
    func embed(_ viewController: UIViewController) {
        self.childFlowController = viewController
        
        self.addChildViewController(viewController)
        
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(viewController.view)
        NSLayoutConstraint.activate([
            viewController.view.leadingAnchor.constraint(
                equalTo: self.view.leadingAnchor
            ),
            viewController.view.topAnchor.constraint(
                equalTo: self.view.topAnchor
            ),
            viewController.view.trailingAnchor.constraint(
                equalTo: self.view.trailingAnchor
            ),
            viewController.view.bottomAnchor.constraint(
                equalTo: self.view.bottomAnchor
            ),
        ])
        
        viewController.didMove(toParentViewController: self)
    }
    
    // MARK: UsersFlowControllerDelegate
    // For example: If user will tap  button "Authenticate" on some of the UsersFlow's screens,
    // then UsersFlow will notify RootFlow by some of its delegate methods
}
