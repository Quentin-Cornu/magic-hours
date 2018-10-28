//
//  HomeView.swift
//  Magic Hours
//
//  Created by Quentin Cornu on 28/10/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class HomeView: UIView {
    
    // MARK: - Private Properties
    
    private let cellHeight: CGFloat = 90
    private let cellMultiplier: CGFloat = 0.8
    private let cellSpace: CGFloat = 10
    
    
    // MARK: - SubViews
    
    private let energyCell: Cell = {
        let cell = Cell()
        cell.setBackgroundColor(color: UIColor.blue)
        return cell
    }()
    
    private let focusCell: Cell = {
        let cell = Cell()
        cell.setBackgroundColor(color: UIColor.red)
        return cell
    }()
    
    private let motivationCell: Cell = {
        let cell = Cell()
        cell.setBackgroundColor(color: UIColor.yellow)
        return cell
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        setupItems()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupItems() {
        addSubview(focusCell)
        focusCell.translatesAutoresizingMaskIntoConstraints = false
        focusCell.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        focusCell.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        focusCell.heightAnchor.constraint(equalToConstant: cellHeight).isActive = true
        focusCell.widthAnchor.constraint(equalTo: widthAnchor, multiplier: cellMultiplier).isActive = true

        addSubview(energyCell)
        energyCell.translatesAutoresizingMaskIntoConstraints = false
        energyCell.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        energyCell.bottomAnchor.constraint(equalTo: focusCell.topAnchor, constant: -cellSpace).isActive = true
        energyCell.heightAnchor.constraint(equalToConstant: cellHeight).isActive = true
        energyCell.widthAnchor.constraint(equalTo: widthAnchor, multiplier: cellMultiplier).isActive = true
        
        addSubview(motivationCell)
        motivationCell.translatesAutoresizingMaskIntoConstraints = false
        motivationCell.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        motivationCell.topAnchor.constraint(equalTo: focusCell.bottomAnchor, constant: cellSpace).isActive = true
        motivationCell.heightAnchor.constraint(equalToConstant: cellHeight).isActive = true
        motivationCell.widthAnchor.constraint(equalTo: widthAnchor, multiplier: cellMultiplier).isActive = true
    }
    
    
}
