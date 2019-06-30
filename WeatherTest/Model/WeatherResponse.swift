//
//  WeatherResponse.swift
//  WeatherTest
//
//  Created by Kurrimboccus Rayane on 30/06/2019.
//  Copyright © 2019 Kurrimboccus Rayane. All rights reserved.
//

import Foundation


struct WeatherResponse: Codable {
    let message: String
    let modelRun: String
    let requestKey: String
    let requestState: Int
    let source: String
    
    enum CodingKeys: String, CodingKey {
        case modelRun = "model_run"
        case requestKey = "request_key"
        case requestState = "request_state"
        case source
        case message
    }
}
