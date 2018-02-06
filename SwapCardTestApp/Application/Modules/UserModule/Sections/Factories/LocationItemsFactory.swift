//
//  LocationItemsFactory.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 05.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import Foundation

final class LocationItemsFactory {
    var location: Location
    
    init(location: Location) {
        self.location = location
    }
    
    func items() -> [Item] {
        var items: [Item] = []
        items.append(TextCellModel(fieldName: Loc.locationPostcode, property: location.postcode))
        items.append(TextCellModel(fieldName: Loc.locationState, property: location.state.firstLetterUppercased()))
        items.append(TextCellModel(fieldName: Loc.locationCity, property: location.city.firstLetterUppercased()))
        items.append(TextCellModel(fieldName: Loc.locationStreet, property: location.street))
        return items
    }
}
