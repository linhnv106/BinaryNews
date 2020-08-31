//
//  NewsFeedViewController.swift
//  BinaryNews
//
//  Created by Linh Nguyen on 8/31/20.
//  Copyright © 2020 BinaryFuel. All rights reserved.
//

import Foundation
import UIKit
import BetterSegmentedControl
class NewsFeedViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
   
    @IBOutlet weak var segmentContainerView: UIView!
    
    var layout: UICollectionViewFlowLayout!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
//        collectionView.isPagingEnabled = true
        layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        self.collectionView.collectionViewLayout = layout
        let control = BetterSegmentedControl(
            frame: CGRect(x: 0, y: 0, width: 200, height: 44),
            segments: LabelSegment.segments(withTitles: ["Must Read", "Local News"],
            normalFont: UIFont(name: "HelveticaNeue-Light", size: 14.0)!,
            normalTextColor: .lightGray,
            selectedFont: UIFont(name: "HelveticaNeue-Bold", size: 14.0)!,
            selectedTextColor: .white),
            index: 1,
            options: [.backgroundColor(.darkGray),
                      .indicatorViewBackgroundColor(.orange)])
        control.cornerRadius = 22
        
        segmentContainerView.addSubview(control)
        
    }
    func calculateCellSize() -> CGSize {
        let size = collectionView.bounds
            .inset(by: layout.sectionInset)
            .size
        return CGSize.init(width: size.width, height: 140)
    }
    
}
extension NewsFeedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return calculateCellSize()
    }
    
}

extension NewsFeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCellView.Constants.cellIdentifier, for: indexPath) as?
            NewsCellView else {
                return NewsCellView()
        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}
