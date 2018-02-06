//
//  NameItemsFactory.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 05.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import Foundation

final class NameItemsFactory {
    var name: Name
    
    init(name: Name) {
        self.name = name
    }
    
    func items() -> [Item] {
        var items: [Item] = []
        items.append(TextCellModel(fieldName: Loc.nameTitle, property: name.title.firstLetterUppercased()))
        items.append(TextCellModel(fieldName: Loc.nameFirst, property: name.first.firstLetterUppercased()))
        items.append(TextCellModel(fieldName: Loc.nameLast, property: name.last.firstLetterUppercased()))
        return items
    }
}
