//
//  ViewController.swift
//  Magic Hours
//
//  Created by Quentin Cornu on 28/10/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {

    private let homeView: HomeView = {
        let view = HomeView()
        view.dataButton.addTarget(self, action: #selector(handleDataTap), for: .touchUpInside)
        view.statButton.addTarget(self, action: #selector(handleStatTap), for: .touchUpInside)
        view.validateButton.addTarget(self, action: #selector(addNotes), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = homeView
        
    }
    
    // MARK: - Actions
    
    @objc private func handleDataTap() {
        print("Data button tapped")
        
    }
    
    @objc private func handleStatTap() {
        let statViewController = StatViewController()
        present(statViewController, animated: true, completion: nil)
    }
    
    @objc private func addNotes() {
        
        let realm = try! Realm()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        let notes = homeView.getNotes()
        print("Adding notes : E(\(notes.energy)) F(\(notes.focus)) M(\(notes.motivation))")
        
        let newEnergyPoint = DataPoint()
        newEnergyPoint.date = Date()
        newEnergyPoint.criteria = String(Criteria.energy.rawValue)
        newEnergyPoint.note = notes.energy
        
        let newFocusPoint = DataPoint()
        newFocusPoint.date = Date()
        newFocusPoint.criteria = String(Criteria.focus.rawValue)
        newFocusPoint.note = notes.focus
        
        let newMotivationPoint = DataPoint()
        newMotivationPoint.date = Date()
        newMotivationPoint.criteria = String(Criteria.motivation.rawValue)
        newMotivationPoint.note = notes.motivation
        
        try! realm.write {
            realm.add(newEnergyPoint)
            realm.add(newFocusPoint)
            realm.add(newMotivationPoint)
        }
    }

}

