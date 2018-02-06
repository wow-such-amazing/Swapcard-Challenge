//
//  FailCell.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 04.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import UIKit

protocol FailCellDelegate: class {
    func didTapRetry()
}

final class FailCell: UICollectionViewCell {
    @IBOutlet var label: UILabel!
    @IBOutlet var retryButton: UIButton!
    
    weak var delegate: FailCellDelegate?
    
    @IBAction func didTapRetryButton(_ sender: Any) {
        self.delegate?.didTapRetry()
    }
}
