//
//  POIItemCellView.swift
//  BinaryNews
//
//  Created by Linh Nguyen on 9/1/20.
//  Copyright © 2020 BinaryFuel. All rights reserved.
//

import Foundation
import UIKit
import Cosmos
class POIItemCellView : UICollectionViewCell {
    enum Constants {
        static let  cellIdentifier: String = "POIItemCellView"
        static let  cellHeight: CGFloat = 140
    }
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var poiImageView: UIImageView!
    @IBOutlet weak var poiNameLB: UILabel!
    @IBOutlet weak var poiAddLB: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    
    @IBOutlet weak var totalRatingLB: UILabel!
    @IBOutlet weak var ratingLB: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.borderWidth  = 0.5
        containerView.layer.borderColor  = UIColor.darkGray.cgColor
        containerView.layer.cornerRadius = 8
        poiAddLB.lineBreakMode = NSLineBreakMode.byWordWrapping
        poiAddLB.numberOfLines = 0
        poiAddLB.sizeToFit()
    }

}
