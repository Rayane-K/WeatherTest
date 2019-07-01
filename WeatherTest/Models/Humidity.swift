//
//  Humidity.swift
//  WeatherTest
//
//  Created by Kurrimboccus Rayane on 01/07/2019.
//  Copyright © 2019 Kurrimboccus Rayane. All rights reserved.
//

import Foundation


struct Humidity: Codable, Equatable {
    /*
     Relative humidity at two meters from the ground, in percentage
     */
    let twoMeters: Double
    
    enum CodingKeys: String, CodingKey {
        case twoMeters = "2m"
    }
}
