//
//  StatViewController.swift
//  Magic Hours
//
//  Created by Quentin Cornu on 28/10/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit
import RealmSwift

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
        
        let currentHour = Calendar.current.component(.hour, from: Date())
        
        for i in 0..<12 {
            points.append(Point(label: "\(currentHour-11+i)", value: 0))
        }
        
        let realm = try! Realm()
        
        let energyPoints = realm.objects(DataPoint.self).filter("criteria = %@ AND date > %@", String(Criteria.energy.rawValue), Date(timeInterval: -60*60*24, since: Date()))
        
        for point in energyPoints {
            let hourInterval = Int(point.date.timeIntervalSinceNow/(60*60))
            
            points[points.count+hourInterval-1] = Point(label: point.criteria, value: Int(point.note))
        }
        
        statView.setValues(points: points)
    }
    
    // MARK: - Actions
    
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }

}
