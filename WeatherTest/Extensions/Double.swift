//
//  Double.swift
//  WeatherTest
//
//  Created by Kurrimboccus Rayane on 01/07/2019.
//  Copyright © 2019 Kurrimboccus Rayane. All rights reserved.
//

import Foundation

extension Double {
    var kelvinToCelsius: Double {
        let absoluteZero = -273.15
        return absoluteZero + self
    }
}
