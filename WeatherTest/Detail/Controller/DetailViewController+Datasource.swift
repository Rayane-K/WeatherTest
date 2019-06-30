//
//  DetailViewController+Datasource.swift
//  WeatherTest
//
//  Created by Kurrimboccus Rayane on 01/07/2019.
//  Copyright © 2019 Kurrimboccus Rayane. All rights reserved.
//

import UIKit

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(viewModel.weatherDay.weatherInfos.count)
        return viewModel.weatherDay.weatherInfos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherInfoCollectionViewCell.identifier, for: indexPath) as? WeatherInfoCollectionViewCell else { return UICollectionViewCell() }
        let viewModel = self.viewModel.weatherDay.weatherInfos[indexPath.row]
        cell.update(with: viewModel)
        return cell
    }
    
    
}
