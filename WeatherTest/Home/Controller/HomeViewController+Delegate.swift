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
        let viewModel = self.viewModel.response.week[indexPath.row]
        let controller = DetailViewController(weatherDay: viewModel)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
