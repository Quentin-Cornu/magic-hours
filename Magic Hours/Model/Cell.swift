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
    private var title: String = "No Title"
    
    // MARK: - Pri
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBackgroundColor(color: UIColor) {
        backgroundColor = color
    }
    
    func setTitle(title: String) {
        self.title = title
    }

}
