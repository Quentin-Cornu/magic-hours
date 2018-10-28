//
//  StatViewController.swift
//  Magic Hours
//
//  Created by Quentin Cornu on 28/10/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class StatViewController: UIViewController {

    // MARK: - Private properties
    
    let statView: StatView = {
        let view = StatView()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = statView
    }

}
