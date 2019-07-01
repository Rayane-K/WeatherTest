//
//  WeatherAPI.swift
//  WeatherTest
//
//  Created by Kurrimboccus Rayane on 30/06/2019.
//  Copyright © 2019 Kurrimboccus Rayane. All rights reserved.
//

import Foundation
import Alamofire

struct WeatherAPI {
    static let apiUrl = "http://www.infoclimat.fr/public-api/gfs/json?_ll=48.85341,2.3488&_auth=Bx1QRwV7ASMCL1dgAXcELQVtADVeKFdwC3cDYABlUSwGbQJjBmZXMVA%2BWyYGKQQyVHlSMQw3VGRQO1IqXC5TMgdtUDwFbgFmAm1XMgEuBC8FKwBhXn5XcAtpA2MAa1EsBmQCbgZgVytQPVs8BjQELlRmUjQMMlRzUCxSNFw0UzYHZVA9BWcBZQJuVzABMAQvBSkAZV41V24LYAMyAG5RYAYzAjcGZldhUG1bPQY2BC5Ub1IwDDNUZFA6UjNcOFM3B3tQKwUfARACcFd1AXMEZQVwAH1eNFcxCzw%3D&_c=d301ddf413fe089b63fec35070a18b9b"
    
    var latitude: Double?
    var longitude: Double?
    var apiUrlWithLocation: String? {
        guard let latitude = latitude, let longitude = longitude else { return nil }
        return "http://www.infoclimat.fr/public-api/gfs/json?_ll=\(longitude),\(latitude)&_auth=Bx1QRwV7ASMCL1dgAXcELQVtADVeKFdwC3cDYABlUSwGbQJjBmZXMVA%2BWyYGKQQyVHlSMQw3VGRQO1IqXC5TMgdtUDwFbgFmAm1XMgEuBC8FKwBhXn5XcAtpA2MAa1EsBmQCbgZgVytQPVs8BjQELlRmUjQMMlRzUCxSNFw0UzYHZVA9BWcBZQJuVzABMAQvBSkAZV41V24LYAMyAG5RYAYzAjcGZldhUG1bPQY2BC5Ub1IwDDNUZFA6UjNcOFM3B3tQKwUfARACcFd1AXMEZQVwAH1eNFcxCzw%3D&_c=d301ddf413fe089b63fec35070a18b9b"
    }
    
    
    private static let sessionManager = Alamofire.SessionManager.default
    
    typealias WeatherResponse = [String: WeatherDate]
    func fetchWeatherFromApi(completion: @escaping ((WeatherResponse) -> Void), error: @escaping ((Error) -> Void)) {
        let url = apiUrlWithLocation ?? WeatherAPI.apiUrl
        WeatherAPI.sessionManager.request(url).responseJSON { response in
            do {
                guard let json = response.result.value as? NSDictionary else { return }
                let dic = NSMutableDictionary(dictionary: json)
                dic.removeObjects(forKeys: ["model_run", "request_key", "request_state", "source", "message"])
                let data = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
                let decoder = JSONDecoder()
                let model = try decoder.decode([String: WeatherDate].self, from: data)
                completion(model)
            } catch let parsingError {
                print("Error", parsingError)
                error(parsingError)
            }
        }
    }
}
