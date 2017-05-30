//
//  CastBox.swift
//  Pods
//
//  Created by Alex Hmelevski on 2017-05-29.
//
//

import Foundation

/// Class helper, can be initialized with Any
/// works like a maybe monad: If cast to generic type is succesfull then operation will be performed

struct CastBox<T> {
    typealias VoidClosure = () -> Void
    typealias WorkClosure = (T) -> Void
    
    private let obj: Any
    
    init(obj: Any) {
        self.obj = obj
    }
    
    func operation(work: @escaping (WorkClosure)) -> VoidClosure? {
        return (casted).map({ (val) in { work(val) } })
    }
    
    var casted: T? {
        return obj as? T
    }
}
