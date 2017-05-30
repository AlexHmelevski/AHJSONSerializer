//
//  AHJSONEncoderTests.swift
//  AHObjectMapper
//
//  Created by Alex Hmelevski on 2017-05-25.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import AHObjectMapper

class AHJSONEncoderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func test_ecnoder_creates_json() {
        let encoder = AHJSONEncoder()
        let number = 100
        encoder["name"].map(transform: uppercased)
                       .set(value: "Alex")
        
        encoder["num"].map(transform: transformToString)
                      .map(transform: transformToInt)
                      .map(transform: increate)
                      .set(value: number)
     
        XCTAssertEqual(encoder.json["num"] as! Int, 101)
        XCTAssertEqual(encoder.json["name"] as! String, "ALEX")
    }
    
    func test_decoder_decodes_after_encoder_integration() {
        let encoder = AHJSONEncoder()
        let number = 100
        encoder["name"].map(transform: uppercased)
            .set(value: "Alex")
        
        encoder["num"].map(transform: transformToString)
            .map(transform: transformToInt)
            .map(transform: increate)
            .set(value: number)
        
        let data = try! JSONSerialization.data(withJSONObject: encoder.json, options: .prettyPrinted)
        let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
        
        let decoder = AHJSONDecoder(json: json!)
        
        let name: String = decoder["name"].value() ?? ""
        let num: Int = decoder["num"].value() ?? -1
        
        
        XCTAssertEqual(name, "ALEX")
        XCTAssertEqual(num, 101)
    }
    
    private func transformToString(num: Int) -> String {
        return String(num)
    }
    
    private func transformToInt(string: String) -> Int {
        return Int(string) ?? -1
    }
    
    private func increate(num: Int) -> Int {
        return num + 1
    }
    
    private func uppercased(str: String) -> String {
        return str.uppercased()
    }

}
