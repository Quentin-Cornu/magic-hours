//
//  SelectorButton.swift
//  Magic Hours
//
//  Created by Quentin Cornu on 28/10/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SelectorButton: UIButton {
    
    private var icon: UIImage? = nil {
        didSet {
            iconView.image = icon
        }
    }
    private var color: UIColor = UIColor.lightGray {
        didSet {
            backgroundColor = color
        }
    }
    
    private let iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 5
        backgroundColor = color
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setIcon(icon: UIImage) {
        self.icon = icon
    }
    
    func setColor(color: UIColor) {
        self.color = color
    }
    
    private func setupView() {
        addSubview(iconView)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        iconView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7).isActive = true
        iconView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
    }
}
