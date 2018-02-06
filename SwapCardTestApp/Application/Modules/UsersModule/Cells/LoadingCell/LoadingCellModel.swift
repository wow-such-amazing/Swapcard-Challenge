//
//  LoadingCellModel.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 03.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import UIKit

final class LoadingCellModel: Item {
    var reuseId: String {
        return String(describing: LoadingCell.self)
    }
    
    func size(in collectionView: UICollectionView) -> CGSize {
        let width = collectionView.frame.width
        let height: CGFloat = 80.0
        return CGSize(width: width, height: height)
    }
    
    func configure(cell: UICollectionViewCell, with delegate: AnyObject) {
        guard let cell = cell as? LoadingCell else { return }
        cell.activityIndicator.startAnimating()
    }
}
