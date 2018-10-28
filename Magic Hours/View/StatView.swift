//
//  StatView.swift
//  Magic Hours
//
//  Created by Quentin Cornu on 28/10/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class StatView: UIView {
    
    // MARK: : Private properties
    
    private let topButtonTopMargin: CGFloat = 60
    private let topButtonSideMargin: CGFloat = 20
    private let topButtonSize: CGFloat = 40
    
    // MARK: - Subviews
    
    private let graph: Graph = {
        let graph = Graph()
        return graph
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back"), for: .normal)
        return button
    }()
    
    let energySelector: UIButton = {
        let selector = SelectorButton()
        selector.setIcon(icon: UIImage(named: "battery")!)
        
        return selector
    }()
    
    let focusSelector: UIButton = {
        let selector = SelectorButton()
        selector.setIcon(icon: UIImage(named: "target")!)
        
        return selector
    }()
    
    let motivationSelector: UIButton = {
        let selector = SelectorButton()
        selector.setIcon(icon: UIImage(named: "money")!)
        
        return selector
    }()
    
    // MARK: - Constructor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        setupGraph()
        setupButtons()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func setValues(points: [Point]) {
        graph.setValues(points: points)
        graph.updateGraph()
    }
    
    // MARK: - Private functions
    
    private func setupGraph() {
        addSubview(graph)
        graph.translatesAutoresizingMaskIntoConstraints = false
        graph.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        graph.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        graph.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        graph.heightAnchor.constraint(equalTo: graph.widthAnchor).isActive = true
    }
    
    private func setupButtons() {
        addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: topAnchor, constant: topButtonTopMargin).isActive = true
        backButton.leftAnchor.constraint(equalTo: leftAnchor, constant: topButtonSideMargin).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: topButtonSize).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: topButtonSize).isActive = true
        
        let selectorContainer = UIStackView()
        selectorContainer.distribution = .fillEqually
        selectorContainer.axis = .horizontal
        selectorContainer.spacing = 15
        
        selectorContainer.addArrangedSubview(energySelector)
        selectorContainer.addArrangedSubview(focusSelector)
        selectorContainer.addArrangedSubview(motivationSelector)
        selectorContainer.backgroundColor = UIColor.red
        addSubview(selectorContainer)
        selectorContainer.translatesAutoresizingMaskIntoConstraints = false
        selectorContainer.topAnchor.constraint(equalTo: graph.bottomAnchor, constant: 50).isActive = true
        selectorContainer.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        selectorContainer.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        selectorContainer.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
}
