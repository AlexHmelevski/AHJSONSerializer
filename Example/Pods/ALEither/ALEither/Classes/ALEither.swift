//
//  ALEither.swift
//  Pods
//
//  Created by Alex Hmelevski on 2017-04-05.
//
//

import Foundation


public enum ALEither<R, E> {

    case right(value: R)
    case wrong(value: E)
    
    public init(value: R) {
        self = .right(value: value)
    }
    
    public init(wrong: E) {
        self = .wrong(value: wrong)
    }
    
    public init?(value: R?, error: E?) {
        if let e = error {
            self = .wrong(value: e)
            return
        }
        
        if let v = value {
            self = .right(value: v)
            return
        }
        return nil
    }
    
    // MARK: FUNCTIONAL
    
    /// Map function calls transfrom function on value if it Right, if wrong returns
    /// current state
    /// - Parameter transform: function to apply
    /// - Returns: ALEither<U, E>
    public func map<U>(transform: (R) -> U) -> ALEither<U, E> {
        switch self {
            case .right(let val): return .right(value: transform(val))
            case .wrong(let err): return .wrong(value: err)
        }
    }
    
    /// Conditional function, returns Either with valid value according to predicate block
    /// If predicate false - returns nil
    /// - Parameter predicate: Predicate
    /// - Returns: ALEither<R, E>?
    
    public func take(if predicate: (R) -> Bool) -> ALEither<R, E>? {
        switch self {
            case .right(let val): return predicate(val) ? self : nil
            case .wrong: return self
        }
    }
    
    /// Conditional check for Either returns current state if predicate true or default value
    ///
    /// - Parameters:
    ///   - predicate: (Right) -> Bool
    ///   - default: Default value
    /// - Returns: ALEither<R, E>
    
    public func take(if predicate: (R) -> Bool, default: R) -> ALEither<R, E> {
        switch self {
            case .right(let val): return predicate(val) ? self : .right(value: `default`)
            case .wrong: return self
        }
    }
    
    /// Conditional check for Either returns current state if predicate true or an error value
    ///
    /// - Parameters:
    ///   - predicate: (Right) -> Bool
    ///   - default: Default error
    /// - Returns: ALEither<R, E>
    public func takeIf(predicate: (R) -> Bool, wrong: E) -> ALEither<R, E> {
        switch self {
            case .right(let val): return predicate(val) ? self : .wrong(value: wrong)
            case .wrong: return self
        }
    }
    
    public func flatMap<U>(f: (R) -> ALEither<U, E>) -> ALEither<U, E> {
        switch self {
            case .right(let val): return  f(val)
            case .wrong(let err): return .wrong(value: err)
        }
    }
    
    /// Peform work on a chosen thread(asynchtroniously) when a value is available
    ///
    /// - Parameters:
    ///   - work: block of work with value
    /// - Returns: unmodified ALEither
    @discardableResult
    public func `do`(work:  @escaping (R) -> Void) -> ALEither<R, E> {
        if case .right(let val) = self {
            work(val)
        }
        return self
    }
    
    /// doIfWrong function allows to perform some work if the result is wrong,
    ///
    /// - Parameter work: Block of work with error
    /// - Returns: ALEither<R, E>
    @discardableResult
    public func doIfWrong(work: @escaping  (E) -> Void) -> ALEither<R, E> {
        if case .wrong(let err) = self {
            work(err)
            
        }
        return self
    }
    
    /// doIfWrong function allows to perform some work if the result is wrong,
    /// Does additional check for error types
    /// - Parameter work: Block of work with error
    /// - Returns: ALEither<R, E>
    @discardableResult
    public func doIfWrong<U>(of type: U.Type, work: (U) -> Void) -> ALEither<R, E> {
        if case .wrong(let err) = self {
            if let e = err as? U {
                work(e)
            }
            
        }
        return self
    }
    
    /// doIfWrong function allows to perform some work if the result is wrong,
    ///
    /// - Parameter work: Block of work with error
    /// - Returns: ALEither<R, E>
    @discardableResult
    public func doIfWrong(if predicate: (E) -> Bool, work: (E) -> Void) -> ALEither<R, E> {
        if case .wrong(let err) = self {
            work(err)
        }
        return self
    }
    
    public func fork(right: ((R)->Void)?, wrong: ((E) -> Void)?) {
        switch self {
            case let .right(val): right?(val)
            case let .wrong(val): wrong?(val)
        }
    }
    
    /// Allows to provide default value in case of error
    ///
    /// - Parameter value: Default value
    /// - Returns: ALEither<Right>
    public func drive(value: R) -> ALEither<R, E> {
        if case .wrong = self {
            return .right(value: value)
        }
        return self
    }
    
    public func recover<T,U>(transformR: (R) -> ALEither<T,U>,
                           transformL: (E) -> ALEither<T,U>) -> ALEither<T,U> {
        switch self {
            case let .right(val): return transformR(val)
            case let .wrong(er): return transformL(er)
        }
      
    }
    
 
    

}
