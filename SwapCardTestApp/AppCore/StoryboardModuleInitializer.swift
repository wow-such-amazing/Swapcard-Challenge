//
//  StoryboardModuleInitializer.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 05.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import UIKit

protocol StoryboardModuleInitializer {
    func initialize<T: UIViewController>(vc: T.Type, in storyboardName: String) -> T
}

extension StoryboardModuleInitializer {
    func initialize<T: UIViewController>(vc: T.Type, in storyboardName: String) -> T {
        let bundle = Bundle(for: vc)
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: vc))
        return vc as! T
    }
}
