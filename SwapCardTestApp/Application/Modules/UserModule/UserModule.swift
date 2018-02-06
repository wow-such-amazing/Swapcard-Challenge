//
//  UserModule.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 03.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import UIKit

final class UserModule: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UserModuleViewModelDelegate {
    @IBOutlet var stretchyHeaderController: StretchyHeaderController!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var avatarImageView: UIImageView!

    var viewModel: UserModuleViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureCollectionView()
        self.stretchyHeaderController.configure(minH: 100.0, cornerRadius: 10.0)
        self.viewModel.getThumbnail()
    }
    
    func configureCollectionView() {
        self.collectionView.register(cells: [TextCell.self, SeparatorCell.self])
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.showsVerticalScrollIndicator = false
    }
    
    // MARK: UserModuleViewModelDelegate
    func didReceive(error: String) {
        self.showAlert(title: Loc.errorTitle, message: error, style: .alert)
    }
    
    func didReceive(image: UIImage) {
        self.avatarImageView.image = image
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
        if let cellModel = viewModel.item(at: indexPath) as? TextCellModelWithLink {
            cellModel.openLink()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.stretchyHeaderController.scrollViewDidScroll(scrollView)
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.viewModel.sizeForItem(at: indexPath, in: collectionView)
    }
}
