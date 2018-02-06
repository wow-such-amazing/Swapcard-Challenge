//
//  UserModuleViewModel.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 03.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import UIKit

protocol UserModuleViewModelDelegate: class {
    func didReceive(image: UIImage)
    func didReceive(error: String)
}

final class UserModuleViewModel {
    weak var delegate: UserModuleViewModelDelegate?
    var imageService: IImageService?
    var user: RandomUser
    var sections: [Section]
    
    init(_ user: RandomUser) {
        self.user = user
        self.sections = RandomUserSectionsFactory(user: user).sections()
    }
    
    func getThumbnail() {
        self.imageService?.getImageBy(urlString: self.user.picture.medium, completion: { (result) in
            switch result {
            case .success(let image):
                self.delegate?.didReceive(image: image)
            case .error(_):
                break
            }
        })
    }
    
    // MARK: Collection view related
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfItemsIn(section: Int) -> Int {
        return sections[section].items.count
    }
    
    func reuseId(at indexPath: IndexPath) -> String {
        return sections[indexPath.section].items[indexPath.item].reuseId
    }
    
    func sizeForItem(at indexPath: IndexPath, in collectionView: UICollectionView) -> CGSize {
        return sections[indexPath.section].items[indexPath.item].size(in: collectionView)
    }
    
    func willDisplay(_ cell: UICollectionViewCell, at indexPath: IndexPath) {
        sections[indexPath.section].items[indexPath.item].configure(cell: cell, with: self)
    }
    
    func item(at indexPath: IndexPath) -> Item {
        return sections[indexPath.section].items[indexPath.item]
    }

}
