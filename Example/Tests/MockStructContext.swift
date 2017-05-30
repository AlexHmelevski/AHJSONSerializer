//
//  MockStructContext.swift
//  AHJSONSerializer
//
//  Created by Alex Hmelevski on 2017-05-19.
//  Copyright © 2017 CocoaPods. All rights reserved.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2017 Alex Hmelevski
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

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
