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
    
    private let cellHeight: CGFloat = 110
    private let cellMultiplier: CGFloat = 0.9
    private let cellSpace: CGFloat = 10
    private let validateButtonSize: CGFloat = 70
    private let topButtonTopMargin: CGFloat = 60
    private let topButtonSideMargin: CGFloat = 20
    private let topButtonSize: CGFloat = 40

    // MARK: - SubViews
    
    private let hourLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 34, weight: .semibold)
        label.textAlignment = .center
        label.text = "No Text"
        return label
    }()
    
    private let energyCell: Cell = {
        let cell = Cell()
        cell.setBackgroundColor(color: UIColor.lightGray)
        cell.setTitle(title: "Energy")
        cell.setIcon(icon: UIImage(named: "battery")!)
        cell.backgroundColor = UIColor(displayP3Red: 231/255, green: 76/255, blue: 60/255, alpha: 1)
        
        return cell
    }()
    
    private let focusCell: Cell = {
        let cell = Cell()
        cell.setBackgroundColor(color: UIColor.lightGray)
        cell.setTitle(title: "Focus")
        cell.setIcon(icon: UIImage(named: "target")!)
        cell.backgroundColor = UIColor(displayP3Red: 41/255, green: 128/255, blue: 185/255, alpha: 1)
        return cell
    }()
    
    private let motivationCell: Cell = {
        let cell = Cell()
        cell.setBackgroundColor(color: UIColor.lightGray)
        cell.setTitle(title: "Motivation")
        cell.setIcon(icon: UIImage(named: "money")!)
        cell.backgroundColor = UIColor(displayP3Red: 241/255, green: 196/255, blue: 15/255, alpha: 1)
        return cell
    }()
    
    let dataButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "burger"), for: .normal)
        return button
    }()
    
    let statButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "stats"), for: .normal)
        return button
    }()
    
    let validateButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "validate"), for: .normal)
        button.backgroundColor = UIColor(displayP3Red: 39/255, green: 174/255, blue: 96/255, alpha: 1)
        return button
    }()
    
    // Constructors
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        setupItems()
        setupButtons()
        setupLabel()
        setDate()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func getNotes() -> (energy: Int8, focus: Int8, motivation: Int8) {
        return (Int8(energyCell.selectedNumber()), Int8(focusCell.selectedNumber()), Int8(motivationCell.selectedNumber()))
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
    
    private func setupButtons() {
        addSubview(validateButton)
        validateButton.translatesAutoresizingMaskIntoConstraints = false
        validateButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50).isActive = true
        validateButton.widthAnchor.constraint(equalToConstant: validateButtonSize).isActive = true
        validateButton.heightAnchor.constraint(equalToConstant: validateButtonSize).isActive = true
        validateButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        validateButton.layer.cornerRadius = validateButtonSize/2
        
        addSubview(dataButton)
        dataButton.translatesAutoresizingMaskIntoConstraints = false
        dataButton.topAnchor.constraint(equalTo: topAnchor, constant: topButtonTopMargin).isActive = true
        dataButton.leftAnchor.constraint(equalTo: leftAnchor, constant: topButtonSideMargin).isActive = true
        dataButton.heightAnchor.constraint(equalToConstant: topButtonSize).isActive = true
        dataButton.widthAnchor.constraint(equalToConstant: topButtonSize).isActive = true
        
        addSubview(statButton)
        statButton.translatesAutoresizingMaskIntoConstraints = false
        statButton.topAnchor.constraint(equalTo: topAnchor, constant: topButtonTopMargin).isActive = true
        statButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -topButtonSideMargin).isActive = true
        statButton.heightAnchor.constraint(equalToConstant: topButtonSize).isActive = true
        statButton.widthAnchor.constraint(equalToConstant: topButtonSize).isActive = true
    }
    
    private func setupLabel() {
        addSubview(hourLabel)
        hourLabel.translatesAutoresizingMaskIntoConstraints = false
        hourLabel.bottomAnchor.constraint(equalTo: energyCell.topAnchor, constant: -40).isActive = true
        hourLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8)
        hourLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        hourLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setDate() {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        hourLabel.text = "\(hour) : \(minutes)"
    }
    
}
