//
//  WeatherStoreManager.swift
//  WeatherTest
//
//  Created by Kurrimboccus Rayane on 30/06/2019.
//  Copyright © 2019 Kurrimboccus Rayane. All rights reserved.
//

import Foundation

struct WeatherStoreManager {

    static func saveData(viewModels: [WeatherInfoViewModel]) {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(viewModels) {
            UserDefaults.standard.set(data, forKey: "weatherModel")
        }
    }


    static func loadItems() -> [WeatherInfoViewModel]?  {
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.data(forKey: "weatherModel"),
            let viewModels = try? decoder.decode([WeatherInfoViewModel].self, from: data) {
            return viewModels
        }
        return nil
    }
}


