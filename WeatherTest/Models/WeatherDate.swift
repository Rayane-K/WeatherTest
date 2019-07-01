//
//  WeatherDate.swift
//  WeatherTest
//
//  Created by Kurrimboccus Rayane on 30/06/2019.
//  Copyright © 2019 Kurrimboccus Rayane. All rights reserved.
//

import Foundation

struct WeatherDate : Codable, Equatable {
    /*
     Temperature
     */
    let temperature: Temperature
    
    /*
     Precipitations on 3 hours (mm)
     */
    let rain: Double
    
    /*
     Relative humidity
     */
    let humidity: Humidity
    
    /*
     Pression at sea level
     */
    let pression: Pression
    
    /*
     Snow likelihood
     */
    let snowRisk: Bool
    
    enum CodingKeys: String, CodingKey {
        case temperature
        case rain = "pluie"
        case humidity = "humidite"
        case pression
        case snowRisk = "risque_neige"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let temperature = try container.decode(Temperature.self, forKey: CodingKeys.temperature)
        let rain = try container.decode(Double.self, forKey: CodingKeys.rain)
        let humidity = try container.decode(Humidity.self, forKey: CodingKeys.humidity)
        let pression = try container.decode(Pression.self, forKey: CodingKeys.pression)
        let snowRisk = try container.decode(String.self, forKey: CodingKeys.snowRisk)
        let snowRiskValue = snowRisk == "oui" ? true : false
        
        self.init(temperature: temperature,
                  rain: rain,
                  humidity: humidity,
                  pression: pression,
                  snowRisk: snowRiskValue)
    }
    
    init(temperature: Temperature,
         rain: Double,
         humidity: Humidity,
         pression: Pression,
         snowRisk: Bool) {
        self.temperature = temperature
        self.rain = rain
        self.humidity = humidity
        self.pression = pression
        self.snowRisk = snowRisk
    }
    
}
