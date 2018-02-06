//
//  PictureItemsFactory.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 05.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import Foundation

final class PictureItemsFactory {
    var picture: Picture
    
    init(picture: Picture) {
        self.picture = picture
    }
    
    func items() -> [Item] {
        var items: [Item] = []
        items.append(TextCellModelWithLink(fieldName: Loc.pictureThumbnail, property: picture.thumbnail))
        items.append(TextCellModelWithLink(fieldName: Loc.pictureMedium, property: picture.medium))
        items.append(TextCellModelWithLink(fieldName: Loc.pictureLarge, property: picture.large))
        return items
    }
}
