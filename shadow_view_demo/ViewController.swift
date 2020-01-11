//
//  ViewController.swift
//  shadow_view_demo
//
//  Created by v on 2020/1/11.
//  Copyright © 2020 lvv. All rights reserved.
//

import UIKit

enum ItemCellType {
    case small
    case normal
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private var collectionView: UICollectionView!
    private var cellType: ItemCellType = .normal

    override func viewDidLoad() {
        super.viewDidLoad()

        let smallModeItem = UIBarButtonItem(title: "Small", style: .plain, target: self, action: #selector(smallAction(_:)))
        let normalModeItem = UIBarButtonItem(title: "Normal", style: .plain, target: self, action: #selector(normalAction(_:)))
        navigationItem.rightBarButtonItems = [normalModeItem, smallModeItem]

        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 30
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(ItemCell.self, forCellWithReuseIdentifier: NSStringFromClass(ItemCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10000
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(ItemCell.self), for: indexPath)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var w = collectionView.frame.width - 32
        if cellType == .small {
            w = 35
        }

        return CGSize(width: w, height: w * 1.2)
    }

    @objc func smallAction(_ sender: Any) {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }

        cellType = .small
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        collectionView.reloadData()
    }

    @objc func normalAction(_ sender: Any) {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }

        cellType = .normal
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 30
        collectionView.reloadData()
    }
}

