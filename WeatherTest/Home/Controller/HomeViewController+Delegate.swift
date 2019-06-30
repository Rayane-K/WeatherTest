//
//  HomeViewController+Delegate.swift
//  WeatherTest
//
//  Created by Kurrimboccus Rayane on 30/06/2019.
//  Copyright © 2019 Kurrimboccus Rayane. All rights reserved.
//

import Foundation
import UIKit

extension HomeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = self.viewModel.dates[indexPath.row]
        let weatherDay = WeatherDay(date: viewModel.date, weatherInfos: self.viewModel.dates)
        let controller = DetailViewController(weatherDay: weatherDay)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
