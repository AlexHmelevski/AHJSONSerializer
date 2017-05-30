//
//  MapBoxTests.swift
//  AHObjectMapper
//
//  Created by Alex Hmelevski on 2017-05-17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import AHJSONSerializer


class MapBoxTests: XCTestCase {

    
    func test_mapBox_return_int() {
        let value: Int = 100
        let valueO: Int? = 100
        let newValue: Int? = MapBox(obj: value).value()
        let newValueO: Int? = MapBox(obj: valueO).value()
        
        XCTAssertEqual(value, newValue!)
        XCTAssertEqual(valueO, newValueO!)
    }
    
    func test_mapBox_return_int_dictionary() {
        let value: [String: Int] = ["Int": 100]
        let valueO: [String: Int]? = ["Int": 100]
        let newValue: [String: Int]? = MapBox(obj: value).value()
        let newValueO: [String: Int]? = MapBox(obj: valueO).value()
        
        XCTAssertEqual(value, newValue!)
        XCTAssertEqual(valueO!, newValueO!)
    }
    
    func test_mapBox_return_int_fromString() {
        let value: String = "100"
        let valueO: String? = "100"
        
        let newValue:Int? = MapBox(obj: value).value()
        let newValueO:Int? = MapBox(obj: valueO).value()
        XCTAssertEqual(100, newValue!)
        XCTAssertEqual(100, newValueO!)
    }
    
    
    func test_mapBox_return_int_dictionary_fromString() {
        let result = ["Int": 100]
        let value: [String: Any] = ["Int":"100"]
        let valueO: [String: Any]? = ["Int":"100"]
        
        let newValue:[String: Int]? = MapBox(obj: value).value()
        let newValueO:[String: Int]? = MapBox(obj: valueO).value()
        XCTAssertEqual(result, newValue!)
        XCTAssertEqual(result, newValueO!)
    }
    
    
    func test_mapBox_return_float() {
        let value: Float = 1.65
        let valueO: Float? = 1.65
        let newValue: Float? = MapBox(obj: value).value()
        let newValueO: Float? = MapBox(obj: valueO).value()
        
        XCTAssertEqual(value, newValue!)
        XCTAssertEqual(valueO, newValueO!)
    }
    
    func test_mapBox_return_float_fromString() {
        let value: String = "1.65"
        let valueO: String? = "1.65"
        
        let newValue:Float? = MapBox(obj: value).value()
        let newValueO:Float? = MapBox(obj: valueO).value()
        
        XCTAssertEqual(1.65, newValue!)
        XCTAssertEqual(1.65, newValueO!)
    }
    
    func test_mapBox_return_double() {
        let value: Double = 1.65
        let valueO: Double? = 1.65
        let newValue: Double? = MapBox(obj: value).value()
        let newValueO: Double? = MapBox(obj: valueO).value()
        
        XCTAssertEqual(value, newValue!)
        XCTAssertEqual(valueO, newValueO!)
    }
    
    func test_mapBox_return_Double_fromString() {
        let value: String = "1.65"
        let valueO: String? = "1.65"
        
        let newValue: Double? = MapBox(obj: value).value()
        let newValueO: Double? = MapBox(obj: valueO).value()
        
        XCTAssertEqual(1.65, newValue!)
        XCTAssertEqual(1.65, newValueO!)
    }
    
    func test_mapBox_return_string_fromString() {
        let value: String = "1.65"
        let valueO: String? = "1.65"
        
        let newValue: String? = MapBox(obj: value).value()
        let newValueO: String? = MapBox(obj: valueO).value()
        
        XCTAssertEqual("1.65", newValue!)
        XCTAssertEqual("1.65", newValueO!)
    }
    
    
    func test_mapBox_return_CGFloat() {
        let value: CGFloat = 1.5
        let valueO: CGFloat? = 1.5
        
        let newValue: CGFloat? = MapBox(obj: value).value()
        let newValueO: CGFloat? = MapBox(obj: valueO).value()
        
        XCTAssertEqual(value, newValue!)
        XCTAssertEqual(valueO, newValueO!)
    }
    
    
    func test_mapBox_return_CGFloat_fromString() {
        let value: String = "1.65"
        let valueO: String? = "1.65"
        
        let newValue: CGFloat? = MapBox(obj: value).value()
        let newValueO: CGFloat? = MapBox(obj: valueO).value()
        
        XCTAssertEqual(1.65, newValue!)
        XCTAssertEqual(1.65, newValueO!)
    }
    
    
    func test_mapBox_return_array_int() {
        let value: [Int] = [100,99]
        let valueO: [Int]? = [100,99]
        let newValue: [Int]? = MapBox(obj: value).value()
        let newValueO: [Int]? = MapBox(obj: valueO).value()
        
        XCTAssertEqual(value, newValue!)
        XCTAssertEqual(valueO!, newValueO!)
    }
    
    func test_mapBox_return_array_int_fromString() {
        let value: [String] = ["100","99"]
        let valueO: [String]? = ["100","99"]
        
        let newValue: [Int]? = MapBox(obj: value).value()
        let newValueO: [Int]? = MapBox(obj: valueO).value()
        XCTAssertEqual([100,99], newValue!)
        XCTAssertEqual([100,99], newValueO!)
    }
    
    func test_mapBox_return_array_float() {
        let value: [Float] = [1.65,1.64]
        let valueO: [Float]? = [1.65,1.64]
        let newValue: [Float]? = MapBox(obj: value).value()
        let newValueO: [Float]? = MapBox(obj: valueO).value()
        
        XCTAssertEqual(value, newValue!)
        XCTAssertEqual(valueO!, newValueO!)
    }

    func test_mapBox_return_float_array_fromString() {
        let value: [String] = ["1.65","1.64"]
        let valueO: [String]? = ["1.65","1.64"]
        
        let newValue: [Float]? = MapBox(obj: value).value()
        let newValueO: [Float]? = MapBox(obj: valueO).value()
        
        XCTAssertEqual([1.65,1.64], newValue!)
        XCTAssertEqual([1.65,1.64], newValueO!)
    }

    func test_mapBox_return_array_double() {
        let value: [Double] = [1.65,1.64]
        let valueO: [Double]? = [1.65,1.64]
        let newValue: [Double]? = MapBox(obj: value).value()
        let newValueO: [Double]? = MapBox(obj: valueO).value()
        
        XCTAssertEqual(value, newValue!)
        XCTAssertEqual(valueO!, newValueO!)
    }

    func test_mapBox_return_Double_array_fromString() {
        let value: [String] = ["1.65","1.64"]
        let valueO: [String]? = ["1.65","1.64"]
        
        let newValue: [Double]? = MapBox(obj: value).value()
        let newValueO: [Double]? = MapBox(obj: valueO).value()
        
        XCTAssertEqual([1.65,1.64], newValue!)
        XCTAssertEqual([1.65,1.64], newValueO!)
    }

    func test_mapBox_return_string_array_fromString() {
        let value: [String] = ["1.65","1.64"]
        let valueO: [String]? = ["1.65","1.64"]
        
        let newValue: [String]? = MapBox(obj: value).value()
        let newValueO: [String]? = MapBox(obj: valueO).value()
        
        XCTAssertEqual(["1.65","1.64"], newValue!)
        XCTAssertEqual(["1.65","1.64"], newValueO!)
    }
    
    func test_mapBox_return_array_CGFloat() {
        let value: [CGFloat] = [1.65,1.64]
        let valueO: [CGFloat]? = [1.65,1.64]
        
        let newValue: [CGFloat]? = MapBox(obj: value).value()
        let newValueO: [CGFloat]? = MapBox(obj: valueO).value()
        
        XCTAssertEqual(value, newValue!)
        XCTAssertEqual(valueO!, newValueO!)
    }
    
    func test_mapBox_return_array_CGFloat_fromString() {
        let value: [String] = ["1.65","1.64"]
        let valueO: [String]? = ["1.65","1.64"]
        
        let newValue: [CGFloat]? = MapBox(obj: value).value()
        let newValueO: [CGFloat]? = MapBox(obj: valueO).value()
        
        XCTAssertEqual([1.65,1.64], newValue!)
        XCTAssertEqual([1.65,1.64], newValueO!)
    }
    
    func test_mapBox_return_Date() {
        let value: Date = Date()
        let valueO: Date? = Date()
        
        let newValue: Date? = MapBox(obj: value).value()
        let newValueO: Date? = MapBox(obj: valueO).value()
        
        XCTAssertEqual(value, newValue!)
        XCTAssertEqual(valueO, newValueO!)
        
    }
    
    
    func test_mapBox_return_Date_from_string() {
        let value: String = "20017-05-10T10:44:00+0000"
        let valueO: String? = "20017-05-11T10:44:00+0000"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                
        let date = dateFormatter.date(from: value)
        let date2 = dateFormatter.date(from: valueO!)
        let newValue: Date? = MapBox(obj: value).value().flatMap({ (str: String) -> Date? in
            return dateFormatter.date(from: str)
        })
        
        let newValueO: Date? = MapBox(obj: valueO).value(dateFormatter: dateFormatter)
        
        XCTAssertEqual(date, newValue!)
        XCTAssertEqual(date2, newValueO!)
        
    }
    
    func test_mapBox_return_Bool() {
        let value: Bool = true
        let valueO: Bool? = false
        let newValue: Bool? = MapBox(obj: value).value()
        let newValueO: Bool? = MapBox(obj: valueO).value()
        
        XCTAssertEqual(value, newValue!)
        XCTAssertEqual(valueO!, newValueO!)
    }
    
    
    func test_mapBox_return_array_Bool() {
        let value: [Bool] = [true,false,true]
        let valueO: [Bool]? = [true,false,true]
        let newValue: [Bool]? = MapBox(obj: value).value()
        let newValueO: [Bool]? = MapBox(obj: valueO).value()
        
        XCTAssertEqual(value, newValue!)
        XCTAssertEqual(valueO!, newValueO!)
    }
    
    func test_mapBox_return_Bool_fromString() {
        let valueT: String = "true"
        let valueTO: String? = "T"
        let value1O: String? = "1"
        
        let valueF: String = "false"
        let valueFO: String? = "f"
        let value0O: String? = "0"
    
        let newValueT: Bool? = MapBox(obj: valueT).value()
        let newValueTO: Bool? = MapBox(obj: valueTO).value()
        let newValue1O: Bool? = MapBox(obj: value1O).value()
        
        let newValueF: Bool? = MapBox(obj: valueF).value()
        let newValueFO: Bool? = MapBox(obj: valueFO).value()
        let newValue0O: Bool? = MapBox(obj: value0O).value()
        
        XCTAssertEqual(true, newValueT!)
        XCTAssertEqual(true, newValueTO!)
        XCTAssertEqual(true, newValue1O!)
        
        XCTAssertEqual(false, newValueF!)
        XCTAssertEqual(false, newValueFO!)
        XCTAssertEqual(false, newValue0O!)
    }
    
    func test_raw_repressentable() {
        enum Test: String {
            case Case1
            case Case2
            case Case3
        }
        
        let string = "Case1"
        
        let new: Test? = MapBox(obj: string).value()
        
        XCTAssertEqual(Test.Case1, new!)
    }
    
    func test_dictionary_of_mappable() {
        
        let dict: [String: Any] = ["user1": UserJSON().json, "user2": UserJSON().json]
        let data = ["data": dict]
        let dataBase: DataBase? = MapBox(obj: data).value()
        let user: UserProfile? = MapBox(obj: UserJSON().json).value()
        
        
        XCTAssertEqual(dataBase?.dictionary["user1"]?.lastName, "Alex's last name")
        
        XCTAssertEqual(user!.firstName, "Alex")
        XCTAssertEqual(user!.lastName, "Alex's last name")
        
        XCTAssertEqual(user!.cars[0].brand, "Porche")
        XCTAssertEqual(user!.cars[1].name, "911")
        XCTAssertEqual(user!.cars[0].engine, .V6)
        XCTAssertEqual(user!.carBrand, "Porche")
        
    }
    
    func test_nested_mappable() {
        let user: UserProfile? = MapBox(obj: UserJSON().json).value()
    
        XCTAssertEqual(user!.firstName, "Alex")
        XCTAssertEqual(user!.lastName, "Alex's last name")
        
        XCTAssertEqual(user!.cars[0].brand, "Porche")
        XCTAssertEqual(user!.cars[1].name, "911")
        XCTAssertEqual(user!.cars[0].engine, .V6)
        XCTAssertEqual(user!.carBrand, "Porche")
    }
    
    
 
    
}
