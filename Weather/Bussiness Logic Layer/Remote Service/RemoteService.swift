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
        guard let url = Config.URLCreator.url else { return }
        networkManager.downloadData(url) {[weak self] (data_: Data?, error_: Error?) -> Void in
            if let data = data_, error_ == nil {
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] else {
                        completion(nil,nil)
                        return
                    }
                    if let nwEntity = self?.convertJsonToObject(json, "list") {
                        let playinObj = self?.convertToPlainCity(networkCities: nwEntity)
                        completion(playinObj,nil)
                    }
                } catch { print("json parsing exeption")}
            } else {
                completion(nil, error_)
            }
        }
    }
    
    private func convertToPlainCity(networkCities: Array<NWCityEntity>?) -> Array<CityPlainEntity>? {
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
    
    private func convertJsonToObject(_ json: [String: AnyObject], _ key: String) -> Array<NWCityEntity>? {
        if let resultsArray = json[key] as? Array<[String : AnyObject]> {
            var infos = Array<NWCityEntity>()
            for result in resultsArray {
                let obj = NWCityEntity(json: result)
                infos.append(obj)
            }
            return infos
        }
        return nil
    }
    
}
