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

    subscript(key: String) -> AHJSONEncoderContext {
       return AHJSONEncoderContext { (value) in
            if let v = value as? IJSONEncodable {
                self.json[key] = v.json
            } else if let v = value as? [IJSONEncodable] {
                self.json[key] = v.map({$0.json})
            } else {
                self.json[key] = value
            }
        }
    }
}


public struct AHJSONEncoderContext {
    
    private let scope: (Any) ->()
    private var currentValue: Any?
    
    init(scope: @escaping (Any) ->()) {
        self.scope = scope
    }
    
    func set<T>(value: T?) {
        value.do(work: scope)
    }

}
