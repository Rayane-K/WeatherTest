//
//  DetailViewController+Delegate.swift
//  WeatherTest
//
//  Created by Kurrimboccus Rayane on 01/07/2019.
//  Copyright © 2019 Kurrimboccus Rayane. All rights reserved.
//

import UIKit

extension DetailViewController: UICollectionViewDelegate {
    
}

extension DetailViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: collectionView.frame.height)
    }
}
