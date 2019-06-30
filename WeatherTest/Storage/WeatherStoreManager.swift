//
//  WeatherStoreManager.swift
//  WeatherTest
//
//  Created by Kurrimboccus Rayane on 30/06/2019.
//  Copyright © 2019 Kurrimboccus Rayane. All rights reserved.
//

import Foundation

struct WeatherStoreManager {
//    private static var filePath: String {
//        let manager = FileManager.default
//        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
//        return (url!.appendingPathComponent("Weather").path)
//    }
    
    static func saveData(model: WeatherModel) {
        do {
            try NSKeyedArchiver.archivedData(withRootObject: model, requiringSecureCoding: false)
            UserDefaults.standard.set(model, forKey: "weatherModel")
        } catch let error {
            print("Could not persist weather items : \(error)")
        }
    }
    
    
    static func loadItems() -> WeatherModel?  {
        guard let data = UserDefaults.standard.data(forKey: "weatherModel") else { return nil }
        return try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? WeatherModel
    }
}
