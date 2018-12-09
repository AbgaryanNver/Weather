//
//  RemoteManager.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/8/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

import Foundation

struct RemoteManager : RemoteManagerProtocol {

    func downloadData(_ url: URL, completion: @escaping (Data?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            completion(data, error)
        }.resume()
    }

}
