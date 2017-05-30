//
//  StringExtension.swift
//  Pods
//
//  Created by Alex Hmelevski on 2017-05-19.
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
