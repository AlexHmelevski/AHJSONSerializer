//
//  AHJSONEncoderTests.swift
//  AHJSONSerializer
//
//  Created by Alex Hmelevski on 2017-05-25.
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
