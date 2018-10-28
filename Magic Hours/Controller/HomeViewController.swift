//
//  ViewController.swift
//  Magic Hours
//
//  Created by Quentin Cornu on 28/10/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

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
        var notes = homeView.getNotes()
        print("Adding notes : E(\(notes.energy)) F(\(notes.focus)) M(\(notes.motivation))")
    }

}

