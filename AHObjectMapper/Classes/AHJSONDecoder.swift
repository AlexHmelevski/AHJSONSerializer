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
    
    init(from map: AHJSONDecoder, with value: Any?) {
        context = map.context
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
    
    public func value<T: IJSONDecodable>() -> T? {
        return box?.value()
    }
    
    public func value<T: IJSONDecodable>() -> [T]? {
        return box?.value()
    }
    
    public func value<T: IJSONDecodable>() -> [String: T]? {
        return box?.value()
    }
    
    public func value<T: RawRepresentable>() -> T? {
        return box?.value()
    }
    
    public func value<T: RawRepresentable>() -> [T]? {
        return box?.value()
    }
    
    public func value<T: RawRepresentable>() -> [String: T]? {
        return box?.value()
    }
    
    public func value<T: StringConvertable>() -> T? {
        return box?.value()
    }
    
    public func value<T: StringConvertable>() -> [T]? {
        return box?.value()
    }
    
    public func value<T: StringConvertable>() -> [String: T]? {
        return box?.value()
    }
}
