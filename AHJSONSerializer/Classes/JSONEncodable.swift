//
//  JSONEncodable.swift
//  Pods
//
//  Created by Alex Hmelevski on 2017-05-29.
//
//

import Foundation


public protocol JSONEncodable {
    func encode(with encoder: AHJSONEncoder)
}


public extension JSONEncodable {
    var json: [String: Any] {
        let encoder = AHJSONEncoder()
        self.encode(with: encoder)
        return encoder.json
    }
}
