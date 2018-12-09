//
//  RemoteManagerProtocol.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/8/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

import Foundation

protocol RemoteManagerProtocol {
    
    func downloadData(_ url: URL, completion: @escaping (Data?, Error?) -> Void)
}
