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

        statView.setValues(points: fetchPoints())
    }
    
    // MARK: - Actions
    
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Private functions
    
    private func createEmptyPointArray() -> [Point] {
        var points = [Point]()
        let currentHour = Calendar.current.component(.hour, from: Date())
        
        for i in 0..<12 {
            points.append(Point(label: "\(currentHour-11+i)", value: 0))
        }
        
        return points
    }
    
    private func fetchPoints() -> [Point] {
        let realm = try! Realm()
        var points = createEmptyPointArray()

        let energyPoints = realm.objects(DataPoint.self).filter("criteria = %@ AND date > %@", String(Criteria.energy.rawValue), Date(timeInterval: -60*60*12, since: Date()))
        
        for point in energyPoints {
            let hourInterval = Int(point.date.timeIntervalSinceNow/(60*60))
            let currentHour = Calendar.current.component(.hour, from: Date())
            points[points.count+hourInterval-1] = Point(label: String(currentHour+hourInterval), value: Int(point.note))
        }
        
        return points
    }

}
