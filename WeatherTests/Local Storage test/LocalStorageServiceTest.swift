//
//  LocalStorageServiceTest.swift
//  WeatherTests
//
//  Created by Nver Abgaryan on 12/9/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

import UIKit
import XCTest
import RealmSwift

@testable import Weather

class LocalStorageServiceTest: XCTestCase {
    let databaseService = LocalStorageService()
    
    override func setUp() {
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = dbName
        databaseService.deleteAll()
    }
    
    override func tearDown() {
        super.tearDown()
        databaseService.deleteAll()
    }
    
    func testQueryCities() {
        databaseService.deleteAll()
        databaseService.queryCities { (cities) in
            XCTAssert(cities == nil, "should return nil")
        }
    }
    
    func testQueryCitiesWithSearchText() {
        databaseService.deleteAll()
        var obj = CityPlainEntity()
        obj.name = "test"
        let searchTextTrue = "t" 
        let searchTextFalse = "p"
        databaseService.save(cities: [obj])
        databaseService.queryCities(searchText: searchTextTrue) { (cities) in
            XCTAssert(cities != nil, "should not return nil")
        }
        
        databaseService.queryCities(searchText: searchTextFalse) { (cities) in
            XCTAssert(cities == nil, "should return nil")
        }
    
    }
    
    func testSave() {
        databaseService.deleteAll()
        databaseService.save(cities: [CityPlainEntity()])
        databaseService.queryCities { (cities) in
            XCTAssert(cities != nil, "should not return nil")

        }
    }

    
    private let dbName = "test database"

}
