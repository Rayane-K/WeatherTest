//
//  WeatherFixtures.swift
//  WeatherTestTests
//
//  Created by Kurrimboccus Rayane on 01/07/2019.
//  Copyright © 2019 Kurrimboccus Rayane. All rights reserved.
//

import Foundation
@testable import WeatherTest

struct WeatherDateFixture {
    func anyWeatherDate(temperature: Temperature = Temperature(twoMeters: 10, ground: 10),
                        rain: Double = 10,
                        humidity: Humidity = Humidity(twoMeters: 10),
                        pression: Pression = Pression(seaLevel: 10),
                        snowRisk: Bool = false) -> WeatherDate {
        return WeatherDate(temperature: temperature,
                           rain: rain,
                           humidity: humidity,
                           pression: pression,
                           snowRisk: snowRisk)
    }
}
