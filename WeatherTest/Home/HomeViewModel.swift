//
//  HomeViewModel.swift
//  WeatherTest
//
//  Created by Kurrimboccus Rayane on 30/06/2019.
//  Copyright © 2019 Kurrimboccus Rayane. All rights reserved.
//

import Foundation

enum State {
    case success
    case loading
    case error(Error)
}

struct HomeViewModel {
    var dates: [WeatherDateViewModel] = []
    
    var stateDidChange: ((State) -> Void)?
    
    let api = WeatherAPI()
    
    func fetch() {
        
    }
}
