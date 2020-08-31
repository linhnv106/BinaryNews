//
//  UIStoryboard+Extension.swift
//  BinaryNews
//
//  Created by Linh Nguyen on 8/31/20.
//  Copyright © 2020 BinaryFuel. All rights reserved.
//

import Foundation
import UIKit
extension UIStoryboard {
    enum Constants {
        static let newsFeedIdentifier = "NewsFeedViewController"
        static let poiViewController = "POIViewController"
        static let newsDetailViewController = "NewsDetailViewController"
        
    }
    static var main: UIStoryboard {
           return UIStoryboard(name: "Main", bundle: nil)
        
       }
    func instantiateNewsFeed() -> NewsFeedViewController? {
        return self.instantiateViewController(withIdentifier: Constants.newsFeedIdentifier) as? NewsFeedViewController

    }
    func instantiatePOIViewController() -> POIViewController? {
           return self.instantiateViewController(withIdentifier: Constants.poiViewController) as? POIViewController

       }
    func instantiateNewsDetailViewController() -> NewsDetailViewController? {
             return self.instantiateViewController(withIdentifier: Constants.newsDetailViewController) as? NewsDetailViewController

         }
}

