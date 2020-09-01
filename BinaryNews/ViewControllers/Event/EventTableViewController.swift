//
//  EventTableViewController.swift
//  BinaryNews
//
//  Created by Linh Nguyen on 9/1/20.
//  Copyright © 2020 BinaryFuel. All rights reserved.
//

import Foundation
import UIKit
import expanding_collection
class EventTableViewController: ExpandingTableViewController {

    fileprivate var scrollOffsetY: CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        let image1 = UIImage()
        tableView.backgroundView = UIImageView(image: image1)
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
    }
}

// MARK: Helpers

extension EventTableViewController {

    fileprivate func configureNavBar() {
        navigationItem.leftBarButtonItem?.image = navigationItem.leftBarButtonItem?.image!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        navigationItem.rightBarButtonItem?.image = navigationItem.rightBarButtonItem?.image!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
    }
}

// MARK: Actions

extension EventTableViewController {

    @IBAction func backButtonHandler(_: AnyObject) {
        // buttonAnimation
        let viewControllers: [EventViewController?] = navigationController?.viewControllers.map { $0 as? EventViewController } ?? []

        for viewController in viewControllers {
            if let rightButton = viewController?.navigationItem.rightBarButtonItem as? AnimatingBarButton {
                rightButton.animationSelected(false)
            }
        }
        popTransitionAnimation()
    }
}

// MARK: UIScrollViewDelegate

extension EventTableViewController {

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < -25 , let navigationController = navigationController {
            // buttonAnimation
            for case let viewController as EventViewController in navigationController.viewControllers {
                if case let rightButton as AnimatingBarButton = viewController.navigationItem.rightBarButtonItem {
                    rightButton.animationSelected(false)
                }
            }
            popTransitionAnimation()
        }
        scrollOffsetY = scrollView.contentOffset.y
    }
}
