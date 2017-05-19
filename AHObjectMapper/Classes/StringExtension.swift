//
//  StringExtension.swift
//  Pods
//
//  Created by Alex Hmelevski on 2017-05-19.
//
//

import Foundation

extension String {
    subscript(separator: String) -> (before: String, after: String) {
      return  separate(by: separator).enumerated().reduce(("",""), reduce)
    }
    
    private func reduce(partial: (String,String), element :(offset: Int, str: String)) -> (String,String) {
        if element.offset == 0 {
            return (element.str, "")
        }
        
        return (partial.0,partial.1 + element.str)
    }
    
    private func separate(by separator: String) -> [String] {
       return range(of: separator).map({ [substring(to: $0.lowerBound),
                                          substring(from: $0.upperBound)] })
                                  ?? [self]
    }
    
}
