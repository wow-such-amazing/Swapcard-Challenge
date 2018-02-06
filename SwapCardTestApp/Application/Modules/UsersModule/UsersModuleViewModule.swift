//
//  UsersModuleViewModule.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 03.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import UIKit

protocol UsersModuleViewModelDelegate: class {
    func reload()
    func showError(error: String)
}

final class UsersModuleViewModel: FailCellDelegate {
    enum State {
        case loading
        case fail
    }
    weak var delegate: UsersModuleViewModelDelegate?
    var randomUserService: IRandomUserService?
    var sections: [Section] = [Section(items: [])]
    var readyToLoadNext: Bool = true
    var state: State = .loading
    
    init() {
        self.set(state: .loading, with: [])
    }
    
    func getUsersFromDataBase() {
        self.randomUserService?.getSavedUsers(completion: { (result) in
            switch result {
            case .success(let users):
                self.set(state: .loading, with: users)
            default:
                break
            }
        })
    }
    
    func getUsers() {
        guard readyToLoadNext else { return }
        self.readyToLoadNext = false
        self.randomUserService?.loadUsers(count: 10, completion: { (result) in
            self.readyToLoadNext = true
            switch result {
            case .success(let users):
                self.set(state: .loading, with: users)
            case .error(_):
                self.set(state: .fail, with: [])
            }
        })
    }
    
    func set(state: State, with users: [RandomUser]) {
        self.state = state
        if self.sections[0].items.isEmpty == false {
            self.sections[0].items.removeLast()
        }
        users.forEach { self.sections[0].items.append(UserCellModel($0)) }
        switch state {
        case .loading:
            self.sections[0].items.append(LoadingCellModel())
        case .fail:
            self.sections[0].items.append(FailCellModel())
        }
        self.delegate?.reload()
    }
    
    // MARK: FailCellDelegate
    func didTapRetry() {
        self.set(state: .loading, with: [])
        self.getUsers()
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
