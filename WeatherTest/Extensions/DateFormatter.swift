//
//  DateFormatter.swift
//  WeatherTest
//
//  Created by Kurrimboccus Rayane on 30/06/2019.
//  Copyright © 2019 Kurrimboccus Rayane. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static var weatherFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }
    
    static var weatherTextFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        return formatter
    }
    
    static var hourFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }
}
