//
//  Box.swift
//  Pods
//
//  Created by Alex Hmelevski on 2017-05-16.
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
import ALEither


struct MapBox{
    fileprivate let currentValue: Any?
    
    init(obj: Any?) {
        currentValue = obj
    }
    
    func value<T>() -> T? {
    
        return currentValue as? T
    }
    
    func map<T,U>(transform: (T) -> U) -> U? {
        guard let new: T? = value() else  {
           return nil
        }
        
        return new.map(transform)
    }
}

// ===== RawRepresentable ======

extension MapBox {
    
    func value<T: RawRepresentable>() -> T? {
        return (currentValue as? T.RawValue).flatMap({ T.init(rawValue: $0) })
    }
    
    func value(dateFormatter formatter: DateFormatter = DateFormatter()) -> Date? {
        return (currentValue as? String).flatMap({ formatter.date(from: $0) }) ??
            currentValue as? Date
    }
}

//===== JSONDecodable types ====

extension MapBox {
    
    fileprivate func transformTo<T: JSONDecodable>(from box: CastBox<[String : Any]>) -> T? {
        return box.casted.map(transform)
    }
    
    func value<T: JSONDecodable>() -> T? {
        return (currentValue as? [String : Any]).flatMap(transform)
    }
    
    func value<T: JSONDecodable>() -> [T]? {
        return (currentValue as? [[String : Any]]).flatMap(transform)
    }
    
    func value<T: JSONDecodable>() -> [String: T]? {
       return (currentValue as? [String : Any]).flatMap(transform)
                                               ?? currentValue as? [String : T]
    }
    
    private func transform<T: JSONDecodable>(dict: [String: Any]) -> T {
        return T.init(json: dict)
    }
    
    private func transform<T: JSONDecodable>(array: [[String: Any]]) -> [T] {
        return array.flatMap(transform)
    }
    
    private func transform<T: JSONDecodable>(dict: [String: Any]) -> [String: T] {
        return dict.reduce([:], reduce)
    }
    
    
    private func reduce<T: JSONDecodable>(partial: [String: T], element: (key: String, value: Any)) -> [String : T] {
        var newPartial = partial
        
        let newElement = (element.value as? [String: Any]).map(T.init) ?? element.value as? T
        newElement.do(work: { newPartial[element.key] = $0 })
        return newPartial
    }
}


//===== String Convertable types 

extension MapBox {
    
    func value<T: StringConvertable>() -> T? {
        return (currentValue as? String).flatMap(transform)
            ?? currentValue as? T
    }
    
    func value<T: StringConvertable>() -> [T]? {
        return (currentValue as? [String]).flatMap(transform)
            ?? currentValue as? [T]
    }
    
    func value<T: StringConvertable>() -> [String: T]? {
        return (currentValue as? [String : Any]).flatMap(transform)
            ?? currentValue as? [String : T]
    }
    
    private func transform<T: StringConvertable>(dict: [String: Any]) -> [String: T] {
        return dict.reduce([:], reduce)
    }
    
    private func transform<T: StringConvertable>(string: String) -> T? {
        return T.init(string)
    }
    
    private func transform<T: StringConvertable>(array: [String]) -> [T]? {
        return array.flatMap(transform)
    }
    
    private func reduce<T: StringConvertable>(partial: [String: T], element: (key: String, value: Any)) -> [String : T] {
        var newPartial = partial
        
        let newElement = (element.value as? String).map(T.init) ?? element.value as? T
        newElement.do(work: { newPartial[element.key] = $0 })
        return newPartial
    }
}

