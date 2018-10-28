//
//  Cell.swift
//  Magic Hours
//
//  Created by Quentin Cornu on 28/10/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class Cell: UIView {
    
    // MARK: - Private properties
    
    private var title: String = "No Title" {
        didSet {
            titleLabel.text = title
        }
    }
    
    private let titleMargin: CGFloat = 10
    private let titleHeight: CGFloat = 30
    
    // MARK: - Subviews
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.green
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    func setBackgroundColor(color: UIColor) {
        backgroundColor = color
    }
    
    func setTitle(title: String) {
        self.title = title
    }
    
    // MARK: - Private functions
    
    private func setupSubviews() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: titleMargin).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: titleMargin).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: titleHeight).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -titleMargin).isActive = true
    }

}
