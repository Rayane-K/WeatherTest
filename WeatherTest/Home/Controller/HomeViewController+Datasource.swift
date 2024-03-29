//
//  HomeViewController+Datasource.swift
//  WeatherTest
//
//  Created by Kurrimboccus Rayane on 30/06/2019.
//  Copyright © 2019 Kurrimboccus Rayane. All rights reserved.
//

import UIKit
import Foundation

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.response.week.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherDateTableViewCell.identifier, for: indexPath) as? WeatherDateTableViewCell
            else { return UITableViewCell() }
        let viewModel = self.viewModel.response.week[indexPath.row]
        cell.update(with: viewModel)
        return cell
    }
    
    
}
