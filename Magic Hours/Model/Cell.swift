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
    
    private let cellSize: CGFloat = 65.0
    
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
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let pickerView: UIPickerView = {
        let picker = UIPickerView()
        
        // Rotate the picker view
        picker.transform = CGAffineTransform(rotationAngle: CGFloat(90*Double.pi/180))
        
        return picker
    }()
    
    // MARK: - Constructors
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(5, inComponent: 0, animated: false)
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
    
    func selectedNumber() -> Int {
        return 10 - pickerView.selectedRow(inComponent: 0)
    }
    
    // MARK: - Private functions
    
    private func setupSubviews() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: titleMargin).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: titleMargin).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: titleHeight).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -titleMargin).isActive = true
        
        addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pickerView.heightAnchor.constraint(equalTo: widthAnchor).isActive = true
        pickerView.widthAnchor.constraint(equalTo: heightAnchor, constant: -titleHeight-20).isActive = true
        pickerView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor, constant: 50).isActive = true
    }

}

extension Cell: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return cellSize
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return cellSize
    }
}

extension Cell: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let cell = PickerViewCell()
        cell.setNumber(10-row)
        cell.transform = CGAffineTransform(rotationAngle: CGFloat(-90*Double.pi/180))
        return cell
    }
}
