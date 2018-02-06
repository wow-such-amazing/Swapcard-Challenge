//
//  IdItemsFactory.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 05.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import Foundation

final class IdItemsFactory {
    var id: Id
    
    init(id: Id) {
        self.id = id
    }
    
    func items() -> [Item] {
        var items: [Item] = []
        items.append(TextCellModel(fieldName: Loc.idName, property: id.name))
        items.append(TextCellModel(fieldName: Loc.idValue, property: id.value))
        return items
    }
}
