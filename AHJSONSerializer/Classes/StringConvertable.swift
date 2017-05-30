//
//  StringConvertable.swift
//  Pods
//
//  Created by Alex Hmelevski on 2017-05-24.
//
//

import Foundation



public protocol StringConvertable {
    init?(_ text: String)
}


public protocol RadixStringConvertable: StringConvertable {
    init?(_ text: String, radix: Int)
}

extension RadixStringConvertable {
    public init?(_ text: String) {
        self.init(text, radix:10)
    }
}

extension Double:   StringConvertable {}
extension Float:    StringConvertable {}

extension Int:      RadixStringConvertable {}
extension UInt8:    RadixStringConvertable {}
extension UInt16:   RadixStringConvertable {}
extension UInt32:   RadixStringConvertable {}


extension CGFloat: StringConvertable {
    public init?(_ text: String) {
        if let f = Double.init(text) {
            self = CGFloat(f)
        } else {
            return nil
        }
        
    }
}

extension Bool:    StringConvertable {
    public init?(_ text: String) {
        switch text.lowercased() {
        case "true","t","1": self = true
        case "false","f","0": self = false
        default: return nil
        }
    }
    
}
