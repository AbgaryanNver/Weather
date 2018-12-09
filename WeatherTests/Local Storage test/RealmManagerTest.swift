//
//  RealmManagerTest.swift
//  WeatherTests
//
//  Created by Nver Abgaryan on 12/9/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

import UIKit
import XCTest
import RealmSwift

@testable import Weather

class RealmManagerTest: XCTestCase {

    var realmManager: RealmManager<LSCityEntity>!
    
    override func setUp() {
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = dbName
        realmManager = RealmManager<LSCityEntity>()
        XCTAssertNoThrow(try realmManager.deleteAll())
    }
    
    override func tearDown() {
        super.tearDown()
        XCTAssertNoThrow(try realmManager.deleteAll())
    }
    
    func testGetFromRealmManager() {
        XCTAssertNoThrow(try realmManager.deleteAll())
        XCTAssert(realmManager.fetchAll().isEmpty, "should return nil")
    }
    
    func testSaveInRealmManager() {
        XCTAssertNoThrow(try  realmManager.save(item: LSCityEntity()))
       
        XCTAssert(!realmManager.fetchAll().isEmpty, "should save credentials when I just saved a user")
        
    }
    private let dbName = "test database"
}


    

