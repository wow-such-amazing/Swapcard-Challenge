//
//  ListSource.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 02.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import UIKit

extension UICollectionView {
    func register(cells: [AnyClass]) {
        for cell in cells {
            let personalInfoCell = UINib(nibName: String(describing: cell), bundle: Bundle(for: cell))
            self.register(personalInfoCell, forCellWithReuseIdentifier: String(describing: cell))
        }
    }
}

protocol Item {
    var reuseId: String { get }
    func size(in collectionView: UICollectionView) -> CGSize
    func configure(cell: UICollectionViewCell, with delegate: AnyObject)
}

struct Section {
    var items: [Item]
}
