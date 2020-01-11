//
//  ItemCell.swift
//  shadow_view_demo
//
//  Created by v on 2020/1/11.
//  Copyright © 2020 lvv. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {
    private var shadowView: ShadowView!
    private var imageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)

        imageView = UIImageView(image: UIImage(named: "img"))
        imageView.layer.cornerRadius = 14
        imageView.layer.masksToBounds = true
        backgroundView = imageView

        shadowView = ShadowView()
        shadowView.layer.cornerRadius = 20
        shadowView.applyShadow(.black, CGSize(width: 0, height: 6), 0.2, 20)
        insertSubview(shadowView, belowSubview: imageView)

        contentView.layer.cornerRadius = 14
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.orange.cgColor
        contentView.layer.masksToBounds = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        shadowView.frame = bounds
    }
}
