//
//  Pression.swift
//  WeatherTest
//
//  Created by Kurrimboccus Rayane on 01/07/2019.
//  Copyright © 2019 Kurrimboccus Rayane. All rights reserved.
//

import Foundation


struct Pression: Codable, Equatable {
    /*
     Pression at sea level, in Pascal
     */
    let seaLevel: Double
    
    enum CodingKeys: String, CodingKey {
        case seaLevel = "niveau_de_la_mer"
    }
}
