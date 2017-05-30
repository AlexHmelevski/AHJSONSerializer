//
//  MockStructContext.swift
//  AHObjectMapper
//
//  Created by Alex Hmelevski on 2017-05-19.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation

@testable import AHJSONSerializer

struct DataBase: JSONDecodable {
    let dictionary: [String: UserProfile]
    
    init(decoder: AHJSONDecoder) {
        dictionary = decoder["data"].value() ?? [:]
    }
}

struct UserProfile: JSONDecodable,JSONEncodable {
    let firstName: String
    let lastName: String
    let car: CarProfile?
    let cars: [CarProfile]
    let carBrand : String
    
    
    init(decoder: AHJSONDecoder) {
        firstName  = decoder["firstName"].value() ?? ""
        lastName = decoder["lastName"].value() ?? ""
        car = decoder["Car"].value() ?? CarProfile()
        cars = decoder["Cars"].value() ?? []
        carBrand = decoder["Car.brand"].value() ?? ""
    }
    
    func encode(with encoder: AHJSONEncoder) {
        encoder["firstName"].set(value: firstName)
        encoder["lastName"].set(value: lastName)
        encoder["Car"].set(value: car)
        encoder["Cars"].set(value: cars)
    }
}

struct CarProfile: JSONDecodable,JSONEncodable {
    let name: String
    let brand: String
    let engine: EngineType
    
    init(carName: String = "", carBrand: String = "", engine: EngineType = .noEngine) {
        self.name = carName
        self.brand = carBrand
        self.engine = engine
    }
    
    init(decoder: AHJSONDecoder) {
        name = decoder["name"].value() ?? ""
        brand = decoder["brand"].value() ?? ""
        engine = decoder["Engine"].value() ?? .noEngine
    }

    func encode(with encoder: AHJSONEncoder) {
        encoder["name"].set(value: name)
        encoder["brand"].set(value: brand)
        encoder["Engine"].set(value: engine.rawValue)
    }
}

enum EngineType: String {
    case V6
    case V8
    case noEngine
}
