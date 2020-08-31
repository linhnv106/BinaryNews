//
//  NewsCellView.swift
//  BinaryNews
//
//  Created by Linh Nguyen on 8/31/20.
//  Copyright © 2020 BinaryFuel. All rights reserved.
//

import Foundation
import UIKit
class NewsCellView: UICollectionViewCell {
    enum Constants {
        static let  cellIdentifier: String = "NewsCellView"
        static let  cellHeight: CGFloat = 88
    }
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var newsTitleLB: UILabel!
    @IBOutlet weak var publisherLB: UILabel!
    
    @IBOutlet weak var timeLB: UILabel!
    
    @IBAction func didTapShareAction(_ sender: Any) {
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.borderWidth  = 0.5
        containerView.layer.borderColor  = UIColor.darkGray.cgColor
        containerView.layer.cornerRadius = 8
    }
    
}
