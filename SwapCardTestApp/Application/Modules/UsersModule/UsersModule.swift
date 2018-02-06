//
//  UsersModule.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 03.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import UIKit

protocol UsersModuleDelegate: class {
    func didSelect(user: RandomUser)
}

final class UsersModule: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout, UsersModuleViewModelDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var viewModel: UsersModuleViewModel!
    var randomUserService: IRandomUserService?
    weak var maintainer: UsersModuleDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureCollectionView()
        self.viewModel.getUsersFromDataBase()
    }
    
    func configureCollectionView() {
        self.collectionView.register(cells: [UserCell.self, LoadingCell.self, FailCell.self])
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.viewModel.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.numberOfItemsIn(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseId = viewModel.reuseId(at: indexPath)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath)
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.willDisplay(cell, at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cellModel = viewModel.item(at: indexPath) as? UserCellModel else {
            return
        }
        let user = cellModel.value
        self.maintainer?.didSelect(user: user)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentHeight = scrollView.contentSize.height
        let yOffset = scrollView.contentOffset.y
        let scrollViewHeight = scrollView.frame.height
        
        if contentHeight - yOffset - scrollViewHeight < 120 {
            guard self.viewModel.state != .fail else { return }
            self.viewModel.getUsers()
        }
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.viewModel.sizeForItem(at: indexPath, in: collectionView)
    }
    
    // MARK: UsersModuleViewModelDelegate
    func reload() {
        self.collectionView.reloadData()
    }
    
    func showError(error: String) {
        self.showAlert(title: Loc.errorTitle, message: error, style: .alert)
    }
}
