//
//  AHObjectMapper.swift
//  Pods
//
//  Created by Alex Hmelevski on 2017-05-15.
//
//

import Foundation
import ALEither

struct AHJSONSerializer {
    private let mapContext: AHJSONDecoder

    init(dictionary: [String: Any]) {
       self.mapContext = AHJSONDecoder(json: dictionary)
    }
    
    func map<T: JSONDecodable>() -> T {
        return T(decoder: mapContext)
    }
}




