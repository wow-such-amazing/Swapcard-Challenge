//
//  String+Extensions.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 03.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import UIKit

extension String {
    func height(constrainedToWidth width: CGFloat, font: UIFont) -> CGFloat {
        let attString = NSAttributedString(string: self, attributes: [.font: font])
        let framesetter = CTFramesetterCreateWithAttributedString(attString)
        let range = CFRange(location: 0, length: 0)
        let constraintSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let resultSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, range, nil, constraintSize, nil)
        return resultSize.height
    }
}

extension String {
    func firstLetterUppercased() -> String {
        var new = self
        let firstLetter = new.removeFirst()
        let firstLetterUppercased = String(firstLetter).uppercased()
        return firstLetterUppercased + new
    }
}
