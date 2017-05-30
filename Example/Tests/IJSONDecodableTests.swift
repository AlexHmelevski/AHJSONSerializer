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
        
       
        let user = User(json: UserJSON().json)
        
        XCTAssertEqual(user.firstName, "Alex")
        XCTAssertEqual(user.lastName, "Alex's last name")
        
        XCTAssertEqual(user.cars[0].carBrand, "Porche")
        XCTAssertEqual(user.cars[1].carName, "911")
        XCTAssertEqual(user.cars[0].engine, .V6)
        XCTAssertEqual(user.carBrand, "Porche")
    }
    
    func test_optional_poperties() {

        let user = User(json: UserJSON().json)
        
        XCTAssertEqual(user.firstName, "Alex")
        XCTAssertEqual(user.lastName, "Alex's last name")
        
        
        XCTAssertEqual(user.car?.carBrand, "Porche")
        XCTAssertEqual(user.car?.carName, "911")
    }
    
}
