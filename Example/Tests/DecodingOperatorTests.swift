//
//  OperatorTests.swift
//  AHJSONSerializer
//
//  Created by Alex Hmelevski on 2017-05-16.
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

extension Int {
    var asString: String {
        return String(self)
    }
}

class OperatorBasicTypeTests: XCTestCase {
    
    func test_int() {
        let json = ["int": 1]
        let map = AHJSONDecoder(json: json)
        var intV: Int = 0
        var intOp: Int? = 0
        var intForce: Int! = 0
        var intString: String = ""
        
        intV <~ map["int"]
        XCTAssertEqual(1, intV)
    
        
        intOp <~ map["int"]
        XCTAssertEqual(1, intOp)
        
        intForce <~ map["int"]
        XCTAssertEqual(1, intForce)
        
    }
    
    
    func test_int_dictionary() {
        let result = ["int": 1]
        let json = ["int": result]
        let map = AHJSONDecoder(json: json)
        var intV: [String: Int] = [:]
        var intOp: [String: Int]? = [:]
        var intForce: [String: Int]! = [:]
        
        intV <~ map["int"]
        XCTAssertEqual(result, intV)
        
        intOp <~ map["int"]
        XCTAssertEqual(result, intOp!)
        
        intForce <~ map["int"]
        XCTAssertEqual(result, intForce)
        
    }
    
    
    func test_array_int() {
        let result:[Int] = [1,2]
        let json = ["int": result]
        let map = AHJSONDecoder(json: json)
        var intV: [Int] = []
        var intOp: [Int]? = []
        var intForce: [Int]! = []
        
        intV <~ map["int"]
        XCTAssertEqual(result, intV)
        
        intOp <~ map["int"]
        XCTAssertEqual(result, intOp!)
        
        intForce <~ map["int"]
        XCTAssertEqual(result, intForce)
        
    }
    
    func test_int_from_String() {
        let json = ["int": "1"]
        let map = AHJSONDecoder(json: json)
        var intV: Int = 0
        var intOp: Int? = 0
        var intForce: Int! = 0
        
        intV <~ map["int"]
        XCTAssertEqual(1, intV)
        
        intOp <~ map["int"]
        XCTAssertEqual(1, intOp)
        
        intForce <~ map["int"]
        XCTAssertEqual(1, intForce)
    }
    
    
    func test_int_dictionary_from_string() {
        let result = ["int": 1]
        let json = ["int": ["int":"1"]]
        let map = AHJSONDecoder(json: json)
        var intV: [String: Int] = [:]
        var intOp: [String: Int]? = [:]
        var intForce: [String: Int]! = [:]
        
        intV <~ map["int"]
        XCTAssertEqual(result, intV)
        
        intOp <~ map["int"]
        XCTAssertEqual(result, intOp!)
        
        intForce <~ map["int"]
        XCTAssertEqual(result, intForce)
        
    }
    
    func test_int_array_from_String() {
        let result: [Int] = [1,2]
        let json = ["int": ["1","2"]]
        let map = AHJSONDecoder(json: json)
        var intV: [Int] = [0]
        var intOp: [Int]? = [0]
        var intForce: [Int]! = [0]
        
        intV <~ map["int"]
        XCTAssertEqual(result, intV)
        
        intOp <~ map["int"]
        XCTAssertEqual(result, intOp!)
        
        intForce <~ map["int"]
        XCTAssertEqual(result, intForce)
    }
    
    func test_int32() {
        let json: [String: Int32] = ["int": 1]
        let map = AHJSONDecoder(json: json)
        var intV: Int32 = 0
        var intOp: Int32? = 0
        var intForce: Int32! = 0
        
        intV <~ map["int"]
        XCTAssertEqual(1, intV)
        
        intOp <~ map["int"]
        XCTAssertEqual(1, intOp)
        
        intForce <~ map["int"]
        XCTAssertEqual(1, intForce)
    }
    
    
    func test_array_of_int32() {
        let result: [Int32] = [1,2]
        let json: [String: [Int32]] = ["int": result]
        let map = AHJSONDecoder(json: json)
        var intV: [Int32] = []
        var intOp: [Int32]? = []
        var intForce: [Int32]! = []
        
        intV <~ map["int"]
        XCTAssertEqual(result, intV)
        
        intOp <~ map["int"]
        XCTAssertEqual(result, intOp!)
        
        intForce <~ map["int"]
        XCTAssertEqual(result, intForce)
    }
    
//    func test_int32_from_String() {
//        let json = ["int": "1"]
//        let map = AHJSONDecoder(json: json)
//        var intV: Int32 = 0
//        var intOp: Int32? = 0
//        var intForce: Int32! = 0
//        
//        intV <~ map["int"]
//        XCTAssertEqual(1, intV)
//        
//        intOp <~ map["int"]
//        XCTAssertEqual(1, intOp)
//        
//        intForce <~ map["int"]
//        XCTAssertEqual(1, intForce)
//    }
//
//    func test_int16_from_String() {
//        let json = ["int": "1"]
//        let map = AHJSONDecoder(json: json)
//        var intV: Int16 = 0
//        var intOp: Int16? = 0
//        var intForce: Int16! = 0
//        
//        intV <~ map["int"]
//        XCTAssertEqual(1, intV)
//        
//        intOp <~ map["int"]
//        XCTAssertEqual(1, intOp)
//        
//        intForce <~ map["int"]
//        XCTAssertEqual(1, intForce)
//    }
//    
//    func test_int32_from_string() {
//        let result: [Int32] = [1,2]
//        let json: [String: [String]] = ["int": ["1","2"]]
//        let map = AHJSONDecoder(json: json)
//        var intV: [Int32] = []
//        var intOp: [Int32]? = []
//        var intForce: [Int32]! = []
//        
//        intV <~ map["int"]
//        XCTAssertEqual(result, intV)
//        
//        intOp <~ map["int"]
//        XCTAssertEqual(result, intOp!)
//        
//        intForce <~ map["int"]
//        XCTAssertEqual(result, intForce)
//    }
    
    
    func test_bool() {
        let json: [String: Bool] = ["bool": true]
        let map = AHJSONDecoder(json: json)
        var boolV: Bool = false
        var boolOp: Bool? = false
        var boolForce: Bool! = false
        
        boolV <~ map["bool"]
        XCTAssertEqual(true, boolV)
        
        boolOp <~ map["bool"]
        XCTAssertEqual(true, boolOp)
        
        boolForce <~ map["bool"]
        XCTAssertEqual(true, boolForce)
    }
    
    func test_array_of_bool() {
        let result = [true,false,true]
        let json: [String: [Bool]] = ["bool": result]
        let map = AHJSONDecoder(json: json)
        var boolV: [Bool] = []
        var boolOp: [Bool]? = []
        var boolForce: [Bool]! = []
        
        boolV <~ map["bool"]
        XCTAssertEqual(result, boolV)
        
        boolOp <~ map["bool"]
        XCTAssertEqual(result, boolOp!)
        
        boolForce <~ map["bool"]
        XCTAssertEqual(result, boolForce)
    }
    
    
    func test_array_of_bool_from_string() {
        let result = [true,false,true]
        let json: [String: [String]] = ["bool": ["t","false","TRUE"]]
        let map = AHJSONDecoder(json: json)
        var boolV: [Bool] = []
        var boolOp: [Bool]? = []
        var boolForce: [Bool]! = []
        
        boolV <~ map["bool"]
        XCTAssertEqual(result, boolV)
        
        boolOp <~ map["bool"]
        XCTAssertEqual(result, boolOp!)
        
        boolForce <~ map["bool"]
        XCTAssertEqual(result, boolForce)
    }
    
    func test_bool_from_string() {
        let json: [String: Any] = ["bool": "t"]
        let map = AHJSONDecoder(json: json)
        var boolV: Bool = false
        var boolOp: Bool? = false
        var boolForce: Bool! = false
        
        boolV <~ map["bool"]
        XCTAssertEqual(true, boolV)
        
        boolOp <~ map["bool"]
        XCTAssertEqual(true, boolOp)
        
        boolForce <~ map["bool"]
        XCTAssertEqual(true, boolForce)
    }
    
    
    func test_strings() {
        let json: [String: String] = ["string": "TEST"]
        let map = AHJSONDecoder(json: json)
        var stringV: String = ""
        var stringOp: String? = ""
        var stringForce: String! = ""
        
        stringV <~ map["string"]
        XCTAssertEqual("TEST", stringV)
        
        stringOp <~ map["string"]
        XCTAssertEqual("TEST", stringOp)
        
        stringForce <~ map["string"]
        XCTAssertEqual("TEST", stringForce)
    }
    
    
    func test_float() {
        let json: [String: Float] = ["float": 2.0]
        let map = AHJSONDecoder(json: json)
        var floatV: Float = 0.0
        var floatOp: Float? = 0.0
        var floatForce: Float! = 0.0
        
        floatV <~ map["float"]
        XCTAssertEqual(2.0, floatV)
        
        floatOp <~ map["float"]
        XCTAssertEqual(2.0, floatOp)
        
        floatForce <~ map["float"]
        XCTAssertEqual(2.0, floatForce)
    }
    
    func test_array_float() {
        let result: [Float] = [2.0,1.0]
        let json: [String: [Float]] = ["float": result]
        let map = AHJSONDecoder(json: json)
        var floatV: [Float] = []
        var floatOp: [Float]? = []
        var floatForce: [Float]! = []
        
        floatV <~ map["float"]
        XCTAssertEqual(result, floatV)
        
        floatOp <~ map["float"]
        XCTAssertEqual(result, floatOp!)
        
        floatForce <~ map["float"]
        XCTAssertEqual(result, floatForce)
    }
    
    func test_array_float_from_string() {
        let result: [Float] = [2.0,1.0]
        let json: [String: [String]] = ["float": ["2.0","1.0"]]
        let map = AHJSONDecoder(json: json)
        var floatV: [Float] = []
        var floatOp: [Float]? = []
        var floatForce: [Float]! = []
        
        floatV <~ map["float"]
        XCTAssertEqual(result, floatV)
        
        floatOp <~ map["float"]
        XCTAssertEqual(result, floatOp!)
        
        floatForce <~ map["float"]
        XCTAssertEqual(result, floatForce)
    }
    
    func test_double() {
        let json: [String: Double] = ["Double": 2.0]
        let map = AHJSONDecoder(json: json)
        var douleV: Double = 0.0
        var doubleOp: Double? = 0.0
        var doubleForce: Double! = 0.0
        
        douleV <~ map["Double"]
        XCTAssertEqual(2.0, douleV)
        
        doubleOp <~ map["Double"]
        XCTAssertEqual(2.0, doubleOp)
        
        doubleForce <~ map["Double"]
        XCTAssertEqual(2.0, doubleForce)
    }
    
    func test_array_double() {
        let result: [Double] = [2.0,1.0]
        let json: [String: [Double]] = ["float": result]
        let map = AHJSONDecoder(json: json)
        var floatV: [Double] = []
        var floatOp: [Double]? = []
        var floatForce: [Double]! = []
        
        floatV <~ map["float"]
        XCTAssertEqual(result, floatV)
        
        floatOp <~ map["float"]
        XCTAssertEqual(result, floatOp!)
        
        floatForce <~ map["float"]
        XCTAssertEqual(result, floatForce)
    }
    
    func test_array_Double_from_string() {
        let result: [Double] = [2.0,1.0]
        let json: [String: [String]] = ["float": ["2.0","1.0"]]
        let map = AHJSONDecoder(json: json)
        var floatV: [Double] = []
        var floatOp: [Double]? = []
        var floatForce: [Double]! = []
        
        floatV <~ map["float"]
        XCTAssertEqual(result, floatV)
        
        floatOp <~ map["float"]
        XCTAssertEqual(result, floatOp!)
        
        floatForce <~ map["float"]
        XCTAssertEqual(result, floatForce)
    }
    
    func test_NSString() {
        let json: [String: NSString] = ["string": "TEST"]
        let map = AHJSONDecoder(json: json)
        var stringV: String = ""
        var stringOp: String? = ""
        var stringForce: String! = ""
        
        stringV <~ map["string"]
        XCTAssertEqual("TEST", stringV)
        
        stringOp <~ map["string"]
        XCTAssertEqual("TEST", stringOp)
        
        stringForce <~ map["string"]
        XCTAssertEqual("TEST", stringForce)
    }
    
    func test_Enum_string() {
        
        enum Test: String {
            case Case1
            case Case2
            case Case3
        }
    

        let json: [String: String] = ["Enum": "Case1"]
        let map = AHJSONDecoder(json: json)
        var enumV: Test = .Case2
        var enumOp: Test? = .Case2
        var enumForce: Test! = .Case2
        
        enumV <~ map["Enum"]
        XCTAssertEqual(Test.Case1, enumV)
        
        enumOp <~ map["Enum"]
        XCTAssertEqual(Test.Case1, enumOp)
        
        enumForce <~ map["Enum"]
        XCTAssertEqual(Test.Case1, enumForce)
    }
    
    
    func test_Enum_Int() {
        
        enum Test: Int {
            case Case1
            case Case2
            case Case3
        }
        
        let json: [String: Int] = ["Enum": 0]
        let map = AHJSONDecoder(json: json)
        var enumV: Test = .Case2
        var enumOp: Test? = .Case2
        var enumForce: Test! = .Case2
        
        enumV <~ map["Enum"]
        XCTAssertEqual(Test.Case1, enumV)
        
        enumOp <~ map["Enum"]
        XCTAssertEqual(Test.Case1, enumOp)
        
        enumForce <~ map["Enum"]
        XCTAssertEqual(Test.Case1, enumForce)
    }
    
    
    
    func test_operator_support_map() {
        
        let json = ["int": 1]
        let map = AHJSONDecoder(json: json)
        var intV: String = ""
        var intOp: String? = ""
        var intForce: String! = "'"
        var intString: String = ""
        
        intV <~ map["int"].map(transform: intToString)
        XCTAssertEqual("1", intV)
        
        
        intOp <~ map["int"].map(transform: intToString)
        XCTAssertEqual("1", intOp)
        
        intForce <~ map["int"].map(transform: intToString)
        XCTAssertEqual("1", intForce)
    }
    
    private func intToString(num: Int) -> String {
        return String(num)
    }
    
    
//    func test_Enum_FromString() {
//        
//        enum Test: Int {
//            case Case1
//            case Case2
//            case Case3
//        }
//        
//        let json: [String: String] = ["Enum": "0"]
//        let map = AHJSONDecoder(json: json)
//        var enumV: Test = .Case2
//        var enumOp: Test? = .Case2
//        var enumForce: Test! = .Case2
//        
//        enumV <~ map["Enum"]
//        XCTAssertEqual(Test.Case1, enumV)
//        
//        enumOp <~ map["Enum"]
//        XCTAssertEqual(Test.Case1, enumOp)
//        
//        enumForce <~ map["Enum"]
//        XCTAssertEqual(Test.Case1, enumForce)
//    }
}
