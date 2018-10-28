//
//  PickerViewCell.swift
//  Magic Hours
//
//  Created by Quentin Cornu on 28/10/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class PickerViewCell: UIView {
    
    // MARK: - Subviews
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "No Text"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 35, weight: .semibold)
        label.textColor = UIColor.white
        return label
    }()
    
    // MARK: - Constructor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func setNumber(_ number: Int) {
        titleLabel.text = "\(number)"
    }
    
    // MARK: - Private functions
    
    private func setupLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
