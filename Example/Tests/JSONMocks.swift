//
//  JSONMocks.swift
//  AHObjectMapper
//
//  Created by Alex Hmelevski on 2017-05-25.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation


struct CarJSON {
    let json: [String: Any] = ["name"   : "911",
                               "brand"  : "Porche",
                               "Engine" : "V6"]
}

struct UserJSON {
    let json: [String: Any] = ["firstName"  : "Alex",
                               "lastName"   : "Alex's last name",
                               "Cars"       : [CarJSON().json,CarJSON().json],
                               "Car"        : CarJSON().json]
    
}
