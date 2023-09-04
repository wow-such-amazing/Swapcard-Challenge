//
//  RandomUser.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 02.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

final class RandomUser: Object, Decodable {
    @objc dynamic var gender: String = ""
    @objc dynamic var name: Name! = Name()
    @objc dynamic var location: Location! = Location()
    @objc dynamic var email: String = ""
    @objc dynamic var login: Login! = Login()
    @objc dynamic var dob: String = ""
    @objc dynamic var registered: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var cell: String = ""
    @objc dynamic var id: Id! = Id()
    @objc dynamic var picture: Picture! = Picture()
    @objc dynamic var nat: String = ""

    enum CodingKeys: CodingKey {
        case gender
        case name
        case location
        case email
        case login
        case dob
        case registered
        case phone
        case cell
        case id
        case picture
        case nat
    }
    
    convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.gender = try container.decode(String.self, forKey: .gender)
        self.name = try container.decode(Name.self, forKey: .name)
        self.location = try container.decode(Location.self, forKey: .location)
        self.email = try container.decode(String.self, forKey: .email)
        self.login = try container.decode(Login.self, forKey: .login)
        // self.dob = try container.decode(String.self, forKey: .dob)
        self.dob = "[!] Requires Codable Migration"
//        self.registered = try container.decode(String.self, forKey: .registered)
        self.registered = "[!] Requires Codable Migration"
        self.phone = try container.decode(String.self, forKey: .phone)
        self.cell = try container.decode(String.self, forKey: .cell)
        self.id = try container.decode(Id.self, forKey: .id)
        self.picture = try container.decode(Picture.self, forKey: .picture)
        self.nat = try container.decode(String.self, forKey: .nat)
    }
}


final class Name: Object, Decodable {
    @objc dynamic var title: String = ""
    @objc dynamic var first: String = ""
    @objc dynamic var last: String = ""

    enum CodingKeys: CodingKey {
        case title
        case first
        case last
    }
    
    convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try container.decode(String.self, forKey: .title)
        self.first = try container.decode(String.self, forKey: .first)
        self.last = try container.decode(String.self, forKey: .last)
    }
}

final class Location: Object, Decodable {
    @objc dynamic var street: String = ""
    @objc dynamic var city: String = ""
    @objc dynamic var state: String = ""
    @objc dynamic var postcode: String = ""

    enum CodingKeys: CodingKey {
        case street
        case city
        case state
        case postcode
    }
    
    convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
//        self.street = try container.decode(String.self, forKey: .street)
        self.street = "[!] Requires Codable Migration"
        self.city = try container.decode(String.self, forKey: .city)
        self.state = try container.decode(String.self, forKey: .state)
        
        self.postcode = ForcedString(container: container, key: .postcode).value
    }
}

final class Login: Object, Decodable {
    @objc dynamic var username: String = ""
    @objc dynamic var password: String = ""
    @objc dynamic var salt: String = ""
    @objc dynamic var md5: String = ""
    @objc dynamic var sha1: String = ""
    @objc dynamic var sha256: String = ""

    enum CodingKeys: CodingKey {
        case username
        case password
        case salt
        case md5
        case sha1
        case sha256
    }
    
    convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.username = try container.decode(String.self, forKey: .username)
        self.password = try container.decode(String.self, forKey: .password)
        self.salt = try container.decode(String.self, forKey: .salt)
        self.md5 = try container.decode(String.self, forKey: .md5)
        self.sha1 = try container.decode(String.self, forKey: .sha1)
        self.sha256 = try container.decode(String.self, forKey: .sha256)
    }
}

final class Picture: Object, Decodable {
    @objc dynamic var large: String = ""
    @objc dynamic var medium: String = ""
    @objc dynamic var thumbnail: String = ""

    enum CodingKeys: CodingKey {
        case large
        case medium
        case thumbnail
    }
    
    convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.large = try container.decode(String.self, forKey: .large)
        self.medium = try container.decode(String.self, forKey: .medium)
        self.thumbnail = try container.decode(String.self, forKey: .thumbnail)
    }
}

final class Id: Object, Decodable {
    @objc dynamic var name: String = Loc.propertyIsEmpty
    @objc dynamic var value: String = Loc.propertyIsEmpty

    enum CodingKeys: CodingKey {
        case name
        case value
    }
    
    convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let name = try container.decode(String.self, forKey: .name)
        if name != "" {
            self.name = name
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .value) {
            self.value = value
        }
    }
}
