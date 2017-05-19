//
//  AHEncodingOperators.swift
//  Pods
//
//  Created by Alex Hmelevski on 2017-05-23.
//
//

import Foundation

precedencegroup MultiplicationPrecedence {
    associativity: right
    lowerThan: AdditionPrecedence
}

infix operator ~>

public func ~> <T>(property: T, context: AHJSONEncoderContext) {
    context.set(value: property)
}

public func ~> <T>(property: T?, context: AHJSONEncoderContext) {
    property.do(work: context.set)
}
