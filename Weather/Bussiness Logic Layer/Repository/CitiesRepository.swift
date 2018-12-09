//
//  CitiesRepository.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/8/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

import Foundation

class CitiesRepository : CititesRepositoryProtocol {

    var networkService : RemoteServiceProtocol!
    var databaseService : LocalStorageServiceProtocol!
    
    func obtainCities(completion: @escaping (Array<CityPlainEntity>?) -> Void) {
        
        databaseService.queryCities {[unowned self]  plainCities in
            if let cities = plainCities, cities.count > 0 {
                completion(cities)
            } else {
                self.networkService.fetchCities(completion: { [unowned self]  (cities, error) in
                    if let cities = cities, cities.count > 0 {
                        self.databaseService.save(cities: cities)
                        self.databaseService.queryCities(completion: { (cities) in
                            completion(cities)
                        })
                    } else {
                        completion(nil)
                    }
                })
            }
        }
    }
    
    func obtainCities(searchText: String, completion: @escaping (Array<CityPlainEntity>?) -> Void) {
        databaseService.queryCities(searchText: searchText) { (cities) in
            completion(cities)
        }
    }
    
    func updateCitiesFromRemote(completion: @escaping (Array<CityPlainEntity>?) -> Void) {
        databaseService.deleteAll()
        obtainCities { (cities) in
            completion(cities)
        }
    }
    
}
