//
//  UserCellModel.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 03.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import UIKit

struct UserCellModel: Item {
    var value: RandomUser
    
    init(_ value: RandomUser) {
        self.value = value
    }
    
    // MARK: Item
    var reuseId: String {
        return String(describing: UserCell.self)
    }
    
    func size(in collectionView: UICollectionView) -> CGSize {
        let width = collectionView.frame.width
        let height: CGFloat = 80.0
        return CGSize(width: width, height: height)
    }
    
    func configure(cell: UICollectionViewCell, with delegate: AnyObject) {
        guard let cell = cell as? UserCell else {
            return
        }
        let first = self.value.name.first.firstLetterUppercased()
        let last = self.value.name.last.firstLetterUppercased()
        cell.nameLabel.text = first + " " + last
        cell.emailLabel.text = self.value.email
    }
}
