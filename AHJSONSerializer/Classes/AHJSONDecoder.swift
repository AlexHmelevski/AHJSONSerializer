//
//  AHMapContext.swift
//  Pods
//
//  Created by Alex Hmelevski on 2017-05-19.
//
//

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
