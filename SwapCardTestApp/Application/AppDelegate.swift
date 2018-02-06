//
//  AppDelegate.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 02.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let rootFlowController = RootFlowController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootFlowController
        window?.makeKeyAndVisible()
        return true
    }
}
