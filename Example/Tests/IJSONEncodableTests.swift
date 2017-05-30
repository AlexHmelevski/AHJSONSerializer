//
//  IJSONEncodableTests.swift
//  AHJSONSerializer
//
//  Created by Alex Hmelevski on 2017-05-23.
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
