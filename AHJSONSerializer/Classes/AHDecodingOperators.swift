//
//  AHMappingOperators.swift
//  Pods
//
//  Created by Alex Hmelevski on 2017-05-16.
//
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

import Foundation


//@TODO: Find a way to reduce the number of functions

precedencegroup MultiplicationPrecedence {
    associativity: right
    higherThan: AdditionPrecedence
}

infix operator <~ : MultiplicationPrecedence

public func <~ <T>(property: inout T, map: AHJSONDecoder) {
   
    if let value: T = map.value() {
        property = value
    }
}

public func <~ <T>(property: inout [T], map: AHJSONDecoder) {
    if let value: [T] = map.value() {
        property = value
    }
}


// ========= StringConvertable operators  =========

public func <~ <T: StringConvertable>(property: inout T, map: AHJSONDecoder) {
    if let value: T = map.value() {
        property = value
    }
}

public func <~ <T: StringConvertable>(property: inout T?, map: AHJSONDecoder) {
    if let value: T = map.value() {
        property = value
    }
}

public func <~ <T: StringConvertable>(property: inout T!, map: AHJSONDecoder) {
    if let value: T = map.value() {
        property = value
    }
}

public func <~ <T: StringConvertable>(property: inout [T], map: AHJSONDecoder) {
    if let value: [T] = map.value() {
        property = value
    }
}

public func <~ <T: StringConvertable>(property: inout [T]?, map: AHJSONDecoder) {
    if let value: [T] = map.value() {
        property = value
    }
}

public func <~ <T: StringConvertable>(property: inout [T]!, map: AHJSONDecoder) {
    if let value: [T] = map.value() {
        property = value
    }
}

public func <~ <T: StringConvertable>(property: inout [String: T], map: AHJSONDecoder) {
    if let value: [String: T] = map.value() {
        property = value
    }
}

public func <~ <T: StringConvertable>(property: inout [String: T]?, map: AHJSONDecoder) {
    if let value: [String: T] = map.value() {
        property = value
    }
}

public func <~ <T: StringConvertable>(property: inout [String: T]!, map: AHJSONDecoder) {
    if let value: [String: T] = map.value() {
        property = value
    }
}


// ========= RawRepresentable operators  =========

public func <~ <T: RawRepresentable>(property: inout T, map: AHJSONDecoder) {
    if let value: T = map.value() {
        property = value
    }
}

public func <~ <T: RawRepresentable>(property: inout T?, map: AHJSONDecoder) {
    if let value: T = map.value() {
        property = value
    }
}

public func <~ <T: RawRepresentable>(property: inout T!, map: AHJSONDecoder) {
    if let value: T = map.value() {
        property = value
    }
}

public func <~ <T: RawRepresentable>(property: inout [T], map: AHJSONDecoder) {
    if let value: [T] = map.value() {
        property = value
    }
}

public func <~ <T: RawRepresentable>(property: inout [T]?, map: AHJSONDecoder) {
    if let value: [T] = map.value() {
        property = value
    }
}

public func <~ <T: RawRepresentable>(property: inout [T]!, map: AHJSONDecoder) {
    if let value: [T] = map.value() {
        property = value
    }
}


// ========= JSONDecodable operators  =========

public func <~ <T: JSONDecodable>(property: inout T, map: AHJSONDecoder) {
    if let value: T = map.value() {
        property = value
    }
}

public func <~ <T: JSONDecodable>(property: inout T?, map: AHJSONDecoder) {
    property = map.value()
}

public func <~ <T: JSONDecodable>(property: inout T!, map: AHJSONDecoder) {
    if let value: T = map.value() {
        property = value
    }
}

public func <~ <T: JSONDecodable>(property: inout [T], map: AHJSONDecoder) {
    if let value: [T] = map.value() {
        property = value
    }
}

public func <~ <T: JSONDecodable>(property: inout [T]?, map: AHJSONDecoder) {
    if let value: [T] = map.value() {
        property = value
    }
}

public func <~ <T: JSONDecodable>(property: inout [T]!, map: AHJSONDecoder) {
    if let value: [T] = map.value() {
        property = value
    }
}


public func <~ <T: JSONDecodable>(property: inout [String: T], map: AHJSONDecoder) {
    if let value: [String: T] = map.value() {
        property = value
    }
}

public func <~ <T: JSONDecodable>(property: inout [String: T]?, map: AHJSONDecoder) {
    if let value: [String: T] = map.value() {
        property = value
    }
}

public func <~ <T: JSONDecodable>(property: inout [String: T]!, map: AHJSONDecoder) {
    if let value: [String: T] = map.value() {
        property = value
    }
}

