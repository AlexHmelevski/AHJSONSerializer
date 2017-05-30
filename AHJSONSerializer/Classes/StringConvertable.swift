//
//  StringConvertable.swift
//  Pods
//
//  Created by Alex Hmelevski on 2017-05-24.
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
