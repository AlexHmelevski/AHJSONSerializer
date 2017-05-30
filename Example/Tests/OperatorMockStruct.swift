//
//  MockStructs.swift
//  AHJSONSerializer
//
//  Created by Alex Hmelevski on 2017-05-19.
//  Copyright © 2017 CocoaPods. All rights reserved.
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
@testable import AHJSONSerializer

struct User: JSONDecodable, JSONEncodable {
    private(set) var firstName: String = ""
    private(set) var lastName: String = ""
    private(set) var car: Car?
    private(set) var cars: [Car] = []
    private(set) var carBrand : String = ""
    
    init(decoder: AHJSONDecoder) {
        firstName  <~ decoder["firstName"]
        lastName <~ decoder["lastName"]
        car <~ decoder["Car"]
        cars <~ decoder["Cars"]
        carBrand <~ decoder["Car.brand"]
    }
    
    func encode(with encoder: AHJSONEncoder) {
        firstName ~> encoder["firstName"]
        lastName ~> encoder["lastName"]
        car ~> encoder["Car"]
        cars ~> encoder["Cars"]
    }
    private func uppercased(str: String) -> String {
        return str.uppercased()
    }
}

struct Car: JSONDecodable {
    private(set) var carName: String = ""
    private(set) var carBrand: String = ""
    private(set) var engine: Engine = .noEngine
    
    init(carName: String = "", carBrand: String = "") {
        self.carName = carName
        self.carBrand = carBrand
    }
    
    init(decoder: AHJSONDecoder) {
        carName <~ decoder["name"]
        carBrand <~ decoder["brand"]
        engine <~ decoder["Engine"]
    }
}

struct Result<T:JSONDecodable & JSONEncodable>: JSONDecodable,JSONEncodable {
    private(set) var result: T?
    
    init(decoder: AHJSONDecoder) {
        result <~ decoder["result"]
    }
    func encode(with encoder: AHJSONEncoder) {
        result ~> encoder["result"]
    }
    
}


enum Engine: String {
    case V6
    case V8
    case noEngine
}
