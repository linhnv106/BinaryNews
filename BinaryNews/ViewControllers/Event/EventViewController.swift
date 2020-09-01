//
//  EventViewController.swift
//  BinaryNews
//
//  Created by Linh Nguyen on 9/1/20.
//  Copyright © 2020 BinaryFuel. All rights reserved.
//

import Foundation
import UIKit
import expanding_collection
class EventViewController: ExpandingViewController {

    typealias ItemInfo = (imageName: String, title: String)
    fileprivate var cellsIsOpen = [Bool]()
    fileprivate let items: [ItemInfo] = [("item0", "Boston"), ("item1", "New York"), ("item2", "San Francisco"), ("item3", "Washington")]

    @IBOutlet var pageLabel: UILabel!
}

// MARK: - Lifecycle 🌎

extension EventViewController {

    override func viewDidLoad() {
        itemSize = CGSize(width: 256, height: 460)
        super.viewDidLoad()

        registerCell()
        fillCellIsOpenArray()
        addGesture(to: collectionView!)
        configureNavBar()
 
    }
}


// MARK: Helpers

extension EventViewController {

    fileprivate func registerCell() {

       let nib = UINib(nibName: String(describing: EventCollectionViewCell.self), bundle: nil)
       collectionView?.register(nib, forCellWithReuseIdentifier: String(describing: EventCollectionViewCell.self))
    }

    fileprivate func fillCellIsOpenArray() {
        cellsIsOpen = Array(repeating: false, count: items.count)
    }

    fileprivate func getViewController() -> ExpandingTableViewController {
        let toViewController = UIStoryboard.main.instantiateEventTableViewController()
        return toViewController!
    }

    fileprivate func configureNavBar() {
        navigationItem.leftBarButtonItem?.image = navigationItem.leftBarButtonItem?.image!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
    }
}

/// MARK: Gesture
extension EventViewController {

    fileprivate func addGesture(to view: UIView) {
        let upGesture = Init(UISwipeGestureRecognizer(target: self, action: #selector(EventViewController.swipeHandler(_:)))) {
            $0.direction = .up
        }

        let downGesture = Init(UISwipeGestureRecognizer(target: self, action: #selector(EventViewController.swipeHandler(_:)))) {
            $0.direction = .down
        }
        view.addGestureRecognizer(upGesture)
        view.addGestureRecognizer(downGesture)
    }

    @objc func swipeHandler(_ sender: UISwipeGestureRecognizer) {
        let indexPath = IndexPath(row: currentIndex, section: 0)
        guard let cell = collectionView?.cellForItem(at: indexPath) as? EventCollectionViewCell else { return }
        // double swipe Up transition
        if cell.isOpened == true && sender.direction == .up {
            pushToViewController(getViewController())

            if let rightButton = navigationItem.rightBarButtonItem as? AnimatingBarButton {
                rightButton.animationSelected(true)
            }
        }

        let open = sender.direction == .up ? true : false
        cell.cellIsOpen(open)
        cellsIsOpen[indexPath.row] = cell.isOpened
    }
}

// MARK: UIScrollViewDelegate

extension EventViewController {

    func scrollViewDidScroll(_: UIScrollView) {
        pageLabel.text = "\(currentIndex + 1)/\(items.count)"
    }
}

// MARK: UICollectionViewDataSource

extension EventViewController {

    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        super.collectionView(collectionView, willDisplay: cell, forItemAt: indexPath)
        guard let cell = cell as? EventCollectionViewCell else { return }

        let index = indexPath.row % items.count
        let info = items[index]
        cell.backgroundImageView?.image = UIImage(named: info.imageName)
        cell.customTitle.text = info.title
        cell.cellIsOpen(cellsIsOpen[index], animated: false)
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? EventCollectionViewCell
            , currentIndex == indexPath.row else { return }

        if cell.isOpened == false {
            cell.cellIsOpen(true)
        } else {
            pushToViewController(getViewController())

            if let rightButton = navigationItem.rightBarButtonItem as? AnimatingBarButton {
                rightButton.animationSelected(true)
            }
        }
    }
}

// MARK: UICollectionViewDataSource

extension EventViewController {

    override func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: "EventCollectionViewCell"), for: indexPath)
    }
}

