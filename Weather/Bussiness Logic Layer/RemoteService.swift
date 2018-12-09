//
//  RemoteService.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/8/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

import Foundation

class RemoteService : RemoteServiceProtocol {

    var networkManager: RemoteManagerProtocol!
    
    func fetchCities(completion: @escaping (Array<CityPlainEntity>?, Error?) -> Void) {
        if let url = Config.URLCreator.url {
            networkManager.downloadArray(forKey: "list", url: url) {[weak self] (response: Array<NWCityEntity>?, error: Error?) -> Void in
                if let error = error {
                    completion(nil, error)
                } else {
                    let plainCities = self?.convertToPlainCity(networkCities: response)
                    completion(plainCities, nil)
                }
            }
        }
    }
    
    fileprivate func convertToPlainCity(networkCities: Array<NWCityEntity>?) -> Array<CityPlainEntity>? {
        guard let cities = networkCities else {
            return nil
        }
        var plainCities = Array<CityPlainEntity>()
        for city in cities {
            let plainObj = city.plainObject
            plainCities.append(plainObj)
        }
        return plainCities
    }
    
}
