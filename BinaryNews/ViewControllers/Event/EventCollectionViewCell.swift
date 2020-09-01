//
//  EventCellView.swift
//  BinaryNews
//
//  Created by Linh Nguyen on 9/1/20.
//  Copyright © 2020 BinaryFuel. All rights reserved.
//

import Foundation
import UIKit
import expanding_collection
class EventCollectionViewCell: BasePageCollectionCell {
    @IBOutlet var backgroundImageView: UIImageView!
       @IBOutlet var customTitle: UILabel!

       override func awakeFromNib() {
           super.awakeFromNib()

           customTitle.layer.shadowRadius = 2
           customTitle.layer.shadowOffset = CGSize(width: 0, height: 3)
           customTitle.layer.shadowOpacity = 0.2
       }
}
