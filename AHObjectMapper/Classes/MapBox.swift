//
//  Box.swift
//  Pods
//
//  Created by Alex Hmelevski on 2017-05-16.
//
//

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

//===== IJSONDecodable types ====

extension MapBox {
    
    func value<T: IJSONDecodable>() -> T? {
        return (currentValue as? [String : Any]).flatMap(transform)
    }
    
    func value<T: IJSONDecodable>() -> [T]? {
        return (currentValue as? [[String : Any]]).flatMap(transform)
    }
    
    func value<T: IJSONDecodable>() -> [String: T]? {
       return (currentValue as? [String : Any]).flatMap(transform)
                                               ?? currentValue as? [String : T]
    }
    
    private func transform<T: IJSONDecodable>(dict: [String: Any]) -> T {
        return T.init(json: dict)
    }
    
    private func transform<T: IJSONDecodable>(array: [[String: Any]]) -> [T] {
        return array.flatMap(transform)
    }
    
    private func transform<T: IJSONDecodable>(dict: [String: Any]) -> [String: T] {
        return dict.reduce([:], reduce)
    }
    
    
    private func reduce<T: IJSONDecodable>(partial: [String: T], element: (key: String, value: Any)) -> [String : T] {
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

