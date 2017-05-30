//
//  AHJSONEncoder.swift
//  Pods
//
//  Created by Alex Hmelevski on 2017-05-23.
//
//

import Foundation

public final class AHJSONEncoder {
    private var key: String? 
    private(set) var json: [String: Any] = [:]

    public subscript(key: String) -> AHJSONEncoderContext {
        return AHJSONEncoderContext.init(scope: { (value) in

        let b = CastBox<JSONEncodable>(obj: value).operation(work: { self.set(value: $0, for: key) }) ??
                CastBox<[JSONEncodable]>(obj: value).operation(work: { self.set(value: $0, for: key) }) ??
                CastBox<[String: JSONEncodable]>(obj: value).operation(work: { self.set(value: $0, for: key) }) ??
                { self.json[key] = value }
            
            
            b()
        })
    }
    
    private func set(value: JSONEncodable, for key: String) {
        self.json[key] = value.json
    }
    
    private func set(value: [JSONEncodable], for key: String) {
        self.json[key] = value.map({ $0.json })
    }
    
    private func set(value: [String: JSONEncodable], for key: String) {
        self.json[key] = value.reduce([String: [String: Any]](), mapDictionary)
    }
    
    private func set<T>(value: T, for key: String) {
        self.json[key] = value
    }
    
    private func mapDictionary(result: [String: Any], element: (key: String, value: JSONEncodable)) -> [String: Any] {
        var newD = result
        newD[element.key] = element.value.json
        return newD
    }
    

}


public struct AHJSONEncoderContext {
    
    private let scope: (Any) ->()
    private var currentValue: ((Any) -> Any)?
    
    init(scope: @escaping (Any) ->(), currentValue: ((Any) -> Any)? = nil) {
        self.scope = scope
        self.currentValue = currentValue
    }
    
    
    public func set<T>(value: T?) {
        value.do(work: { self.scope(self.currentValue?($0) ?? $0) })
    }
    
    func map<T, U>(transform: @escaping (T) -> U) -> AHJSONEncoderContext {
        return AHJSONEncoderContext(scope: self.scope, currentValue: { (obj) -> Any in
            return (self.value(from: obj).map(transform) ?? obj) as Any
        })
    }
    
    private func value<T>(from object: Any) -> T? {
       return (self.currentValue?(object) as? T) ?? object as? T
    }

}
