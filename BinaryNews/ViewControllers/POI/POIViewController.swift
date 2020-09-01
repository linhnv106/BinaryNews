//
//  POIViewController.swift
//  BinaryNews
//
//  Created by Linh Nguyen on 8/31/20.
//  Copyright © 2020 BinaryFuel. All rights reserved.
//

import Foundation
import UIKit
class POIViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
       var layout: UICollectionViewFlowLayout!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
                collectionView.dataSource = self
                collectionView.isPagingEnabled = true
                layout = UICollectionViewFlowLayout()
                layout.scrollDirection = .vertical
                self.collectionView.collectionViewLayout = layout
    }
    func calculateCellSize() -> CGSize {
        let noOfCellsInRow = 3

        let flowLayout = layout as! UICollectionViewFlowLayout

        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

        return CGSize(width: size, height: 160)

       }
    
}

extension POIViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return calculateCellSize()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc =  UIStoryboard.main.instantiatePOIListViewController() {
                   let navigation = UINavigationController()
                   navigation.viewControllers = [vc]
                   navigation.modalPresentationStyle = .fullScreen
                   self.present(navigation, animated: true, completion: nil)

               }
    }

}

extension POIViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: POICellView.Constants.cellIdentifier, for: indexPath) as?
            POICellView else {
                return POICellView()
        }
        cell.initData(index: indexPath.row)
        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

}
