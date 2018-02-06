//
//  FailCellModel.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 04.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import UIKit

final class FailCellModel: Item {
    var reuseId: String {
        return String(describing: FailCell.self)
    }
    
    func size(in collectionView: UICollectionView) -> CGSize {
        let width = collectionView.frame.width
        let height: CGFloat = 80.0
        return CGSize(width: width, height: height)
    }
    
    func configure(cell: UICollectionViewCell, with delegate: AnyObject) {
        guard let cell = cell as? FailCell else {
            return
        }
        cell.label.text = Loc.failCellTitle
        cell.retryButton.setTitle(Loc.failCellButton, for: .normal)
        if let strictDelegate = delegate as? FailCellDelegate {
            cell.delegate = strictDelegate
        }
    }
}
