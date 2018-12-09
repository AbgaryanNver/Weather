//
//  LocalStorageService.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/8/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

import RealmSwift

class LocalStorageService : LocalStorageServiceProtocol {
    
    func queryCities(completion: @escaping (Array<CityPlainEntity>?) -> Void) {
        let dbManager = RealmManager<LSCityEntity>()
        let dbCities = dbManager.fetchAll()
        let plainCities = convertToPlainCity(dbCities: dbCities)
        completion(plainCities)
    }
    
    func queryCities(searchText: String, completion: @escaping (Array<CityPlainEntity>?) -> Void) {
        let dbManager = RealmManager<LSCityEntity>()
        var dbCities = Array<LSCityEntity>()
        if !searchText.isEmpty {
            dbCities = dbManager.fetch(predicate: NSPredicate(format: "name contains[c] %@", searchText))
        } else {
            dbCities = dbManager.fetchAll()
        }
        let plainCities = convertToPlainCity(dbCities: dbCities)
        completion(plainCities)
    }
    
    func save(cities: Array<CityPlainEntity>) {
        let dbManager = RealmManager<LSCityEntity>()
        if let dbCities = convertToDBCities(plainCities: cities) {
            do {
                try dbManager.save(items: dbCities)
            } catch {}
        }
    }
    
    func deleteAll() {
        let dbManager = RealmManager<LSCityEntity>()
        do {
            try dbManager.deleteAll()
        } catch {}
    }
    
}

//Convertations
extension LocalStorageService {
    
    fileprivate func convertToPlainCity(dbCities: Array<LSCityEntity>) -> Array<CityPlainEntity>? {
        if dbCities.isEmpty {
            return nil
        }
        var plainCities = Array<CityPlainEntity>()
        for city in dbCities {
            var plainObj = CityPlainEntity()
            plainObj.id = city.id
            plainObj.name = city.name
            plainObj.currentTemp = city.currentTemp
            plainObj.maxTemp = city.maxTemp
            plainObj.minTemp = city.minTemp
            plainObj.humidity = city.humidity
            plainObj.weatherType = city.weatherType
            plainCities.append(plainObj)
        }
        return plainCities
    }
    
    fileprivate func convertToDBCities(plainCities: Array<CityPlainEntity>?) -> Array<LSCityEntity>? {
        guard let cities = plainCities else {
            return nil
        }
        var dbCities = Array<LSCityEntity>()
        for city in cities {
            let dbCity = LSCityEntity()
            dbCity.id = city.id
            dbCity.name = city.name
            dbCity.currentTemp = city.currentTemp
            dbCity.minTemp = city.minTemp
            dbCity.maxTemp = city.maxTemp
            dbCity.humidity = city.humidity
            dbCity.weatherType = city.weatherType
            dbCities.append(dbCity)
        }
        return dbCities
    }
}
