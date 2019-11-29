//
//  ObservationDetailsViewController.swift
//  Field Survey
//
//  Created by Travis Agne on 11/29/19.
//  Copyright © 2019 Travis Agne. All rights reserved.
//

import UIKit

class ObservationDetailsViewController: UIViewController {

    var fieldObservation: FieldObservation?
    @IBOutlet weak var ClassificationImage: UIImageView!
    @IBOutlet weak var ObservationName: UILabel!
    @IBOutlet weak var ObservationDate: UILabel!
    @IBOutlet weak var ObservationDescription: UILabel!
    
    let dateFormatter = DateFormatter()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        
        if let fieldObservation = fieldObservation {
            ObservationName.text = fieldObservation.title
            ObservationDate.text = dateFormatter.string(from: fieldObservation.date)
            ObservationDescription.text = fieldObservation.description
            ClassificationImage.image = UIImage(named: fieldObservation.classification.rawValue)
        }
    }
    
}
