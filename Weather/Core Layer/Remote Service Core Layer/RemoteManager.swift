//
//  RemoteManager.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/8/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

import Foundation

struct RemoteManager : RemoteManagerProtocol {

    func downloadArray(forKey: String, url: URL, completion: @escaping (Array<NWCityEntity>?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data_, response_, error_) in
            if let data = data_, error_ == nil {
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] else {
                        completion(nil,nil)
                        return
                    }
                    if let result = self.convertJsonToObject(json, forKey) {
                        completion(result,nil)
                    }
                } catch {
                    completion(nil,nil)
                }
            } else {
                completion(nil, error_)
            }
        }.resume()
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
