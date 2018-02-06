//
//  TextCellModelWithLink.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 05.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import UIKit

final class TextCellModelWithLink: Item {
    private var verticalPaddings: CGFloat = 44.0
    private var horizontalPaddings: CGFloat = 32.0
    var fieldName: String
    var property: String
    
    init(fieldName: String, property: String) {
        self.fieldName = fieldName
        self.property = property
    }
    
    func openLink() {
        guard let url = URL(string: self.property) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    // MARK: Item
    var reuseId: String {
        return String(describing: TextCell.self)
    }
    
    func size(in collectionView: UICollectionView) -> CGSize {
        let width = collectionView.frame.width
        let contraintWidth = width - self.horizontalPaddings
        let textHeight: CGFloat = self.property.height(constrainedToWidth: contraintWidth, font: UIFont.systemFont(ofSize: 17.0))
        let height = textHeight + self.verticalPaddings
        return CGSize(width: width, height: height)
    }
    
    func configure(cell: UICollectionViewCell, with delegate: AnyObject) {
        guard let cell = cell as? TextCell else { return }
        cell.fieldNameLabel.text = self.fieldName
        let attributedString = NSMutableAttributedString(string: self.property)
        let range = NSRange(location: 0, length: self.property.count)
        attributedString.addAttribute(.link, value: self.property, range: range)
        cell.propertyLabel.attributedText = attributedString
    }
}
