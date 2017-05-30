//
//  IJSONEncodableTests.swift
//  AHObjectMapper
//
//  Created by Alex Hmelevski on 2017-05-23.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest

class IJSONEncodableTests: XCTestCase {
    
    func test_encoding() {
        let user1 = UserProfile(json: UserJSON().json)
        let jsonUser  = user1.json
        
        let user = UserProfile(json:jsonUser)
        XCTAssertEqual(user.firstName, "Alex")
        XCTAssertEqual(user.lastName, "Alex's last name")
        
        XCTAssertEqual(user.cars[0].brand, "Porche")
        XCTAssertEqual(user.cars[1].name, "911")
        XCTAssertEqual(user.cars[0].engine, .V6)
        XCTAssertEqual(user.carBrand, "Porche")
    }
    
    func test_generic_type_encoding() {
        let resDict = ["result": UserJSON().json]

        let res = Result<UserProfile>(json: resDict).json
        
        let user = Result<UserProfile>(json: res).result!
        XCTAssertEqual(user.firstName, "Alex")
        XCTAssertEqual(user.lastName, "Alex's last name")
        
        XCTAssertEqual(user.cars[0].brand, "Porche")
        XCTAssertEqual(user.cars[1].name, "911")
        XCTAssertEqual(user.cars[0].engine, .V6)
        XCTAssertEqual(user.carBrand, "Porche")
    }
}
