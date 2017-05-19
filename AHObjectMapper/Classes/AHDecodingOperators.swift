//
//  AHMappingOperators.swift
//  Pods
//
//  Created by Alex Hmelevski on 2017-05-16.
//
//

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


// ========= IJSONDecodable operators  =========

public func <~ <T: IJSONDecodable>(property: inout T, map: AHJSONDecoder) {
    if let value: T = map.value() {
        property = value
    }
}

public func <~ <T: IJSONDecodable>(property: inout T?, map: AHJSONDecoder) {
    property = map.value()
}

public func <~ <T: IJSONDecodable>(property: inout T!, map: AHJSONDecoder) {
    if let value: T = map.value() {
        property = value
    }
}

public func <~ <T: IJSONDecodable>(property: inout [T], map: AHJSONDecoder) {
    if let value: [T] = map.value() {
        property = value
    }
}

public func <~ <T: IJSONDecodable>(property: inout [T]?, map: AHJSONDecoder) {
    if let value: [T] = map.value() {
        property = value
    }
}

public func <~ <T: IJSONDecodable>(property: inout [T]!, map: AHJSONDecoder) {
    if let value: [T] = map.value() {
        property = value
    }
}


public func <~ <T: IJSONDecodable>(property: inout [String: T], map: AHJSONDecoder) {
    if let value: [String: T] = map.value() {
        property = value
    }
}

public func <~ <T: IJSONDecodable>(property: inout [String: T]?, map: AHJSONDecoder) {
    if let value: [String: T] = map.value() {
        property = value
    }
}

public func <~ <T: IJSONDecodable>(property: inout [String: T]!, map: AHJSONDecoder) {
    if let value: [String: T] = map.value() {
        property = value
    }
}

