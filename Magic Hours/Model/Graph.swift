//
//  Graph.swift
//  Magic Hours
//
//  Created by Quentin Cornu on 28/10/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class Graph: UIView {
    
    // MARK: - Private properties
    
    private var values = [Point]()
    private let numberOfPoints = 12
    
    // MARK: - Subviews
    
    private let horizontalAxis: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    private let verticalAxis: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    private let dataContainerView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        for _ in 0..<12 {
            let view = UIView()
            stackView.addArrangedSubview(view)
        }
        
        return stackView
    }()
    
    // MARK: - Constructor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAxis()
        updateGraph()
        setupDataContainer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func setValues(points: [Point]) {
        values = points
    }
    
    func updateGraph() {
        
        let barContainers = dataContainerView.subviews
        
        if (values.count > numberOfPoints) {
            print("ERROR : Too many values of a 10 values graph")
            return
        }
        
        for index in 0..<values.count {
            
            if (values[index].value > numberOfPoints) {
                print("ERROR : Values must be of max values : 10")
                return
            }
            
            let subview = barContainers[index]
            
            for view in subview.subviews {
                view.removeFromSuperview()
            }
            
            let bar = UIView()
            bar.backgroundColor = UIColor.darkGray
            
            bar.backgroundColor = UIColor(displayP3Red: 231/255, green: 76/255, blue: 60/255, alpha: 1)
            
            subview.addSubview(bar)
            bar.translatesAutoresizingMaskIntoConstraints = false
            bar.leftAnchor.constraint(equalTo: subview.leftAnchor).isActive = true
            bar.bottomAnchor.constraint(equalTo: subview.bottomAnchor).isActive = true
            bar.rightAnchor.constraint(equalTo: subview.rightAnchor).isActive = true
            bar.heightAnchor.constraint(equalTo: subview.heightAnchor, multiplier: CGFloat(values[index].value)/10).isActive = true
            
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 12)
            label.text = values[index].label
            label.textAlignment = .center
            
            subview.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.topAnchor.constraint(equalTo: bar.bottomAnchor, constant: 8).isActive = true
            label.centerXAnchor.constraint(equalTo: bar.centerXAnchor).isActive = true
            label.widthAnchor.constraint(equalTo: bar.widthAnchor).isActive = true
            label.heightAnchor.constraint(equalTo: label.widthAnchor).isActive = true
        }
    }
    
    // MARK: - Private functions
    
    private func setupAxis() {
        addSubview(horizontalAxis)
        horizontalAxis.translatesAutoresizingMaskIntoConstraints = false
        horizontalAxis.heightAnchor.constraint(equalToConstant: 2).isActive = true
        horizontalAxis.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        horizontalAxis.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        horizontalAxis.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        
        addSubview(verticalAxis)
        verticalAxis.translatesAutoresizingMaskIntoConstraints = false
        verticalAxis.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        verticalAxis.widthAnchor.constraint(equalToConstant: 2).isActive = true
        verticalAxis.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        verticalAxis.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
    }
    
    private func setupDataContainer() {
        addSubview(dataContainerView)
        dataContainerView.translatesAutoresizingMaskIntoConstraints = false
        dataContainerView.leftAnchor.constraint(equalTo: verticalAxis.rightAnchor, constant: 2).isActive = true
        dataContainerView.bottomAnchor.constraint(equalTo: horizontalAxis.topAnchor, constant: -2).isActive = true
        dataContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        dataContainerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
    }
    
    
}
