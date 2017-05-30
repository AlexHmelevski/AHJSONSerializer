//
//  AHMapContext.swift
//  Pods
//
//  Created by Alex Hmelevski on 2017-05-19.
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

public struct AHJSONDecoder {
    let context: [String: Any]
    private(set) var box: MapBox?
    
    public init(json: [String: Any]) {
        context = json
    }
    
    init(from decoder: AHJSONDecoder, with value: Any?) {
        context = decoder.context
        self.box = MapBox(obj: value)
    }
    
    public subscript(key: String) -> AHJSONDecoder {
        let str = key["."]
        
        if !str.after.isEmpty {
            let newJson = context[str.before] as? [String: Any] ?? [:]
            return AHJSONDecoder(json: newJson)[str.after]
        } else {
            return AHJSONDecoder(from: self, with: context[str.before])
        }
    }
    
    public func value<T>() -> T? {
        return box?.value()
    }
    
    public func map<T,U>(transform: (T)->U) -> AHJSONDecoder {
        if let val: T = box?.value() {
            return AHJSONDecoder(from: self, with: transform(val))
        } else {
            return self
        }
    }
}

// MARK: JSONDecodable methods

extension AHJSONDecoder {
    public func value<T: JSONDecodable>() -> T? {
        return box?.value()
    }
    
    public func value<T: JSONDecodable>() -> [T]? {
        return box?.value()
    }
    
    public func value<T: JSONDecodable>() -> [String: T]? {
        return box?.value()
    }
    
    public func value<T: JSONDecodable>() -> [String: [T]]? {
        return box?.value()
    }
}


// MARK: RawRepresentable methods
extension AHJSONDecoder {
    
    public func value<T: RawRepresentable>() -> T? {
        return box?.value()
    }
    
    public func value<T: RawRepresentable>() -> [T]? {
        return box?.value()
    }
    
    public func value<T: RawRepresentable>() -> [String: T]? {
        return box?.value()
    }
    
    public func value<T: RawRepresentable>() -> [String: [T]]? {
        return box?.value()
    }
}

extension AHJSONDecoder {
    
    public func value<T: StringConvertable>() -> T? {
        return box?.value()
    }
    
    public func value<T: StringConvertable>() -> [T]? {
        return box?.value()
    }
    
    public func value<T: StringConvertable>() -> [String: T]? {
        return box?.value()
    }
    
    public func value<T: StringConvertable>() -> [String: [T]]? {
        return box?.value()
    }
    
}
