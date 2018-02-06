//
//  SeparatorCellModel.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 03.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import UIKit

final class SeparatorCellModel: Item {
    var title: String
    
    init(_ title: String) {
        self.title = title
    }
    
    // MARK: Item
    var reuseId: String {
        return String(describing: SeparatorCell.self)
    }
    
    func size(in collectionView: UICollectionView) -> CGSize {
        let width = collectionView.frame.width
        let height: CGFloat = 44.0
        return CGSize(width: width, height: height)
    }
    
    func configure(cell: UICollectionViewCell, with delegate: AnyObject) {
        guard let cell = cell as? SeparatorCell else {
            return
        }
        cell.label.text = self.title
    }
}
