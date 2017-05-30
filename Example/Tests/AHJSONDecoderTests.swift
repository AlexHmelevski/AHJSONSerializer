//
//  AHJSONDecoderTests.swift
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

import XCTest
@testable import AHJSONSerializer

class AHJSONDecoderTests: XCTestCase {
    let json: [String : Any] = ["Dict" : [ "String" : "Test",
                                           "Int" : 100,
                                           "Dict" : [ "Bool": true]
        ],
                                "Int" : 50
    ]
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
   
    func test_mapContext_uses_path() {
        
        let context = AHJSONDecoder(json: json)
        
        let firstValue: Int = context["Int"].value() ?? 0
        
        XCTAssertEqual(firstValue, 50)
        
        let intValue: Int = context["Dict.Int"].value() ?? 0
        
        XCTAssertEqual(intValue, 100)
        
        let str: String = context["Dict.String"].value() ?? ""
        XCTAssertEqual(str, "Test")
        
        
        let bool: Bool = context["Dict.Dict.Bool"].value() ?? false
        XCTAssertEqual(bool, true)
    }
    
    
    
    func test_map_transforms_value() {
        
        let model: String = AHJSONDecoder(json: CarJSON().json)["name"]
                                     .map(transform: transformToInt)
                                     .map(transform: increase)
                                     .map(transform: transformToString)
                                     .value()!
        
        XCTAssertEqual(model, "912")
        
    }
    
    private func transformToInt(str: String) -> Int {
        return Int(str) ?? -1
    }
    private func increase(num: Int) -> Int {
        return num + 1
    }
    
    private func transformToString(int: Int) -> String {
        return String(int)
    }
    
}
