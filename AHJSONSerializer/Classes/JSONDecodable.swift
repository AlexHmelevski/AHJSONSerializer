//
//  JSONDecodable.swift
//  Pods
//
//  Created by Alex Hmelevski on 2017-05-29.
//
//

import Foundation

public protocol JSONDecodable {
    init(decoder: AHJSONDecoder)
}

public extension JSONDecodable {
    init(json: [String: Any]) {
        self = AHJSONSerializer(dictionary: json).map()
    }
    
}
