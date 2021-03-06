//
//  NWWeatherDiscripionEntity.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/8/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

import Foundation
class NWWeatherDiscripionEntity {
    
    var description: String
    
    init?(json: [String: AnyObject]?) {
        guard let description_ = json?["description"] as? String else { return nil }
        description = description_
    }
}
