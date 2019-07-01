//
//  Temperature.swift
//  WeatherTest
//
//  Created by Kurrimboccus Rayane on 01/07/2019.
//  Copyright © 2019 Kurrimboccus Rayane. All rights reserved.
//

import Foundation


struct Temperature: Codable, Equatable {
    /*
     Temperature at two meters from the ground, in Kelvin
     */
    let twoMeters: Double
    
    /*
     Temperature at ground level, in Kelvin
     */
    let ground: Double
    
    
    enum CodingKeys: String, CodingKey {
        case twoMeters = "2m"
        case ground = "sol"
    }
}
