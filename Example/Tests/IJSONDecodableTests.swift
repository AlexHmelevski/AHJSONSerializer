//
//  IJSONDecodableTests.swift
//  AHObjectMapper
//
//  Created by Alex Hmelevski on 2017-05-16.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import AHObjectMapper


class IMappableTests: XCTestCase {
    
    func test_mappable() {
        
        let carJson: [String: Any] = ["name": "911", "brand" : "Porche", "Engine": "V6"]
        let json: [String: Any] = ["firstName" : "Alex", "lastName": "Alex's last name","Cars": [carJson,carJson],"Car": carJson]
        let user = User(json: json)
        
        XCTAssertEqual(user.firstName, "Alex")
        XCTAssertEqual(user.lastName, "Alex's last name")
        
        XCTAssertEqual(user.cars[0].carBrand, "Porche")
        XCTAssertEqual(user.cars[1].carName, "911")
        XCTAssertEqual(user.cars[0].engine, .V6)
        XCTAssertEqual(user.carBrand, "Porche")
    }
    
    func test_optional_poperties() {
        
        let carJson: [String: Any] = ["name": "911", "brand" : "Porche"]
        let json: [String: Any] = ["firstName" : "Alex", "lastName": "Alex's last name","Car": carJson]
        let user = User(json: json)
        
        XCTAssertEqual(user.firstName, "Alex")
        XCTAssertEqual(user.lastName, "Alex's last name")
        
        
        XCTAssertEqual(user.car?.carBrand, "Porche")
        XCTAssertEqual(user.car?.carName, "911")
    }
    
}
