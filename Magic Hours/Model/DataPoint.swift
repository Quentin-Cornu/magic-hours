//
//  DataPoint.swift
//  Magic Hours
//
//  Created by Quentin Cornu on 28/10/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import Foundation
import RealmSwift

enum Criteria: String {
    case energy = "energy"
    case focus = "focus"
    case motivation = "motivation"
    case unknown = "unknown"
}

class DataPoint: Object {
    @objc dynamic var date: Date = Date()
    @objc dynamic var criteria: String = String(Criteria.unknown.rawValue)
    @objc dynamic var note: Int8 = -1
}
