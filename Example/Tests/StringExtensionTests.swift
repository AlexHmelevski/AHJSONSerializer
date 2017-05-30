//
//  StringExtensionTests.swift
//  AHObjectMapper
//
//  Created by Alex Hmelevski on 2017-05-19.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import AHJSONSerializer

class StringExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    
    func test_subscript_return_self_string_if_no_delimiter_found() {
        let testString = "Alex Test"
        let result = testString["."]
        
        XCTAssertEqual(result.before, "Alex Test")
        XCTAssertEqual(result.after, "")
        
    }
    
    func test_subscript_return_self_string_if_delimiter_found_two_words() {
        let testString = "Alex.Test"
        let result = testString["."]
        
        XCTAssertEqual(result.before, "Alex")
        XCTAssertEqual(result.after, "Test")
        
    }
    
    func test_subscript_return_self_string_if_delimiter_found_multiple_words() {
        let testString = "Alex.Test.Test.Test"
        let result = testString["."]
        
        XCTAssertEqual(result.before, "Alex")
        XCTAssertEqual(result.after, "Test.Test.Test")
        
    }
    
}
