//
//  FieldObservation.swift
//  Field Survey
//
//  Created by Travis Agne on 11/29/19.
//  Copyright © 2019 Travis Agne. All rights reserved.
//

import Foundation

enum Classification: String, Codable {
    case amphibian
    case bird
    case fish
    case insect
    case mammal
    case plant
    case reptile
}

struct FieldObservation: Codable {
    var classification: Classification
    var title: String
    var description: String
    var date: Date
}

struct FieldObservations: Codable {
    var status: String
    var observations: [FieldObservation]
}
