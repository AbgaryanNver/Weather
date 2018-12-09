//
//  CityPlainEntityTest.swift
//  WeatherTests
//
//  Created by Nver Abgaryan on 12/9/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

import UIKit
import UIKit
import XCTest
@testable import Weather

class CityPlainEntityTest: XCTestCase {
    var entity : CityPlainEntity = CityPlainEntity()
    
    func testThatEntityCanHaveId() {
        let id = 1
        entity.id = id
        XCTAssertEqual(entity.id, id, "the user should keep the id assigned")
    }
    
    func testThatEntityCanHaveName() {
        let name = "testName"
        entity.name = name
        XCTAssertEqual(entity.name, name, "the user should keep the name assigned")
    }
    
    func testThatEntityCanHaveTemp() {
        let currentTemp: Double = 1.0
        let minTemp: Double = 2.0
        let maxTemp: Double = 3.0
        entity.currentTemp = currentTemp
        entity.minTemp = minTemp
        entity.maxTemp = maxTemp
        XCTAssertEqual(entity.currentTemp, currentTemp, "the user should keep currentTemp assigned")
        XCTAssertEqual(entity.minTemp, minTemp, "the user should keep minTemp assigned")
        XCTAssertEqual(entity.maxTemp, maxTemp, "the user should maxTemp theemp assigned")
    }
    
    func testThatEntityCanHaveHumidity() {
        let humidity: Double = 10.0
        entity.humidity = humidity
        XCTAssertEqual(entity.humidity, humidity, "the user should keep the humidity assigned")
    }

    func testThatEntityCanHaveWeatherDescription() {
        let weatherDescription = "testWeatherDescription"
        entity.weatherDescription = weatherDescription
        XCTAssertEqual(entity.weatherDescription, weatherDescription, "the user should keep the weatherDescription assigned")
    }
}



