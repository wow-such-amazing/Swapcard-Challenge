//
//  RandomUserSectionsFactory.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 05.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import Foundation

final class RandomUserSectionsFactory {
    let user: RandomUser
    let nameItemsFactory: NameItemsFactory
    let locationItemsFactory: LocationItemsFactory
    let loginItemsFactory: LoginItemsFactory
    let idItemsFactory: IdItemsFactory
    let pictureItemsFactory: PictureItemsFactory
    let dateConverter: DateConverter = DateConverter()
    
    init(user: RandomUser) {
        self.user = user
        self.nameItemsFactory = NameItemsFactory(name: user.name)
        self.locationItemsFactory = LocationItemsFactory(location: user.location)
        self.loginItemsFactory = LoginItemsFactory(login: user.login)
        self.idItemsFactory = IdItemsFactory(id: user.id)
        self.pictureItemsFactory = PictureItemsFactory(picture: user.picture)
    }
    
    func sections() -> [Section] {
        var result: [Section] = []
        
        var personalInfoSection = Section(items: [SeparatorCellModel(Loc.personalInfo)])
        personalInfoSection.items.append(contentsOf: self.personalInfoSection())
        result.append(personalInfoSection)
        
        var contactInfoSection = Section(items: [SeparatorCellModel(Loc.contactInfo)])
        contactInfoSection.items.append(contentsOf: self.contactInfoSection())
        result.append(contactInfoSection)
        
        var privateUserInfoSection = Section(items: [SeparatorCellModel(Loc.privateUserInfo)])
        privateUserInfoSection.items.append(contentsOf: self.privateUserInfoSection())
        result.append(privateUserInfoSection)
        
        var pictureSection = Section(items: [SeparatorCellModel(Loc.pictureInfo)])
        pictureSection.items.append(contentsOf: self.pictureSection())
        pictureSection.items.append(SeparatorCellModel(""))
        result.append(pictureSection)
        
        return result
    }
    
    private func personalInfoSection() -> [Item] {
        var items: [Item] = []
        items.append(contentsOf: self.nameItemsFactory.items())
        items.append(TextCellModel(fieldName: Loc.gender, property: user.gender.firstLetterUppercased()))
        let formattedDob = self.dateConverter.convert(dateString: user.dob,
                                                      inputDateFormat: "yyyy-MM-dd HH:mm:ss",
                                                      outputDateFormat: "EEEE, MMM d, yyyy")
        items.append(TextCellModel(fieldName: Loc.dob, property: formattedDob))
        items.append(TextCellModel(fieldName: Loc.nat, property: user.nat))
        return items
    }
    
    private func contactInfoSection() -> [Item] {
        var items: [Item] = []
        items.append(contentsOf: self.locationItemsFactory.items())
        items.append(TextCellModel(fieldName: Loc.email, property: user.email))
        items.append(TextCellModel(fieldName: Loc.phone, property: user.phone))
        items.append(TextCellModel(fieldName: Loc.cell, property: user.cell))
        return items
    }
    
    private func privateUserInfoSection() -> [Item] {
        var items: [Item] = []
        let formattedRegistered = self.dateConverter.convert(dateString: user.registered,
                                                             inputDateFormat: "yyyy-MM-dd HH:mm:ss",
                                                             outputDateFormat: "EEEE, MMM d, yyyy")
        items.append(TextCellModel(fieldName: Loc.registered, property: formattedRegistered))
        items.append(contentsOf: self.loginItemsFactory.items())
        items.append(contentsOf: self.idItemsFactory.items())
        return items
    }
    
    private func pictureSection() -> [Item] {
        var items: [Item] = []
        items.append(contentsOf: self.pictureItemsFactory.items())
        return items
    }
}
