//
//  AHObjectMapper.swift
//  Pods
//
//  Created by Alex Hmelevski on 2017-05-15.
//
//

import Foundation
import ALEither


enum AHMapError: Error {
    case general
}

struct AHSerializer {
    private let mapContext: AHJSONDecoder

    init(dictionary: [String: Any]) {
       self.mapContext = AHJSONDecoder(json: dictionary)
    }
    
    func map<T: IJSONDecodable>() -> T {
        return T(decoder: mapContext)
    }
}


public protocol IJSONDecodable {
    init(decoder: AHJSONDecoder)
}

public protocol IJSONEncodable {
    func encode(with encoder: AHJSONEncoder)
}

public protocol IJSONDefaultEncodable {
    var json: [String: Any] { get }
}

extension IJSONDefaultEncodable {
    
        var json: [String: Any] {
            return  Mirror(reflecting: self).children.reduce([:]) { (result, child : (label: String?, value: Any)) -> [String: Any] in
                var new = result
                child.label.do(work: { (str) in
                    new[str] = self.convert(child: child.value)
                })
                return new
            }
        }
    
        private func convert(child value: Any) -> Any {
            return toDictionary(child: value) ?? toArray(child: value) ?? value
        }
    
        // Tries convert any to IDictionaryConvertable and get a dictionary from it
        // Returns Optional to allow chainig
        private func toDictionary(child value: Any) -> [String: Any]? {
            return  (value as? IJSONDefaultEncodable)?.json
        }
    
        // Tries convert any to [IDictionaryConvertable] and get a array of dictionary from it
        // Returns Optional to allow chainig
        private func toArray(child value: Any) -> [[String: Any]]? {
            return (value as? [IJSONDefaultEncodable])?.map({ $0.json })
        }
    
}

public extension IJSONEncodable {
    var json: [String: Any] {
        let encoder = AHJSONEncoder()
        self.encode(with: encoder)
        return encoder.json
    }
}

public extension IJSONDecodable {
    init(json: [String: Any]) {
        self = AHSerializer(dictionary: json).map()
    }

}
