//
//  StretchyHeaderController.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 03.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import UIKit

final class StretchyHeaderController: NSObject {
    @IBOutlet var headerBackgroundContainerHeight: NSLayoutConstraint!
    @IBOutlet var headerCenteredContainerTop: NSLayoutConstraint?
    @IBOutlet var substrateTop: NSLayoutConstraint!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var viewController: UIViewController!
    
    var minH: CGFloat = 0
    var maxH: CGFloat = 0
    var cornerRadius: CGFloat = 0
    var previousOffsetY: CGFloat = 0
    
    func configure(minH: CGFloat, cornerRadius: CGFloat) {
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        self.minH = minH
        self.cornerRadius = cornerRadius
        self.maxH = headerBackgroundContainerHeight.constant
        self.headerCenteredContainerTop?.constant = statusBarHeight
        
        if #available(iOS 11.0, *) {
            collectionView.contentInsetAdjustmentBehavior = .never
        }
        viewController.automaticallyAdjustsScrollViewInsets = false
        collectionView.contentInset = UIEdgeInsets(top: maxH - self.cornerRadius, left: 0, bottom: self.cornerRadius, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: maxH, left: 0, bottom: 0, right: 0)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        
        let compensatedOffsetY = offsetY + maxH - self.cornerRadius
        
        let centeredContainerTop = (self.headerCenteredContainerTop?.constant ?? 0.0)
        let offsetChangeY: CGFloat
        if (previousOffsetY + centeredContainerTop) > minH {
            offsetChangeY = min(previousOffsetY, minH - centeredContainerTop + cornerRadius) - compensatedOffsetY
        } else {
            offsetChangeY = previousOffsetY - compensatedOffsetY
        }

        let currentHeaderContainerHeight = headerBackgroundContainerHeight.constant

        var newHeaderContainerHeight = currentHeaderContainerHeight + offsetChangeY

        if compensatedOffsetY + centeredContainerTop >= minH && !(newHeaderContainerHeight >= minH + centeredContainerTop) {
            newHeaderContainerHeight = minH + centeredContainerTop
        }

        headerBackgroundContainerHeight.constant = newHeaderContainerHeight
        substrateTop.constant = newHeaderContainerHeight - self.cornerRadius
        previousOffsetY = compensatedOffsetY
    }
}
