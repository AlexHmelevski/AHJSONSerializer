//
//  MockStructs.swift
//  AHObjectMapper
//
//  Created by Alex Hmelevski on 2017-05-19.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
@testable import AHObjectMapper

struct User: JSONDecodable, JSONEncodable {
    private(set) var firstName: String = ""
    private(set) var lastName: String = ""
    private(set) var car: Car?
    private(set) var cars: [Car] = []
    private(set) var carBrand : String = ""
    
    init(decoder: AHJSONDecoder) {
        firstName  <~ decoder["firstName"]
        lastName <~ decoder["lastName"]
        car <~ decoder["Car"]
        cars <~ decoder["Cars"]
        carBrand <~ decoder["Car.brand"]
    }
    
    func encode(with encoder: AHJSONEncoder) {
        firstName ~> encoder["firstName"]
        lastName ~> encoder["lastName"]
        car ~> encoder["Car"]
        cars ~> encoder["Cars"]
    }
}

struct Car: JSONDecodable {
    private(set) var carName: String = ""
    private(set) var carBrand: String = ""
    private(set) var engine: Engine = .noEngine
    
    init(carName: String = "", carBrand: String = "") {
        self.carName = carName
        self.carBrand = carBrand
    }
    
    init(decoder: AHJSONDecoder) {
        carName <~ decoder["name"]
        carBrand <~ decoder["brand"]
        engine <~ decoder["Engine"]
    }
}


enum Engine: String {
    case V6
    case V8
    case noEngine
}
