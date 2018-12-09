//
//  NWWeatherDiscripionEntity.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/8/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

import Foundation
class NWWeatherDiscripionEntity {
    
    var description = ""
    
    init(json: [String: AnyObject]?) {
        enum Key : String {
            case description = "description"
        }
        description = json?[Key.description.rawValue] as? String ?? ""
    }
}
