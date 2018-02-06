//
//  UIViewController+AlertController.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 02.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String?, message: String?, style: UIAlertControllerStyle) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let okAction = UIAlertAction(title: Loc.ok, style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
