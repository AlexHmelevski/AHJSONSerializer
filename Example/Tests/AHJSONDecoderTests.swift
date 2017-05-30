//
//  AHJSONDecoderTests.swift
//  AHObjectMapper
//
//  Created by Alex Hmelevski on 2017-05-19.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import AHObjectMapper

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
