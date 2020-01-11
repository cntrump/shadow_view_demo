//
//  ShadowView.swift
//  shadow_view_demo
//
//  Created by v on 2020/1/11.
//  Copyright © 2020 lvv. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    private var shadowColor: UIColor?
    private var shadowOpacity: CGFloat = 1
    private var shadowOffset: CGSize = CGSize(width: 0, height: 3)
    private var shadowBlur: CGFloat = 6

    override func layoutSubviews() {
        super.layoutSubviews()

        updateShadow()
    }

    func applyShadow(_ color: UIColor?, _ offset: CGSize, _ opacity: CGFloat, _ blur: CGFloat) {
        shadowColor = color
        shadowOffset = offset
        shadowOpacity = opacity
        shadowBlur = blur

        updateShadow()
    }

    private func updateShadow() {
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = Float(shadowOpacity)
        layer.shadowRadius = shadowBlur * 0.5
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: layer.cornerRadius).cgPath
    }
}
