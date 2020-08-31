//
//  POICellView.swift
//  BinaryNews
//
//  Created by Linh Nguyen on 8/31/20.
//  Copyright © 2020 BinaryFuel. All rights reserved.
//

import Foundation
import UIKit
class POICellView: UICollectionViewCell {
    enum Constants {
        static let  cellIdentifier: String = "POICellView"
        static let  cellHeight: CGFloat = 140
    }
    @IBOutlet var containerView: UIView!

    @IBOutlet var titleLB: UILabel!
    @IBOutlet var iconIv: UIImageView!


    let bgColor :[UIColor] = [ .red, .blue, .yellow, .green, .systemPink, .orange, .purple]
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 24
    }
    func initData(index: Int){
        containerView.backgroundColor = bgColor[index]


    }
    
}
