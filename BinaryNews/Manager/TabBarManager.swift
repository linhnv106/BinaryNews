//
//  TabBarManager.swift
//  BinaryNews
//
//  Created by Linh Nguyen on 8/31/20.
//  Copyright © 2020 BinaryFuel. All rights reserved.
//

import Foundation
import ESTabBarController_swift

class TabBarManager {
    static func systemStyle() -> UITabBarController {
        let tabBarController = UITabBarController()
        if let tabBar = tabBarController.tabBar as? ESTabBar {
            tabBar.itemCustomPositioning = .fillIncludeSeparator
        }
                let v1 = UIStoryboard.main.instantiateNewsFeed()
                let v2 = UIStoryboard.main.instantiatePOIViewController()
               let v3 = ViewController()
               let v4 = ViewController()
               let v5 = ViewController()

               v1?.tabBarItem = ESTabBarItem.init(TabBarItemView(),title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
               v2?.tabBarItem = ESTabBarItem.init(TabBarItemView(),title: "POI", image: UIImage(named: "poi"), selectedImage: UIImage(named: "poi_active"))
               v3.tabBarItem = ESTabBarItem.init(TabBarItemView(),title: "Photo", image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"))
               v4.tabBarItem = ESTabBarItem.init(TabBarItemView(),title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
               v5.tabBarItem = ESTabBarItem.init(TabBarItemView(),title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
               
               tabBarController.tabBar.shadowImage = nil
                   
               tabBarController.viewControllers = [v1!, v2!, v3, v4, v5]
               
               return tabBarController
    }
}
