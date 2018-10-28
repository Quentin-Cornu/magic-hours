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
    
    private let values = [Date: Int]()
    
    // MARK: - Subviews
    
    private let graph: Graph = {
        let graph = Graph()
        
        return graph
    }()
    
    // MARK: - Constructor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        setupGraph()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    // MARK: - Private functions
    
    private func setupGraph() {
        addSubview(graph)
        graph.translatesAutoresizingMaskIntoConstraints = false
        graph.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        graph.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        graph.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        graph.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
    }
    
}
