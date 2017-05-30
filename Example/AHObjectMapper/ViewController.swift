//
//  ViewController.swift
//  AHObjectMapper
//
//  Created by AlexHmelevskiAG on 05/15/2017.
//  Copyright (c) 2017 AlexHmelevskiAG. All rights reserved.
//

import UIKit
import AHObjectMapper

struct TransformData {
    func transform(str: String)-> Date {
        return Date()
    }
}


class User: JSONDecodable,JSONEncodable {
    var username: String?
    var age: Int?
    var weight: Double!
    var array: [AnyObject]?
    var dictionary: [String : AnyObject] = [:]
    var bestFriend: User?                       // Nested User object
    var friends: [User]?                        // Array of Users
    var birthday: Date?

    
    required init(decoder: AHJSONDecoder) {
        username    <~ decoder["username"]
        age         <~ decoder["age"]
        weight      <~ decoder["weight"]
        array       <~ decoder["arr"]
        dictionary  <~ decoder["dict"]
        bestFriend  <~ decoder["best_friend"]
        friends     <~ decoder["friends"]
        birthday    <~ decoder["birthday"].map(transform: TransformData().transform)
    }
    
    func encode(with encoder: AHJSONEncoder) {
        username    ~> encoder["name"]
        age         ~> encoder["age"]
        weight      ~> encoder["weight"]
        array       ~> encoder["arr"]
        dictionary  ~> encoder["dict"]
        bestFriend  ~> encoder["best_friend"]
        friends     ~> encoder["friends"]
        birthday    ~> encoder["birthday"]
    }

}

struct Temperature: JSONDecodable {
    let celsius: Double
    let fahrenheit: Double?
    
    init(decoder: AHJSONDecoder) {
        celsius = decoder["temp_in_c"].value() ?? 0.0
        fahrenheit = decoder["temp_in_f"].value()
    }
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

