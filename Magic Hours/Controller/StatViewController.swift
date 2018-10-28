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
        view.backButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = statView
        
        
        var points = [Point]()
        points.append(Point(label: "Mar", value: 3))
        points.append(Point(label: "Mer", value: 4))
        points.append(Point(label: "Jeu", value: 6))
        points.append(Point(label: "Ven", value: 8))
        points.append(Point(label: "Sam", value: 7))
        points.append(Point(label: "Dim", value: 9))
        points.append(Point(label: "Lun", value: 5))
        points.append(Point(label: "Mar", value: 2))
        points.append(Point(label: "Mer", value: 10))
        
        statView.setValues(points: points)
    }
    
    // MARK: - Actions
    
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }

}
