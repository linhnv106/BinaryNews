//
//  POIListViewController.swift
//  BinaryNews
//
//  Created by Linh Nguyen on 9/1/20.
//  Copyright © 2020 BinaryFuel. All rights reserved.
//

import Foundation
import UIKit
class POIListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
     var layout: UICollectionViewFlowLayout!
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            collectionView.delegate = self
            collectionView.dataSource = self
    //        collectionView.isPagingEnabled = true
            layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            self.collectionView.collectionViewLayout = layout
           
            
        }
        func calculateCellSize() -> CGSize {
            let size = collectionView.bounds
                .inset(by: layout.sectionInset)
                .size
            return CGSize.init(width: size.width, height: 128)
        }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Restaurant"
    }
}
extension POIListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return calculateCellSize()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let newsDetailVC =  UIStoryboard.main.instantiateNewsDetailViewController() {
            let navigation = UINavigationController()
            navigation.viewControllers = [newsDetailVC]
            navigation.modalPresentationStyle = .fullScreen
            self.present(navigation, animated: true, completion: nil)

        }


    }
    
}

extension POIListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: POIItemCellView.Constants.cellIdentifier, for: indexPath) as?
            POIItemCellView else {
                return POIItemCellView()
        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    
}
